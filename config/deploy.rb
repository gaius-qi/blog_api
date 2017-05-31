require 'mina/rails'
require 'mina/git'
require 'mina/logs'


set :domain, '106.15.92.227'
set :user, 'qwbtc'
set :deploy_to, '/home/qwbtc/var/WWW/issac_api'
set :repository, 'git@github.com:qwbtc/blog_api.git'
set :branch, 'master'

set :shared_dirs, fetch(:shared_dirs, []).push('public/upload', 'tmp/sockets', 'tmp/pids', 'db/production')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml')

# desc 'Set up environment.'
# task :environment do
#   invoke :'rvm:use', 'ruby-2.4.1@rails5'
# end

desc 'Prepare for deployment.'
task :setup do
  in_path "#{fetch(:shared_path)}" do
    ['config/database.yml', 'config/secrets.yml'].each do |file|
      comment %{Be sure to edit 'shared/#{file}'.}
    end
  end
end

desc 'Deploy current version to the server.'
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'puma:start'
      invoke :'puma:phased_restart'
    end
  end
end
