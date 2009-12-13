require 'josso_agent.rb'

module Main
  APP_CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), '../config/josso_config.yml'))[RAILS_ENV]

  # <b>Implments the staic method</b> for<br />
  # who(here is ActionController in this plugin) will be extended with this JossoRorAgent Module
  def self.included(base_class)
    base_class.extend(ClassMethods)
  end

  # All the methods In this subModule JossoRorAgent::ClassMethods are static methods for the extended target.
  module ClassMethods
    # PlugIn entry
    def inject_josso_agent
      before_filter :authorize
    end
  end

  private
  # Check the user's authory
  def authorize
    begin
      partner_application_entry_url = request.url
      puts partner_application_entry_url
      if (session[:username].nil?)
        login(partner_application_entry_url, params[:josso_assertion_id])
      else
        is_josso_session_expire(partner_application_entry_url)
      end
    end
  end

  def login(partner_application_entry_url, josso_assertion_id)
    begin
      if (josso_assertion_id.nil?)
        redirect_to APP_CONFIG['josso_root'] + "signon/login.do?josso_back_to=" + partner_application_entry_url
      else
        jossoagent = Jossoagent.new(APP_CONFIG['josso_root'] + 'services/SSOIdentityManager', APP_CONFIG['josso_root'] + 'services/SSOIdentityProvider')
        josso_session_id = jossoagent.get_josso_session_id(josso_assertion_id)
        if (josso_session_id.nil?)
          reset_session
          redirect_to APP_CONFIG['josso_root'] + "signon/login.do?josso_back_to=" + partner_application_entry_url
          # login_error('Sorry! Generate josso_session_id error.')
          return false
        end
        session[:josso_session_id] = josso_session_id
        sso_user = jossoagent.find_user_in_session(josso_session_id)
        if (sso_user.nil?)
          reset_session
          redirect_to APP_CONFIG['josso_root'] + "signon/login.do?josso_back_to=" + partner_application_entry_url
          # login_error('Sorry! Fetching sso_user error.')
          return false
        else
          session[:username] = sso_user.name
          session[:session_timer_at] = Time.now.to_i
        end
        redirect_to partner_application_entry_url
      end
    rescue Exception => e
      #redirect to unique error page of rece system
      puts e
    end
  end

  # Judge the expiry of the session
  def is_josso_session_expire(partner_application_entry_url)
    begin
      puts 30.minutes.to_i
      if(((Time.now.to_i - session[:session_timer_at].to_i) > 1800))
        logout()
      else
        session[:session_timer_at] = Time.now.to_i
      end
    end
  end

  # Logout from the Josso
  def logout()
    begin
      if(!session[:josso_session_id].nil?)
        jossoagent = Jossoagent.new(APP_CONFIG['josso_root'] + 'services/SSOIdentityManager', APP_CONFIG['josso_root'] + 'services/SSOIdentityProvider')
        jossoagent.logout(session[:josso_session_id])
      end
    rescue Exception => e
      puts e
    ensure
      #redirect to unique error page of rece system
      reset_session
      redirect_to APP_CONFIG['partner_application_entry_url']
    end
  end

  def login_error(error_message)
    flash[:error_login] = error_message
    @redirect_to_url = APP_CONFIG['josso_root'] + 'signon/login.do'
  end
end
