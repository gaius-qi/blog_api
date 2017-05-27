---
title: API Reference

language_tabs:
  - ruby

toc_footers:
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# 介绍

API 文档

# PagesController

## index
返回所有文章

`get http://localhost:3000/v1/pages`

### header

### 请求参数

### 响应
[
  {
    "id": 261,
    "user_id": 2,
    "category": 0,
    "click_count": 0,
    "content": "文章源内容",
    "content_html": 'markdown编译后html'，
    "summary": '摘要内容',
    "title": '文章标题',
    "tags": [
              "Vue.js",
              "web"
              ],
              "created": "2017-05-22T05:58:55.342Z",
              "updated": "2017-05-22T05:58:55.342Z",
  },
  {
    "id": 262,
    "user_id": 2,
    "category": 0,
    "click_count": 0,
    "content": "文章源内容",
    "content_html": 'markdown编译后html'，
    "summary": '摘要内容',
    "title": '文章标题',
    "tags": [
    "Vue.js",
    "web"
    ],
    "created": "2017-05-22T05:58:55.342Z",
    "updated": "2017-05-22T05:58:55.342Z",
  }
]

## show
返回指定文章内容

`get http://localhost:3000/v1/pages/:id`

### header

### 请求参数

### 响应

{
  "id": 261,
  "user_id": 2,
  "category": 0,
  "click_count": 0,
  "content": "文章源内容",
  "content_html": 'markdown编译后html'，
  "summary": '摘要内容',
  "title": '文章标题',
  "tags": [
            "Vue.js",
            "web"
            ],
  "created": "2017-05-22T05:58:55.342Z",
  "updated": "2017-05-22T05:58:55.342Z",
}

## create
创建文章

`post http://localhost:3000/v1/user/:user_id/pages`

### header

Authorization: Token token=,email=

### 请求参数
{
  "page":{
	   "title": "标题",
	   "content": "内容",
	   "summary": "摘要",
	   "category": "0",
	   "tags": [
		             "web",
		            "git"
		          ]
            }
}

### 响应

{
  "status": {
    "success_message": "save success",
    "success_data": {
      "page_id": 281
    }
  },
  "data": {
    "data": null,
    "code": null,
    "message": "success"
  }
}

## update
更新文章

`put http://localhost:3000/v1/user/:user_id/pages/:id`  

### header

Authorization: Token token=,email=

### 请求参数
{
  "page":{
	   "title": "标题改",
	   "content": "内容改",
	   "summary": "摘要改",
	   "category": "2",
	   "tags": [
		             "web",
		            "Ruby"
		          ]
            }
}

### 响应
{
  "status": {
    "success_message": "update success",
    "success_data": {
      "page_data": 281
    }
  },
  "data": {
    "data": null,
    "code": null,
    "message": "success"
  }
}
## destroy
删除文章和该文章的关联表page_tags内容

`delete http://localhost:3000/v1/user/:user_id/pages/:id`

### header

Authorization: Token token=,email=

### 请求参数

### 响应
{
  "status": {
    "success_message": "destory page"
  },
  "data": {
    "code": null,
    "message": "success"
  }
}

## pages_date_total
返回文章对应时间表（归档内容）

`get http://localhost:3000/v1/pages_date_total`

### header

### 请求参数

### 响应
[
  [
    "201705",
    11
  ],
  [
    "201704",
    6
  ],
  [
    "201703",
    6
  ],
  [
    "201702",
    2
  ]
]

## paging
分页内容(返回某的内容)

`get http://localhost:3000/v1/paging/:page_number`

### header

### 请求参数

### 响应
文章总数： page_count_total

一页多少篇：page_count

{
  "data": {
    "meta": {
      "page_count_total": 25,
      "page_count": 4,
      "category_count": 5
    },
    "attributes": [
    {
      "category": 0,
      "click_count": null,
      "content": "内容",
      "content_html": "<p>内容</p>\n",
      "created": "2017-05-22T16:10:42.664Z",
      "id": 275,
      "summary": "摘要",
      "title": "标题",
      "updated": "2017-05-22T16:10:42.664Z",
      "user_id": 2,
      "tags": [
      "web",
      "git"
      ]
    },
    {
      "category": 0,
      "click_count": null,
      "content": "内容",
      "content_html": "<p>内容</p>\n",
      "created": "2017-05-22T16:10:42.664Z",
      "id": 274,
      "summary": "摘要",
      "title": "标题",
      "updated": "2017-05-22T16:10:42.664Z",
      "user_id": 2,
      "tags": [
      "web",
      "git"
      ]
    }
    ]
  }
}

## archive_pages
返回对应归档某时间段所有文章(:data参数为年份和月份拼写 例："201705")

`get http://localhost:3000/v1/archive_pages/:date`

### header

### 请求参数

### 响应
[
  {
    "category": 0,
    "click_count": null,
    "content": "内容",
    "content_html": "<p>内容</p>\n",
    "created": "2017-05-22T16:10:42.664Z",
    "id": 275,
    "summary": "摘要",
    "title": "标题",
    "updated": "2017-05-22T16:10:42.664Z",
    "user_id": 2,
    "tags": [
      "web",
      "git"
    ]
  },
  {
    "category": 0,
    "click_count": null,
    "content": "内容",
    "content_html": "<p>内容</p>\n",
    "created": "2017-05-22T16:10:42.664Z",
    "id": 274,
    "summary": "摘要",
    "title": "标题",
    "updated": "2017-05-22T16:10:42.664Z",
    "user_id": 2,
    "tags": [
      "web",
      "git"
    ]
  }
]

## click_page
点击阅读文章， 则增加redis中pages_click哈希中对应文章的点击数，每晚3:00将$redis中对应文章点击数保存到数据库pages表中

`get http://localhost:3000/v1/click_page/:id`

### header

### 请求参数

### 响应
{
  "status": {
    "success_message": "click success"
  },
  "data": {
    "code": null,
    "message": "success"
  }
}

## page_click_count
取redis中pages_click哈希中对应文章的点击数

`get http://localhost:3000/v1/page_click_count/:id`

### header

### 请求参数

### 响应
1

## category_pages

种类对应的所有文章

`get http://localhost:3000/v1/category_pages/:category`

### header

### 请求参数

### 响应

[
  {
    "category": 2,
    "click_count": null,
    "content": "内容该",
    "content_html": "<p>内容该</p>\n",
    "created": "2017-05-24T01:01:53.604Z",
    "id": 281,
    "summary": "摘要改",
    "title": "标题改",
    "updated": "2017-05-24T01:01:53.604Z",
    "user_id": 2,
    "tags": [
      "web",
      "Ruby"
    ]
  },
  {
    "category": 2,
    "click_count": null,
    "content": "内容该",
    "content_html": "<p>内容该</p>\n",
    "created": "2017-05-24T01:00:48.516Z",
    "id": 280,
    "summary": "摘要改",
    "title": "标题改",
    "updated": "2017-05-24T01:00:48.516Z",
    "user_id": 2,
    "tags": [
      "web",
      "Ruby"
    ]
  }
]


# TagsController

## index
返回所有tag

`get http://localhost:3000/v1/tags`

### header

### 请求参数

### 响应
[
  "Ruby",
  "ruby on rails",
  "server",
  "Vue.js",
  "web",
  "XML",
  "PHP",
  "C++",
  "Java",
  "Python",
  "Perl",
  "ES6",
  "CSS3",
  "HTML5",
  "React.js",
  "Javascript",
  "Postgresql",
  "Redis",
  "Elixir",
  "Phoenix",
  "http2",
  "CORS"
]

## tag_pages
返回相应tag对应的pages集合

`get http://localhost:3000/v1/tag_pages/:tag_name`

### header

### 请求参数

### 响应
[
  {
    "id": 261,
    "user_id": 2,
    "category": 0,
    "click_count": 0,
    "content": "文章源内容",
    "content_html": 'markdown编译后html'，
    "summary": '摘要内容',
    "title": '文章标题',
    "tags": [
              "Vue.js",
              "web"
              ],
    "created": "2017-05-22T05:58:55.342Z",
    "updated": "2017-05-22T05:58:55.342Z",
  },
  {
    "id": 261,
    "user_id": 2,
    "category": 0,
    "click_count": 0,
    "content": "文章源内容",
    "content_html": 'markdown编译后html'，
    "summary": '摘要内容',
    "title": '文章标题',
    "tags": [
              "Vue.js",
              "web"
              ],
    "created": "2017-05-22T05:58:55.342Z",
    "updated": "2017-05-22T05:58:55.342Z",
  }
]

## category
返回所有的category

`get http://localhost:3000/v1/category`

### header

### 请求参数

### 响应
[
  [
    "前端",
    0
  ],
  [
    "后端",
    1
  ],
  [
    "语言",
    2
  ],
  [
    "新闻",
    3
  ],
  [
    "生活",
    4
  ]
]


# UsersController

## update

`put http://localhost:3000/v1/users/:id`

### header
Authorization: Token token=,email=

### 请求参数
{
  "user": {
    "name": "qwbtc"
  }
}

### 响应

{
  "data": {
    "id": "2",
    "type": "users",
    "attributes": {
      "name": "qwbtc"
    }
  }
}

## show

`get http://localhost:3000/v1/users/:id`

###header

### 请求参数

### 响应
{
  "data": {
    "id": "2",
    "type": "users",
    "attributes": {
      "name": "qwbtc",
      "email": "234@234.com",
      "admin": false,
      "authentication-token": "QsGxgMdiX+mOreeTdObQXcl4MyIhOm+oZ6MLJ0gympfAVqo4VF6gXq5/NZEBG9VKSOiYgnMeeSMQu9It9W4Tfg==",
      "activated": "2017-03-18T12:23:12.633Z",
      "created-at": "2017-03-18T12:23:12.707Z",
      "updated-at": "2017-05-22T15:07:42.843Z"
    }
  }
}
