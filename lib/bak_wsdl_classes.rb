require 'xsd/qname'

# {http://josso.org/gateway/identity/service/ws/impl}SSONameValuePair
class SSONameValuePair
  @@schema_type = "SSONameValuePair"
  @@schema_ns = "http://josso.org/gateway/identity/service/ws/impl"
  @@schema_element = [["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]], ["value", ["SOAP::SOAPString", XSD::QName.new(nil, "value")]]]

  attr_accessor :name
  attr_accessor :value

  def initialize(name = nil, value = nil)
    @name = name
    @value = value
  end
end

# {http://josso.org/gateway/identity/service/ws/impl}ArrayOfSSONameValuePair
class ArrayOfSSONameValuePair < ::Array
  @@schema_type = "SSONameValuePair"
  @@schema_ns = "http://josso.org/gateway/identity/service/ws/impl"
  @@schema_element = [["item", ["SSONameValuePair", XSD::QName.new(nil, "item")]]]
end

# {http://josso.org/gateway/identity/service/ws/impl}SSOUser
class SSOUser
  @@schema_type = "SSOUser"
  @@schema_ns = "http://josso.org/gateway/identity/service/ws/impl"
  @@schema_element = [["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]], ["properties", ["ArrayOfSSONameValuePair", XSD::QName.new(nil, "properties")]], ["sessionId", ["SOAP::SOAPString", XSD::QName.new(nil, "sessionId")]]]

  attr_accessor :name
  attr_accessor :properties
  attr_accessor :sessionId

  def initialize(name = nil, properties = nil, sessionId = nil)
    @name = name
    @properties = properties
    @sessionId = sessionId
  end
end

# {http://josso.org/gateway/identity/service/ws/impl}SSOIdentityException
class SSOIdentityException < ::StandardError
  @@schema_type = "SSOIdentityException"
  @@schema_ns = "http://josso.org/gateway/identity/service/ws/impl"
  @@schema_element = []

  def initialize
  end
end

# {http://josso.org/gateway/identity/service/ws/impl}NoSuchUserException
class NoSuchUserException < ::StandardError
  @@schema_type = "NoSuchUserException"
  @@schema_ns = "http://josso.org/gateway/identity/service/ws/impl"
  @@schema_element = []

  def initialize
  end
end

# {http://josso.org/gateway/identity/service/ws/impl}SSORole
class SSORole
  @@schema_type = "SSORole"
  @@schema_ns = "http://josso.org/gateway/identity/service/ws/impl"
  @@schema_element = [["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]]]

  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end
end

# {http://josso.org/gateway/identity/service/ws/impl}ArrayOfSSORole
class ArrayOfSSORole < ::Array
  @@schema_type = "SSORole"
  @@schema_ns = "http://josso.org/gateway/identity/service/ws/impl"
  @@schema_element = [["item", ["SSORole", XSD::QName.new(nil, "item")]]]
end
