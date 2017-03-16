namespace :data do
  task :create_pages => [:environment] do
    user = User.find(2)
    100.times do |i|
      Page.create(user_id: user.id, title: "title-#{i}", content: "content-#{i}")
      p "create #{i} page"
    end
  end
end
