module QuickbloxApi
  class UserClient < BaseClient
    
    private

    def get_token_params
      super().merge!(user: { login: login, password: password })
    end
  end
end
