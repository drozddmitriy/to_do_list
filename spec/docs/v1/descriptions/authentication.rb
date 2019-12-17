module Docs
  module V1
    module Authentication
      extend Dox::DSL::Syntax

      document :api do
        resource 'Users' do
          endpoint '/api/v1/auth/login'
          group 'Authentication'
        end
      end

      document :login do
        action 'Login user'
      end
    end
  end
end
