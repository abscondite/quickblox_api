module QuickbloxApi
  class BaseClient
    include Config, Helpers

    def initialize(opts = {})
      raise(ArgumentError, 'secrets not specified') unless opts[:secrets].is_a?(Hash)
      opts.each do |name, value|
        instance_variable_set("@#{name}", value)
        self.class.send(:attr_reader, name)
      end
    end

    def query(type, path, body = {})
      _query(type, path, body.merge(token: get_token))
    end

    private

    def _query(type, path, body)
      response = connection.send(type) do |request|
        request.url path
        request.headers['Content-Type'] = 'application/json'
        request.body = body.to_json.to_s
      end
      { status: response.status, body: safe_parse(response.body) }
    end

    def get_token
      response = _query(:post, '/session.json', sign(get_token_params))
      unless response[:status] == 201
        raise "Can't get authentication token\n #{JSON.pretty_generate(response)}"
      end
      response[:body][:session][:token]
    end

    def connection
      @connection ||= Faraday.new(url: 'http://' + config[:server]) do |connection|
        connection.request  :url_encoded
        connection.adapter  Faraday.default_adapter
      end
    end

    def sign(parameters)
      signature = HMAC::SHA1.hexdigest(config[:auth_secret], Encoder.encode!(parameters))
      parameters.merge!(signature: signature)
    end

    def get_token_params
      {
        application_id: config[:application_id],
        auth_key: config[:auth_key],
        timestamp: Time.now.to_i,
        nonce: rand(10**10)
      }
    end
  end
end
