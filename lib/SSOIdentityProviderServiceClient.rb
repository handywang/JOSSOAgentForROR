#!/usr/bin/env ruby
require 'defaultDriver.rb'

endpoint_url = ARGV.shift
obj = SSOIdentityProvider.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   assertIdentityWithSimpleAuthentication(in0, in1)
#
# ARGS
#   in0             String - {http://www.w3.org/2001/XMLSchema}string
#   in1             String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   assertIdentityWithSimpleAuthenticationReturn String - {http://www.w3.org/2001/XMLSchema}string
#
# RAISES
#   #   fault           IdentityProvisioningException - {http://josso.org/gateway/identity/service/ws/impl}IdentityProvisioningException
#
in0 = in1 = nil
puts obj.assertIdentityWithSimpleAuthentication(in0, in1)

# SYNOPSIS
#   resolveAuthenticationAssertion(in0)
#
# ARGS
#   in0             String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   resolveAuthenticationAssertionReturn String - {http://www.w3.org/2001/XMLSchema}string
#
# RAISES
#   #   fault           AssertionNotValidException - {http://josso.org/gateway/session/service/ws/impl}AssertionNotValidException, #   fault           IdentityProvisioningException - {http://josso.org/gateway/identity/service/ws/impl}IdentityProvisioningException
#
in0 = nil
puts obj.resolveAuthenticationAssertion(in0)

# SYNOPSIS
#   globalSignoff(in0)
#
# ARGS
#   in0             String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   N/A
#
# RAISES
#   #   fault           IdentityProvisioningException - {http://josso.org/gateway/identity/service/ws/impl}IdentityProvisioningException
#
in0 = nil
puts obj.globalSignoff(in0)


