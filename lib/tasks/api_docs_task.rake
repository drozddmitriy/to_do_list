namespace :api do
  namespace :doc do
    desc 'Generate API docs'
    task md: :environment do
      require 'rspec/core/rake_task'

      RSpec::Core::RakeTask.new(:api_spec) do |t|
        t.rspec_opts = '-f Dox::Formatter --order defined --tag dox --out docs.md --require rails_helper'
      end

      Rake::Task['api_spec'].invoke
    end

    desc 'Generate API html'
    task html: :md do
      `aglio -i docs.md -o docs.html`
    end
  end
end
