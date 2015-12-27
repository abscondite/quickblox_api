module QuickbloxApi
  # source: https://github.com/revans/quickblox/
  # TODO: logic should be simplified and moved into helpers
  class Encoder
    def self.encode!(sorted_params)
      new(sorted_params).encode!
    end

    def initialize(sorted_params)
      @sorted_params = sorted_params
    end

    def encode!
      var = encode(@sorted_params)

      var.map do |k,v|
        if v.is_a?(Hash)
          v.map { |k1,v1| "#{k}[#{k1}]=#{v1}" }.sort.join('&')

        else
          "#{k}=#{v}"

        end

      end.sort.join('&')
    end

    private

    def encode(value, key = nil, out_hash = {})
      case value
      when Hash
        value.each { |k,v| encode(v, append_key(key, k), out_hash) }
        out_hash

      when Array
        value.each { |v| encode(v, "#{key}[]", out_hash) }
        out_hash

      when nil
        ''
      else
        out_hash[key] = value
        out_hash
      end
    end


    def append_key(root_key, key)
      root_key.nil? ? :"#{key}" : :"#{root_key}[#{key.to_s}]"
    end
  end
end
