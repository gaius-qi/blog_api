require 'mina/rails'
require 'mina/git'

set :application_name, 'isaac_api'
#服务器地址,是使用ssh的方式登录服务器
set :domain, 'qwbtc@106.15.92.227'
#服务器中项目部署位置
set :deploy_to, '/home/qwbtc/var/WWW/isaac_api'
#git代码仓库
set :repository, 'https://github.com/qwbtc/blog_api.git'
#git分支
set :branch, 'master'
# 中括号里的文件 会出现在服务器项目附录的shared文件夹中，这里加入了secrets.yml，环境密钥无需跟开发计算机一样
set :shared_paths, ['config/database.yml', 'log', 'config/secrets.yml']

# # 这个块里面的代码表示运行 mina setup时运行的命令
task :setup => :environment do
  # 在服务器项目目录的shared中创建log文件夹
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  # 在服务器项目目录的shared中创建config文件夹 下同
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue! %[touch "#{deploy_to}/#{shared_path}/config/secrets.yml"]

  # puma.rb 配置puma必须得文件夹及文件
  queue! %[mkdir -p "#{deploy_to}/shared/tmp/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/pids"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/sockets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/sockets"]

  queue! %[touch "#{deploy_to}/shared/config/puma.rb"]
  queue  %[echo "-----> Be sure to edit 'shared/config/puma.rb'."]

  # tmp/sockets/puma.state
  queue! %[touch "#{deploy_to}/shared/tmp/sockets/puma.state"]
  queue  %[echo "-----> Be sure to edit 'shared/tmp/sockets/puma.state'."]

  # log/puma.stdout.log
  queue! %[touch "#{deploy_to}/shared/log/puma.stdout.log"]
  queue  %[echo "-----> Be sure to edit 'shared/log/puma.stdout.log'."]

  # log/puma.stdout.log
  queue! %[touch "#{deploy_to}/shared/log/puma.stderr.log"]
  queue  %[echo "-----> Be sure to edit 'shared/log/puma.stderr.log'."]

  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
