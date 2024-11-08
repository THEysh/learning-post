---
author: 杨盛晖
pubDatetime: 2024-11-07T16:40:00+08:00
modDatetime: 
title: 08-CSS3属性：Flex布局图文详解
slug: ZuocpGYjHfHwwpAXryTk
featured: true
draft: false
tags:
  - css
description:
   08-CSS3属性：Flex布局图文详解
---


<ArticleTopAd></ArticleTopAd>


## 前言

CSS3中的 flex 属性，在布局方面做了非常大的改进，使得我们对**多个元素之间**的布局排列变得十分灵活，适应性非常强。其强大的伸缩性和自适应性，在网页开中可以发挥极大的作用。

### flex 初体验

我们先来看看下面这个最简单的布局：

![](http://img.smyhvae.com/20191009_1555.png)

上面这张图中的布局是我们都熟悉的：默认文档流中，在一个父容器里放置多个块级的子元素，那么，这些子元素会默认从上往下排列。

在此基础之上，如果我给父容器仅仅加一个 `display: flex`属性，此时，这些子元素的布局会摇身一变：
```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<style>
		.all_div{
			display: flex;
		}
		.div1 {
			width: 300px;
			height: 50px;
			background-color: red;
		}
		.div2 {
			width: 500px;
			height: 50px;
			background-color: orange;
		}
		.div3 {
			width: 100px;
			height: 50px;
			background-color: lightblue;
		}
		.div4 {
			width: 200px;
			height: 50px;
			background-color:yellowgreen;
		}
	</style>
</head>
<body>
	<div class="all_div">
		<div class="div1"></div>
		<div class="div2"></div>
		<div class="div3"></div>
		<div class="div4"></div>
	</div>

</body>
</html>
```
![](http://img.smyhvae.com/20191009_1600.png)

没错，子元素们会**在水平方向上，从左至右排列**，就是这么神奇。到此为止，你已经掌握了关于 flex 的一半的知识。

### flex 布局的优势

1、**flex 布局的子元素不会脱离文档流**，很好地遵从了“流的特性”。

但你如果用 float 来做布局，float 属性的元素会脱离文档流，而且会涉及到各种 BFC(BFC（Block Formatting Context，块级格式化上下文）是一种用于处理布局的概念。它是一个独立的渲染区域，其中的块级元素的布局与外部环境相互独立。BFC的主要作用是控制元素的布局和清除浮动、避免外边距重叠等问题)、清除浮动(例如使用```clear: both```方法)的问题。浮动相关的问题，比较麻烦，所以也成了面试必问的经典题目。但有了 flex 布局之后，这些问题都不存在的。

2、**flex 是一种现代的布局方式，是 W3C 第一次提供真正用于布局的 CSS 规范**。 flex 提供了非常丰富的属性，非常灵活，让布局的实现更佳多样化，且方便易用。

flex 唯一的缺点就在于，它不支持低版本的 IE 浏览器。

### flex 的兼容性问题

![](http://img.smyhvae.com/20191005_1200.png)

上图中可以看到， flex 布局不支持 IE9 及以下的版本；IE10及以上也只是部分支持。如果你的页面不需要处理 IE浏览器的兼容性问题，则可以放心大胆地使用 flex 布局。

但是，比如网易新闻、淘宝这样的大型网站，面对的是海量用户，即便使用低版本浏览器的用户比例很少，但绝对基数仍然是很庞大的。因此，这些网站为了兼容低版本的 IE 浏览器，暂时还不敢尝试使用 flex 布局。

### 概念：弹性盒子、子元素

在讲 flex 的知识点之前，我们事先约定两个概念：

- **弹性盒子**：指的是使用 `display:flex` 或 `display:inline-flex` 声明的**父容器**。

- **子元素/弹性元素**：指的是父容器里面的子元素们（父容器被声明为 flex 盒子的情况下）。

### 概念：主轴和侧轴

在上面的“初体验”例子中，我们发现，弹性盒子里面的子元素们，默认是从左至右排列的，这个方向，代表的就是主轴的方向。

在此，我们引入主轴和侧轴的概念。

- 主轴：flex容器的主轴，默认是水平方向，从左向右。

- 侧轴：与主轴垂直的轴称作侧轴，默认是垂直方向，从上往下。

PS：主轴和侧轴并不是固定不变的，可以通过 `flex-direction` 更换方向，我们在后面会讲到。

## 弹性盒子

### 声明定义

使用 `display:flex` 或 `display:inline-flex` 声明一个**父容器**为弹性盒子。此时，这个父容器里的子元素们，会遵循弹性布局。

备注：一般是用 `display:flex`这个属性。`display:inline-flex`用得较少。

### flex-direction 属性

`flex-direction`：用于设置盒子中**子元素**的排列方向。属性值可以是：

| 属性值 | 描述 |
|:-------------|:-------------|
| row | 从左到右水平排列子元素（默认值） |
|column|从上到下垂直排列子元素|
| row-reverse |从右向左排列子元素 |
|column-reverse|从下到上垂直排列子元素|

备注：如果我们不给父容器写`flex-direction`这个属性，那么，子元素默认就是从左到右排列的。

代码演示：

```html
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <style>
        *{
            margin: 0;
            padding: 0;
            list-style: none;
        }
       body{
           background-color: #eee;
           font-family: "Microsoft Yahei";
           font-size:22px;
       }

        h3{
            font-weight: normal;
        }
        section{
            width: 1000px;

            margin:40px auto;
        }

        ul{
            background-color: #fff;
            border: 1px solid #ccc;

        }

        ul li{
            width: 200px;
            height: 200px;
            background-color: pink;
            margin:10px;
        }
        section:nth-child(1) ul{
            overflow: hidden; /* 清除浮动 */
        }
        section:nth-child(1) ul li{
            float: left;
        }
        /* 设置伸缩盒子*/
        section:nth-child(2) ul{
            display: flex;
        }

        section:nth-child(3) ul{
            /* 设置伸缩布局*/
            display: flex;
            /* 设置主轴方向*/
            flex-direction: row;
        }

        section:nth-child(4) ul{
            /* 设置伸缩布局*/
            display: flex;
            /* 设置主轴方向 :水平翻转*/
            flex-direction: row-reverse;
        }

        section:nth-child(5) ul{
            /* 设置伸缩布局*/
            display: flex;
            /* 设置主轴方向 :垂直*/
            flex-direction: column;
        }

        section:nth-child(6) ul{
            /* 设置伸缩布局*/
            display: flex;
            /* 设置主轴方向 :垂直*/
            flex-direction: column-reverse;
        }
    </style>
</head>
<body>
    <section>
        <h3>传统布局</h3>
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
        </ul>
    </section>

    <section>
        <h3>伸缩布局 display:flex</h3>
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
        </ul>
    </section>

    <section>
        <h3>主轴方向 flex-direction:row</h3>
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
        </ul>
    </section>

    <section>
        <h3>主轴方向 flex-direction:row-reverse</h3>
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
        </ul>
    </section>

    <section>
        <h3>主轴方向 flex-direction:column</h3>
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
        </ul>
    </section>

    <section>
        <h3>主轴方向 flex-direction:column-reverse</h3>
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
        </ul>
    </section>
</body>
</html>
```


### flex-wrap 属性

`flex-wrap`：控制子元素溢出时的换行处理。

### justify-content 属性

`justify-content`：控制子元素在主轴上的排列方式。

## 弹性元素

### justify-content 属性

- `justify-content: flex-start;` 设置子元素在**主轴上的对齐方式**。属性值可以是：
    - `flex-start` 从主轴的起点对齐（默认值）
    - `flex-end` 从主轴的终点对齐
    - `center` 居中对齐
    - `space-around` 在父盒子里平分
    - `space-between` 两端对齐 平分


代码演示：（在浏览器中打开看效果）

```html
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <style>
        *{
            margin: 0;
            padding: 0;
            list-style:none;}
        body{
            background-color: #eee;
            font-family: "Microsoft Yahei";

        }
        section{
            width: 1000px;
            margin:50px auto;
        }
        section h3{
            font-size:22px;
            font-weight: normal;
        }

        ul{
            border: 1px solid #999;
            background-color: #fff;
            display: flex;

        }

        ul li{
            width: 200px;
            height: 200px;
            background: pink;
            margin:10px;

        }

        section:nth-child(1) ul{
            /* 主轴对齐方式：从主轴开始的方向对齐*/
            justify-content: flex-start;
        }

        section:nth-child(2) ul{
            /* 主轴对齐方式：从主轴结束的方向对齐*/
            justify-content: flex-end;
        }

        section:nth-child(3) ul{
            /* 主轴对齐方式：居中对齐*/
            justify-content: center;
        }

        section:nth-child(4) ul{
            /* 主轴对齐方式：在父盒子中平分*/
            justify-content: space-around;

           }

        section:nth-child(5) ul{
            /* 主轴对齐方式：两端对齐 平分*/
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <section>
        <h3>主轴的对齐方式：justify-content:flex-start</h3>
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
        </ul>
    </section>

    <section>
        <h3>主轴的对齐方式：justify-content:flex-end</h3>
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
        </ul>
    </section>

    <section>
        <h3>主轴的对齐方式：justify-content:center</h3>
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
        </ul>
    </section>

    <section>
        <h3>主轴的对齐方式：justify-content:space-round</h3>
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
        </ul>
    </section>

    <section>
        <h3>主轴的对齐方式：justify-content:space-bettwen</h3>
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
        </ul>
    </section>
</body>
</html>
```


### align-items 属性

`align-items`：设置子元素在**侧轴上的对齐方式**。属性值可以是：
    - `flex-start` 从侧轴开始的方向对齐
    - `flex-end` 从侧轴结束的方向对齐
    - `baseline` 基线 默认同flex-start
    - `center` 中间对齐
    - `stretch` 拉伸

代码演示：

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Align Items Example</title>
    <style>
        .container {
            display: flex;
            height: 300px;
            border: 2px solid #333;
            margin-bottom: 20px;
        }

        .item {
            width: 100px;
            background-color: lightblue;
            border: 1px solid #000;
            padding: 10px;
        }

        /* Different align-items values */
        .align-start {
            align-items: flex-start;
        }

        .align-end {
            align-items: flex-end;
        }

        .align-center {
            align-items: center;
        }

        .align-stretch {
            align-items: stretch;
        }

        .align-baseline {
            align-items: baseline;
        }
    </style>
</head>
<body>

    <h2>align-items: flex-start</h2>
    <div class="container align-start">
        <div class="item">Item 1</div>
        <div class="item">Item 2</div>
        <div class="item">Item 3</div>
    </div>

    <h2>align-items: flex-end</h2>
    <div class="container align-end">
        <div class="item">Item 1</div>
        <div class="item">Item 2</div>
        <div class="item">Item 3</div>
    </div>

    <h2>align-items: center</h2>
    <div class="container align-center">
        <div class="item">Item 1</div>
        <div class="item">Item 2</div>
        <div class="item">Item 3</div>
    </div>

    <h2>align-items: stretch (default)</h2>
    <div class="container align-stretch">
        <div class="item">Item 1</div>
        <div class="item">Item 2</div>
        <div class="item">Item 3</div>
    </div>

    <h2>align-items: baseline</h2>
    <div class="container align-baseline">
        <div class="item">Item 1</div>
        <div class="item" style="font-size: 24px;">Item 2</div>
        <div class="item">Item 3</div>
    </div>

</body>
</html>
```


### `flex`属性：设置子盒子的权重

代码演示：

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flexbox 示例</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            list-style: none;
        }
        body {
            background-color: #eee;
            font-family: "Microsoft Yahei";
        }
        section {
            width: 1000px;
            margin: 50px auto;
        }
        section h3 {
            font-size: 22px;
            font-weight: normal;
        }
        ul {
            border: 1px solid #999;
            background-color: #fff;
            display: flex;
        }
        ul li {
            height: 200px;
            background: pink;
            margin: 10px;
            display: flex; /* 使 li 内的内容也使用 Flexbox */
            justify-content: center; /* 水平居中 */
            align-items: center; /* 垂直居中 */
        }
        /* 设置比例为 1:3:1 */
        section:nth-child(1) li:nth-child(1) {
            flex: 1; /* 第一个 li */
        }
        section:nth-child(1) ul li:nth-child(2) {
            flex: 3; /* 第二个 li */
        }
        section:nth-child(1) ul li:nth-child(3) {
            flex: 1; /* 第三个 li */
        }

		/* 设置比例为 3:2:1 */
		section:nth-child(2) li:nth-child(1) {
            flex: 3; /* 第一个 li */
        }
        section:nth-child(2) ul li:nth-child(2) {
            flex: 2; /* 第二个 li */
        }
        section:nth-child(2) ul li:nth-child(3) {
            flex: 1; /* 第三个 li */
        }
    </style>
</head>
<body>
<section>
    <h3>伸缩比例: flex</h3>
    <ul>
        <li>1</li>
        <li>2</li>
        <li>3</li>
    </ul>
</section>

<section>
    <h3>伸缩比例: flex</h3>
    <ul>
        <li>1</li>
        <li>2</li>
        <li>3</li>
    </ul>
</section>
</body>
</html>

```

## 相关链接

### CSS Flexbox 可视化手册

可视化的截图如下
![](http://img.smyhvae.com/20190821_2101.png)
相关文章：
- 【英文原版】 CSS Flexbox Fundamentals Visual Guide：<https://medium.com/swlh/css-flexbox-fundamentals-visual-guide-1c467f480dac>

- 【中文翻译】CSS Flexbox 可视化手册：<https://zhuanlan.zhihu.com/p/56046851>

###  flex 相关的推荐文章

- flex 效果在线演示：<https://demos.scotch.io/visual-guide-to-css3-flexbox-flexbox-playground/demos/>

- A Complete Guide to Flexbox | 英文原版：<https://css-tricks.com/snippets/css/a-guide-to-flexbox/>

- CSS3 Flexbox 布局完全指南 | 中文翻译：<https://www.html.cn/archives/8629>

###  flex 相关的教程

[详细的flex教程](https://www.bilibili.com/video/BV1A44y1Z7Bp/?spm_id_from=333.337.search-card.all.click&vd_source=724449c0d6c5548500d722693df2947b)

