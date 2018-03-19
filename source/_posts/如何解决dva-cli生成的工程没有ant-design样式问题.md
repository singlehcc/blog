---
title: 如何解决dva-cli生成的工程没有ant-design样式问题
date: 2018-01-24 11:42:56
tags:
---
之前用`dva-cli`脚手架搭建react工程，引入了`ant`,发现没有样式应用,但元素的`class`已经添加。网上搜了，相应的资料寥寥无几。

## 解决方案
#### 配置.roadhogrc文件
`roadhogrc`初始化文件内容为
```JavaScript
{
"entry": "src/index.js",
"env": {
  "development": {
    "extraBabelPlugins": [
      "dva-hmr",
      "transform-runtime"
    ]
  },
  "production": {
    "extraBabelPlugins": [
      "transform-runtime"
    ]
  }
}
}
```
此时没引入antd的样式，修改配置增加样式引入
```JavaScript
{
  "entry": "src/index.js",
  "env": {
    "development": {
      "extraBabelPlugins": [
        "dva-hmr",
        "transform-runtime",
        ["import", { "libraryName": "antd", "style": true }]
      ]
    },
    "production": {
      "extraBabelPlugins": [
        "transform-runtime",
        ["import", { "libraryName": "antd", "style": true }]
      ]
    }
  }
}
```
添加完成后，`npm run start`，发现有报错，报错内容为
`This is the error: Unknown plugin "import" specified in "[..]/.babelrc"`。
原因： 没有安装`babel-plugin-import`依赖。
解决： `npm install babel-plugin-import --save-dev`即可。
最后 `npm run start`，发现样式已添加。
