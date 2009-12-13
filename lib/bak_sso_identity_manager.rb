require 'wsdl_classes.rb'

require 'soap/rpc/driver'

class SSOIdentityManager < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://fuo.bj.finalist.com:8888/josso/services/SSOIdentityManager"
  MappingRegistry = ::SOAP::Mapping::Registry.new

  MappingRegistry.set(
    SSOUser,
    ::SOAP::SOAPStruct,
    ::SOAP::Mapping::Registry::TypedStructFactory,
    { :type => XSD::QName.new("http://josso.org/gateway/identity/service/ws/impl", "SSOUser") }
  )
  MappingRegistry.set(
    ArrayOfSSONameValuePair,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::Registry::TypedArrayFactory,
    { :type => XSD::QName.new("http://josso.org/gateway/identity/service/ws/impl", "SSONameValuePair") }
  )
  MappingRegistry.set(
    ArrayOfSSORole,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::Registry::TypedArrayFactory,
    { :type => XSD::QName.new("http://josso.org/gateway/identity/service/ws/impl", "SSORole") }
  )
  MappingRegistry.set(
    SSONameValuePair,
    ::SOAP::SOAPStruct,
    ::SOAP::Mapping::Registry::TypedStructFactory,
    { :type => XSD::QName.new("http://josso.org/gateway/identity/service/ws/impl", "SSONameValuePair") }
  )
  MappingRegistry.set(
    SSORole,
    ::SOAP::SOAPStruct,
    ::SOAP::Mapping::Registry::TypedStructFactory,
    { :type => XSD::QName.new("http://josso.org/gateway/identity/service/ws/impl", "SSORole") }
  )

  Methods = [
    [ XSD::QName.new("http://josso.org/gateway/identity/service/ws/impl", "findUser"),
      "",
      "findUser",
      [ ["in", "in0", ["::SOAP::SOAPString"]],
        ["retval", "findUserReturn", ["SSOUser", "http://josso.org/gateway/identity/service/ws/impl", "SSOUser"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded }
    ],
    [ XSD::QName.new("http://josso.org/gateway/identity/service/ws/impl", "findUserInSession"),
      "",
      "findUserInSession",
      [ ["in", "in0", ["::SOAP::SOAPString"]],
        ["retval", "findUserInSessionReturn", ["SSOUser", "http://josso.org/gateway/identity/service/ws/impl", "SSOUser"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded }
    ],
    [ XSD::QName.new("http://josso.org/gateway/identity/service/ws/impl", "findRolesByUsername"),
      "",
      "findRolesByUsername",
      [ ["in", "in0", ["::SOAP::SOAPString"]],
        ["retval", "findRolesByUsernameReturn", ["SSORole[]", "http://josso.org/gateway/identity/service/ws/impl", "SSORole"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded }
    ],
    [ XSD::QName.new("http://josso.org/gateway/identity/service/ws/impl", "userExists"),
      "",
      "userExists",
      [ ["in", "in0", ["::SOAP::SOAPString"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded }
    ],
    [ XSD::QName.new("http://josso.org/gateway/identity/service/ws/impl", "initialize"),
      "",
      "initialize",
      [],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = MappingRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end

