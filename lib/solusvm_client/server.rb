require 'active_support/all'
require 'uri'
require 'net/https'
require 'json'

module SolusVMClient
  class Server
    attr_accessor :api_key, :api_hash

    @@actions = [
        :reboot,
        :boot,
        :shutdown,
        :status
    ]

    def initialize(api_key, api_hash)
      self.api_key = api_key
      self.api_hash = api_hash
    end

    def method_missing(m, *args, &block)
      if @@actions.include?(m)
        request(m)
      else
        super
      end
    end

    def info(options = {})
      result = request("info", options)
      if options.include?(:ipaddr)
        result[:ipaddr] = result[:ipaddr].split(",")
      end

      [:hdd, :mem, :bw].each do |k|
        if options.include?(k)
          usage = result[k].split(",")
          result[k] = {
              total: usage[0].to_i,
              used: usage[1].to_i,
              free: usage[2].to_i,
              percentage: usage[3].to_i
          }
        end
      end

      result
    end

    def request(action, options = {})
      uri = URI.parse(SolusVMClient.api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true

      params = {
          key: self.api_key,
          hash: self.api_hash,
          action: action
      }.merge(options)

      request = Net::HTTP::Post.new(uri)
      request.set_form_data(params)

      response = https.request(request)

      result = {}
      hash = Hash.from_xml("<root>#{response.body}</root>")["root"]

      hash.each do |k,v|
        result[k.to_sym] = v
      end

      result
    end
  end
end