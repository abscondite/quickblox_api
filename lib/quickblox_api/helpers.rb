module QuickbloxApi
  module Helpers
    def safe_parse(response)
      begin
        JSON.parse(response, symbolize_names: true)
      rescue JSON::ParserError => e
        {}
      end
    end
  end
end
