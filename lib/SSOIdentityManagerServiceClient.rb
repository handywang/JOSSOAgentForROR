#!/usr/bin/env ruby
require 'defaultDriver.rb'

endpoint_url = ARGV.shift
obj = SSOIdentityManager.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   findUser(in0)
#
# ARGS
#   in0             String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   findUserReturn  SSOUser - {http://josso.org/gateway/identity/service/ws/impl}SSOUser
#
# RAISES
#   #   fault           NoSuchUserException - {http://josso.org/gateway/identity/service/ws/impl}NoSuchUserException, #   fault           SSOIdentityException - {http://josso.org/gateway/identity/service/ws/impl}SSOIdentityException
#
in0 = nil
puts obj.findUser(in0)

# SYNOPSIS
#   findUserInSession(in0)
#
# ARGS
#   in0             String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   findUserInSessionReturn SSOUser - {http://josso.org/gateway/identity/service/ws/impl}SSOUser
#
# RAISES
#   #   fault           NoSuchUserException - {http://josso.org/gateway/identity/service/ws/impl}NoSuchUserException, #   fault           SSOIdentityException - {http://josso.org/gateway/identity/service/ws/impl}SSOIdentityException
#
in0 = nil
puts obj.findUserInSession(in0)

# SYNOPSIS
#   findRolesByUsername(in0)
#
# ARGS
#   in0             String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   findRolesByUsernameReturn ArrayOfSSORole - {http://josso.org/gateway/identity/service/ws/impl}ArrayOfSSORole
#
# RAISES
#   #   fault           SSOIdentityException - {http://josso.org/gateway/identity/service/ws/impl}SSOIdentityException
#
in0 = nil
puts obj.findRolesByUsername(in0)

# SYNOPSIS
#   userExists(in0)
#
# ARGS
#   in0             String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   N/A
#
# RAISES
#   #   fault           NoSuchUserException - {http://josso.org/gateway/identity/service/ws/impl}NoSuchUserException, #   fault           SSOIdentityException - {http://josso.org/gateway/identity/service/ws/impl}SSOIdentityException
#
in0 = nil
puts obj.userExists(in0)

# SYNOPSIS
#   initialize
#
# ARGS
#   N/A
#
# RETURNS
#   N/A
#

puts obj.initialize


