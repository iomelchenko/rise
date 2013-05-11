namespace :db do
  desc "This task puts all version of migrations"
  task :schema_migrations => :environment do
       puts ActiveRecord::Base.connection.select_values(
       	'select version from schema_migrations order by version')
  end	
end