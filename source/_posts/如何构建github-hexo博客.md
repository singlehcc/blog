---
title: 快速构建github+hexo博客
date: 2018-01-18 11:42:56
tags:
- github
- hexo
categories:
- hexo
---
一直想搭建一个属于自己的博客，网上看了很多教程有些不够详细有些又漏了比较重要的步骤。


## 准备工作
#### 安装Node.js
在windows下安装node.js非常简单，[node.js](https://nodejs.org/en/download/)官方网站下一个即可。安装完成后，在Windows环境下，请打开命令提示符，然后输入`node -v`，如果安装正常，你应该看到这样的输出：`vx.x.x`,x为版本号

#### 安装Hexo
利用 npm 命令即可安装。在Windows环境下，请打开命令提示符,然后输入`npm install -g hexo`。
hexo的一些操作命令这里就不详细赘述了，官方文档都很详细。 [hexo](https://hexo.io/zh-cn/docs/index.html)
_注_:`npm`其实是Node.js的包管理工具,npm已经在Node.js安装的时候顺带装好了 同理你也可以通过输入`npm -v`查看是否安装成功

## 配置github
### 步骤
1. 首先你要注册一个github账号
2. 新建一个repo,repo名字格式为： `yourname.github.io` 例如：`singlehcc.github.io` ( 因为我已经创建，所以会有错误提示 )

 ![new repository](/images/new-repo.jpg)  

 ![repository name](/images/repo-name.jpg)
3. 克隆repo到本地  

### github原理
1. `yourname.github.io`一个最大的特点就是其master中的html静态文件，可以通过链接http://yourname.github.io来直接访问。
2. 简单来讲只需要将`hexo generate`生成的静态文件提交到新建的repository即可访问到。

## 创建博客
1.  最新hexo版本 不需要`npm install`
```Shell
    $ hexo init <folder>
    $ cd <folder>
    $ npm install
    ```
2. 新建完成后，指定文件夹的目录如下：
  ```JavaScript
  ├── _config.yml
  ├── package.json
  ├── scaffolds
  ├── source
  |   ├── _drafts
  |   └── _posts
  └── themes
  ```
3. 编辑`_config.yml`文件最后，
  ```JavaScript
    deploy:
    type: git
    repo: git@github.com:singlehcc/singlehcc.github.io.git
    branch: master
  ```
  附[_config.yml具体配置信息](https://hexo.io/zh-cn/docs/configuration.html)

3. 生成博客的静态文件
  `hexo generate`

4. 在部署之前需要安装一个依赖  
  `$ npm install hexo-deployer-git --save`

5. 部署
   `hexo deploy`

若凭上述步骤成功提交的，那么恭喜，你的博客部署完成。遗憾的是使用上述命令，偶尔还是会有莫名其妙的问题产生。下面我列一下我遇到的问题，并附上解决办法：
### SSH 公钥问题
`hexo deploy`时遇到 `Permission denied(public key)`
原因是： 你的SSH 公钥没有添加到github上
解决方法：
1. SSH 公钥默认储存在账户的主目录下的 ~/.ssh 目录。我电脑上的地址是`C:\Users\wpwl006\.ssh` ,
在这文件夹中若存在`.pub`文件，说明已经有 SSH 公钥。若没有则在命令行中输入`ssh-keygen -t rsa -C "email@email.com"`按3个回车，密码为空，生成秘钥。
2. 将已存在的id_rsa.pub，复制全文到 https://github.com/settings/ssh ，Add SSH key，粘贴进去。
hexo使用
3. 然后再`hexo deploy`部署一下。
### 简单粗暴解决方法
若以上方法也不能解决，提供一种简单粗暴的解决方法
将`hexo generate` 生成的静态文件 完全拷贝到克隆下来的`yourname.github.io`的git目录下, 然后在提交到远程`master`分支上

### 参考
* [手把手教你建github技术博客by hexo](http://wuxiaolong.me/2015/07/31/build-blog-by-hexo/)
* [手把手教你使用Hexo + Github Pages搭建个人独立博客](https://segmentfault.com/a/1190000004947261)
