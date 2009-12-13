require 'xsd/qname'

# {http://josso.org/gateway/identity/service/ws/impl}SSOIdentityException
class SSOIdentityException
  @@schema_type = "SSOIdentityException"
  @@schema_ns = "http://josso.org/gateway/identity/service/ws/impl"
  @@schema_element = []

  def initialize
  end
end

# {http://josso.org/gateway/identity/service/ws/impl}IdentityProvisioningException
class IdentityProvisioningException < ::StandardError
  @@schema_type = "IdentityProvisioningException"
  @@schema_ns = "http://josso.org/gateway/identity/service/ws/impl"
  @@schema_element = []

  def initialize
  end
end

# {http://josso.org/gateway/session/service/ws/impl}AssertionException
class AssertionException
  @@schema_type = "AssertionException"
  @@schema_ns = "http://josso.org/gateway/session/service/ws/impl"
  @@schema_element = []

  def initialize
  end
end

# {http://josso.org/gateway/session/service/ws/impl}AssertionNotValidException
class AssertionNotValidException < ::StandardError
  @@schema_type = "AssertionNotValidException"
  @@schema_ns = "http://josso.org/gateway/session/service/ws/impl"
  @@schema_element = []

  def initialize
  end
end
