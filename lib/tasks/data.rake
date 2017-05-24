namespace :data do
  task :create_pages => [:environment] do
    user = User.find(2)
    100.times do |i|
      Page.create(user_id: user.id, title: "title-#{i}", content: "content-#{i}")
      p "create #{i} page"
    end
  end

  task :create_real_pages => [:environment] do
    include MdHelper
    user = User.find(2)
    content =
'# vue-beauty-paginator <a href="https://www.npmjs.com/package/vue-beauty-paginator"><img src="https://img.shields.io/npm/v/vuejs-paginator.svg" alt="Version"></a> [![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat)](LICENSE)
> Vue.js分页组件.

vue-beauty-paginator是一个简单但功能强大的插件，它可以描绘出漂亮的分页标签。

![vue brauty paginator preview](https://github.com/qwbtc/vue-beauty-paginator/blob/master/dist/dist/image/show.gif).

### 安装
> Vue.js 1.0.0+
#### npm
``` bash
npm install vuejs-beauty-paginator --save
```

### 用法
作为组件引用
```js
import vuePaginator from "vuejs-beauty-paginator"
```

### 示例
在父组件example.vue中
```js
<template>
  <pagination
    :per-page="perPages" // 分页标签中可见的页码数，其他以...代替, 必须是奇数
    :page-index="currentPage" // 当前页数
    :total="count" // 总页数
    :page-size="pageSize" // 每页显示数据的数量
    @change="pageChange"> // 当点击组件跳页时，子组件中通过调用change方法给父组件传递点击的页码，父组件通过调用pageChange方法来请求新数据
  </pagination>
</template>
<script>
import vuePaginator from "vuejs-beauty-paginator"
export default {
  data () {
      return {
      // 分页标签中可见的页码数，其他以...代替, 必须是奇数
      perPages：4
      // 每页显示条数
      pageSize: 10,
      // 当前页码
      currentPage: 1,
      // 总记录数，需要请求此数据，并赋值
      count: 0
    }
  },
  methods: {
      ...mapActions([
        "getPagesInfo"
      ]),
      // 跳页时请求数据
      pageChange (page) {
      this.currentPage = page
      //后台请求该页数据
      this.getPagesInfo(this.currentPage)
    }
  }
}
</script>
```

### prop
| Name          | Type     | Default | Required | Description
| :------------ | :--------| :-------| :--------| :-----------
| perPages      | Number   | 5       | false    | 分页标签中可见的页码数，其他以...代替, 必须是奇数
| pageIndex     | Number   | 1       | true     | 当前页码
| pageSize      | Number   | 1       | true     | 每页显示条数
| total         | Number   | 1       | true     | 总记录数

### 开发环境设置
``` bash
# 安装依赖
npm install

# 生成源文件
npm run build
```

### License
[MIT](http://opensource.org/licenses/MIT)
'
    content_html = markdown(content)

    2.times do |i|
      page = Page.create(
                user_id: user.id, title: "Rake简介与编写",
                content: content,
                content_html: content_html,
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
                content: content,
                content_html: content_html,
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
