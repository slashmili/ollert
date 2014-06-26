namespace :test do
  desc "TODO"
  task features: :environment do
    Rails::TestTask.new("test:features" => "test:prepare") do |t|
      t.pattern = "test/features/**/*_test.rb"
    end
  end
end

Rake::Task["test:run"].enhance ["test:features"]

task test: :"db:test:prepare"
