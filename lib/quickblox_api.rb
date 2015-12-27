require 'hmac-sha1'
require 'faraday'

require 'quickblox_api/version'
require 'quickblox_api/encoder'
require 'quickblox_api/helpers'
require 'quickblox_api/config'
require 'quickblox_api/base_client'
require 'quickblox_api/client'
require 'quickblox_api/user_client'

module QuickbloxApi
  def self.client(opts)
    QuickbloxApi::Client.new(secrets: opts)
  end

  def self.user_client(opts)
    QuickbloxApi::UserClient.new(opts)
  end
end
