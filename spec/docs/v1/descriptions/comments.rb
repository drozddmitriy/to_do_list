module Docs
  module V1
    module Comments
      extend Dox::DSL::Syntax

      document :api do
        resource 'Comments' do
          endpoint 'api/v1/comments'
          group 'Comments'
        end
      end

      document :index do
        action 'Get comments'
      end

      document :create do
        action 'Create a comment'
      end

      document :delete do
        action 'Delete a comment'
      end
    end
  end
end
