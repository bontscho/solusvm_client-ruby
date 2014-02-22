require 'active_support/core_ext/module/attribute_accessors'
require 'solusvm_client/server'
require "solusvm_client/version"

module SolusVMClient
  mattr_accessor :api_url
  @@api_url = nil

  def self.setup
    yield self if block_given?
  end
end