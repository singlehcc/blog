---
title: Vue组件之间的通信
date: 2018-03-06 11:42:56
tags:
- vue
- 组件通信
categories:
- 前端
---
在项目中遇到vue组件的通信的问题，本文从实际项目入手，讲解vue组件通信的几种方式
# 场景
![new repository](/images/edit.jpg)
点击编辑需要打开一个模态框，需要将显示隐藏的状态传给子组件
![new repository](/images/modal.jpg)
点击模态框中的取消、确定、关闭按钮需要将模态框隐藏掉，此时需要把当前状态传给父组件。
![new repository](/images/components.jpg)

## 方法一(采用props通信)

父组件通过`isVisible`的`props` 传递给子组件，点击`编辑` 按钮时,改变当前状态

```JavaScript
...
handleEdit() {
  this.editTableVisible = true;
},
...
```
子组件接收到`props`，
![new repository](/images/dialog-html.jpg)
```JavaScript
...
props: {
  isVisible: {
    type: Boolean,
    default: false,
  },
  changeVisible: {
    type: Function,
  },
},
...
```
子组件点击`取消`、`确定`按钮，调用父组件传递给子组件的props————changeVisible
```Html
<div slot="footer" class="dialog-footer">
  <el-button @click="changeVisible">取 消</el-button>
  <el-button type="primary" @click="changeVisible">确 定</el-button>
</div>
```
父组件中`changeVisible`方法如下
```JavaScript
...
changeVisible() {
  this.editTableVisible = false;
},
...
```

## 方案二(采用slot插槽的形式)

插槽的内容可以参考 [vue](https://cn.vuejs.org/v2/guide/components.html#%E4%BD%BF%E7%94%A8%E6%8F%92%E6%A7%BD%E5%88%86%E5%8F%91%E5%86%85%E5%AE%B9)
使用插槽的好处，可以避免父子组件传递状态，模态框显示隐藏的状态直接在子组件中改变。
将子组件`foodEditDialog`包裹住操作按钮`编辑`
```Html
...
<foodEditDialog>
  <el-button
   size="mini"
   @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
</foodEditDialog>
...
```
子组件`foodEditDialog`中插槽
```Html
...
<span @click="handleOpen">
  <slot>
  </slot>
</span>
...
...
handleOpen() {
  this.isVisible = true;
},
...
```
子组件点击`取消`、`确定`按钮，调用`handleClose`方法
```JavaScript
...
handleClose() {
  this.isVisible = false;
},
...
```
