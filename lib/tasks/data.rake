namespace :data do
  task :create_pages => [:environment] do
    user = User.find(2)
    100.times do |i|
      Page.create(user_id: user.id, title: "title-#{i}", content: "content-#{i}")
      p "create #{i} page"
    end
  end

  task :create_real_pages => [:environment] do
    user = User.find(2)
    2.times do |i|
      page = Page.create(
                user_id: user.id, title: "Rake简介与编写",
                content: "Rake的意思是Ruby Make,一个用ruby开发的代码构建工具.1.以任务的方式创建和运行脚本 当然,你可以用脚本来创建每一个你希望自动运行的任务.但是,对于大型的应用来说,你几乎总是需要为数据库迁移(比如Rails中db:migrate任务)、清空缓存、或者代码维护等等编写脚本.对于每一项任务,你可能都需要写若干脚本,这会让你的管理变得复杂.那么,把它们用任务的方式整理到一起,会让管理变得轻松很多.2.追踪和管理任务之间的依赖 Rake还提供了轻松管理任务之间依赖的方式.比如,migrate任务和schema:dump任务都依赖于 connect_to_database任务,那么在migrate任务调用之前,connect_to_database任务都会被执行.Rails预定义了大量的Rake任务,在Rails应用的开发过程中,你想必已经在大量使用它们了.在Rails中,所有的Rake任务都放在 rails目录的lib/tasks目录下(在作者的环境下是C:\Ruby\lib\ruby\gems\1.8\gems\rails-2.3.5 \lib\tasks),所有的rake任务都以.rake作为后缀名,这些以.rake结尾的文件会被自动加载到你的环境中.你可以到一个已有的 Rails工程根目录下键入rake --tasks,可以看到很多的rake任务已经为你整装待发了.",
                summary: "Rake的意思是Ruby Make,一个用ruby开发的代码构建工具.1.以任务的方式创建和运行脚本 当然,你可以用脚本来创建每一个你希望自动运行的任务.但是,对于大型的应用来说,你几乎总是需要为数据库迁移(比如Rails中db:migrate任务)、清空缓存、或者代码维护等等编写脚本.对于每一项任务,你可能都需要写若干脚本,这会让你的管理变得复杂.那么,把它们用任务的方式整理到一起,会让管理变得轻松很多.2.追踪和管理任务之间的依赖 Rake还提供了轻松管理任务之间依赖的方式.比如,migrate任务和schema:dump任务都依赖于 connect_to_database任务,那么在migrate任务调用之前,connect_to_database任务都会被执行.",
                category: 1,
                created: Time.now - (i * 10).days,
                updated: Time.now - (i * 10).days
              )
      tag_ary = ['Ruby', 'ruby on rails', 'server']
      tag_ary.each do |element|
        if tag = Tag.find_by(name: element)
          PageTag.create(page_id: page.id, tag_id: tag.id)
        else
          page.tags.create(name: element)
        end
      end
    end

    10.times do |i|
      page = Page.create(
                user_id: user.id,
                title: "vue全栈开发部署你需要知道的一些事",
                content: "随着 vuejs 作者尤雨溪发布消息，不再继续维护vue-resource，并推荐大家使用 axios 开始，axios 被越来越多的人所了解。本来想在网上找找详细攻略，突然发现，axios 的官方文档本身就非常详细！！有这个还要什么自行车！！所以推荐大家学习这种库，最好详细阅读其官方文档。大概翻译了一下 axios 的官方文档，相信大家只要吃透本文再加以实践，axios 就是小意思啦！！ 在移动端，使用滚动来处理业务逻辑的情况有很多，例如列表的滚动加载数据，下拉刷新等等都需要利用滚动的相关知识，但是滚动事件在不同的移动端机型却又有不同的表现，下面就来一一总结一下。如果大家发现我的文章中存在问题，那么请不吝赐教，大家共同进步。如果我转载的文章原作者不愿自己文章被转载，请告知，我会及时删除。如果你觉得我写的对你有点帮助，就点赞鼓励一下，三克油。",
                summary: "随着 vuejs 作者尤雨溪发布消息，不再继续维护vue-resource，并推荐大家使用 axios 开始，axios 被越来越多的人所了解。本来想在网上找找详细攻略，突然发现，axios 的官方文档本身就非常详细！！有这个还要什么自行车！！所以推荐大家学习这种库，最好详细阅读其官方文档。大概翻译了一下 axios 的官方文档，相信大家只要吃透本文再加以实践，axios 就是小意思啦！！ 在移动端，使用滚动来处理业务逻辑的情况有很多，例如列表的滚动加载数据，下拉刷新等等都需要利用滚动的相关知识，但是滚动事件在不同的移动端机型却又有不同的表现，下面就来一一总结一下。",
                category: 0,
                created: Time.now - (i * 10).days,
                updated: Time.now - (i * 10).days
              )
      tag_ary = ['Vue.js', 'web']
      tag_ary.each do |element|
        if tag = Tag.find_by(name: element)
          PageTag.create(page_id: page.id, tag_id: tag.id)
        else
          page.tags.create(name: element)
        end
      end
    end
  end

  task :create_tags => [:environment] do
    tag_ary = ['XML', 'PHP', 'C++', 'Java', 'Python', 'Perl', 'ES6', 'CSS3', 'HTML5', 'React.js', 'Javascript', 'Postgresql', 'Redis', 'Elixir', 'Phoenix', 'http2', 'CORS']
    tag_ary.each do |element|
      Tag.create(name: element)
    end
  end

  task :create_times => [:environment] do
    Page.all.each_with_index do |page, index|
      page.created = Time.now - (index * 10).days
      page.updated = Time.now - (index * 10).days
      page.save
    end
  end
end
