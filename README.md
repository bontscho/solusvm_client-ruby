# SolusVMClient

This Gem is a simple implementation of the SolusVM Client API (http://docs.solusvm.com/client_api)

## Installation

Add this line to your application's Gemfile:

    gem 'solusvm_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install solusvm_client

## Usage

### Initializing

Initialize the API URL. For Rails put this into `config/initializers/solusvm_client.rb`

```ruby

# require 'solusvm_client' # include gem if you are not inside rails

SolusVMClient.setup do |config|
  config.api_url = "https://myserver.com:5656/api/client/command.php"
end
```

### Instantiating a Server Object

```ruby

server = SolusVMClient::Server.new("MY API KEY", "MY API HASH")
```

### API Functions

* reboot
* boot
* shutdown
* status
* info

#### Examples

```ruby

result = server.reboot

# result => {
#            :status => "success",
#         :statusmsg => "rebooted",
#          :hostname => "myhostname.com",
#         :ipaddress => "123.123.123.123",
#            :vmstat => nil
#     }

result = server.shutdown

# result => {
#            :status => "success",
#         :statusmsg => "shutdown",
#          :hostname => "myhostname.com",
#         :ipaddress => "123.123.123.123",
#            :vmstat => nil
#     }

result = server.boot

# result => {
#            :status => "success",
#         :statusmsg => "booted",
#          :hostname => "myhostname.com",
#         :ipaddress => "123.123.123.123",
#            :vmstat => nil
#     }

result = server.status

# result => {
#            :status => "success",
#         :statusmsg => "online",
#            :vmstat => "online",
#          :hostname => "myhostname.com",
#         :ipaddress => "123.123.123.123"
#     }

result = server.info

# result => {
#         :status => "success",
#      :statusmsg => nil,
#       :hostname => "myhostname.com",
#      :ipaddress => "123.123.123.123",
#         :vmstat => nil
#  }

result = server.info({ ipaddr: true, hdd: true, mem: true, bw: true })

# result => {
#         :ipaddr => [
#          [0] "123.123.123.123",
#          [1] "0:0:0:0:0:ffff:7b7b:7b7b"
#      ],
#            :hdd => {
#               :total => 10737418240,
#                :used => 775327744,
#                :free => 9962090496,
#          :percentage => 7
#      },
#             :bw => {
#               :total => 107374182400,
#                :used => 256204956,
#                :free => 107117977444,
#          :percentage => 0
#      },
#            :mem => {
#               :total => 134217728,
#                :used => 25272320,
#                :free => 108945408,
#          :percentage => 19
#      },
#         :status => "success",
#      :statusmsg => nil,
#       :hostname => "myhostname.com",
#      :ipaddress => "123.123.123.123",
#         :vmstat => nil
#  }


```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/solusvm_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
