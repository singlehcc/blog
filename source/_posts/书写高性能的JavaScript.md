---
title: JavaScript性能优化与分析
date: 2018-01-31 15:00
tags:
---
> 导语：前端工程师不但要保证完成界面的规划与开发，并且同时需要保证代码的质量，其中Javscript的运行速度则变得非常重要，本期从浏览器、代码层面入手，结合了开发者工具进行分析, 总结了一些常用的优化手段和法则.

## JavaScript 性能优化

> @来源： yj1028.me 2017.10.28    <span style="padding: 10px"></span> [阅读原文 ->](https://juejin.im/entry/59e6f1336fb9a0450808bdc3)

本文从chrome浏览器下分析一个js库的执行时间（分析的方式值得借鉴），通过浏览器可以很直观的看出该js的解析时间、执行时间和占用内存的情况。同时给出一些参考值，即超出该参考值意味着该js需要优化。

## 分析运行时性能

> @来源： Chrome 开发者工具中文文档    <span style="padding: 10px"></span> [阅读原文 ->](http://www.css88.com/doc/chrome-devtools/rendering-tools/)

本文通过Chrome分析运行时的性能，得出如下结论：
* 不要编写强制浏览器重新计算布局的JavaScript。分离读写函数，并首先执行读取。
* 不要使您的CSS过于复杂。使用更少的CSS和保持你的CSS选择器简单。尽可能多避免layout。
* 总是选择不触发layout的CSS。
* 绘画可能占用比任何其他渲染活动更多的时间。注意绘制瓶颈。

## js性能优化的小知识

> @来源： 静逸   2015-05-26    <span style="padding: 10px"></span> [阅读原文 ->](https://www.cnblogs.com/liyunhua/p/4529086.html#_label21)

本文主要从js代码层面来进行性能优化，对于平时coding具有参考价值。
