# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

# added backuper by Pasha
spec = Gem::Specification.find_by_name 'db-backuper'
Dir["#{spec.gem_dir}/lib/tasks/*.rake"].each do |path|
  load path
end

Rails.application.load_tasks
