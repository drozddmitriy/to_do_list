module Docs
  module V1
    module Projects
      extend Dox::DSL::Syntax

      document :api do
        resource 'Projects' do
          endpoint 'api/v1/projects'
          group 'Projects'
        end
      end

      document :index do
        action 'Get projects'
      end

      document :get do
        action 'Get a project'
      end

      document :create do
        action 'Create a project'
      end

      document :edit do
        action 'Edit a project'
      end

      document :delete do
        action 'Delete a project'
      end
    end
  end
end
