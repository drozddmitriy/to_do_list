module Docs
  module V1
    module Authentications
      extend Dox::DSL::Syntax

      document :api do
        resource 'Users' do
          endpoint '/api/v1/auth/login'
          group 'Authentication'
        end
      end

      document :create do
        action 'Login user'
      end

      document :delete do
        action 'Logout user'
      end
    end
  end
end
