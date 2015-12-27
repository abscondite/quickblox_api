module QuickbloxApi
  module Config

      private

      def config
        {
          application_id: application_id,
          auth_key: auth_key,
          auth_secret: auth_secret,
          server: server,
          user_owner_id: user_owner_id
        }
      end

      def application_id
        raise(ArgumentError, 'application_id not specified in secrets') unless secrets[:application_id]
        secrets[:application_id]
      end

      def auth_key
        raise(ArgumentError, 'auth_key not specified in secrets') unless secrets[:auth_key]
        secrets[:auth_key]
      end

      def auth_secret
        raise(ArgumentError, 'auth_secret not specified in secrets') unless secrets[:auth_secret]
        secrets[:auth_secret]
      end

      def user_owner_id
        raise(ArgumentError, 'user_owner_id not specified in secrets') unless secrets[:user_owner_id]
        secrets[:user_owner_id]
      end

      def server
        secrets[:server] || 'api.quickblox.com'
      end
  end
end
