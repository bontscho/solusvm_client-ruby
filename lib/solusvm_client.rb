require 'active_support/core_ext/module/attribute_accessors'
require_relative 'solusvm_client/server'
require_relative 'solusvm_client/version'

module SolusVMClient
  mattr_accessor :api_url, :verify_ssl
  @@api_url = nil
  @@verify_ssl = true

  def self.setup
    yield self if block_given?
  end
end