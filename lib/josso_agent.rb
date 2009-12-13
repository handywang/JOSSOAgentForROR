require 'sso_identity_manager.rb' 
require 'sso_identity_provider.rb'

class Jossoagent
  
  def initialize(sso_identity_manager_endpoint_url = nil,sso_identity_provider_endpoint_url = nil)
    @agent_identity_manager = SSOIdentityManager.new(sso_identity_manager_endpoint_url)
    @sso_identity_provider = SSOIdentityProvider.new(sso_identity_provider_endpoint_url)
  end
  
  def fin_roles_by_username(username)
    @agent_identity_manager.findRolesByUsername(username)
  end
  
  def find_user(username)
    begin
      @roles = @agent_identity_manager.findUser(username)
    rescue SOAP::FaultError
      return nil
    else
      return @roles
    end
  end
  
  def find_user_in_session(josso_session_id)
    begin
      @sso_user = @agent_identity_manager.findUserInSession(josso_session_id)
    rescue SOAP::FaultError
      return nil
    else
      return @sso_user
    end
  end

  def get_josso_session_id(josso_assertionid)
    begin
      @josso_session_id = @sso_identity_provider.resolveAuthenticationAssertion(josso_assertionid)
    rescue SOAP::FaultError
      return nil
    else
      return @josso_session_id
    end
  end
  
  def logout(josso_session_id)
    @sso_identity_provider.globalSignoff(josso_session_id)
  end
  
end
