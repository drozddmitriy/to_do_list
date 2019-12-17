module Docs
  module V1
    module Tasks
      extend Dox::DSL::Syntax

      document :api do
        resource 'Tasks' do
          endpoint 'api/v1/tasks'
          group 'Tasks'
        end
      end

      document :index do
        action 'Get tasks'
      end

      document :get do
        action 'Get a task'
      end

      document :create do
        action 'Create a task'
      end

      document :edit do
        action 'Edit a task'
      end

      document :delete do
        action 'Delete a task'
      end
    end
  end
end
