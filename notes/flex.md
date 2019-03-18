title: Flex
category: CSS
time: 1515634724330
---
### Flex

#### 容器的属性

##### flex-direction

+ row 从左到右
+ row-reverse 从右到左
+ column 从上到下
+ column-reverse 从下到上

<p data-height="265" data-theme-id="0" data-slug-hash="vpRQZE" data-default-tab="html,result" data-user="Blacate" data-embed-version="2" data-pen-title="flex-direction" class="codepen">See the Pen <a href="https://codepen.io/Blacate/pen/vpRQZE/">flex-direction</a> by BestYang (<a href="https://codepen.io/Blacate">@Blacate</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>

##### flex-wrap

+ nowrap 不换行
+ wrap 换行，第一行在上方
+ wrap-reverse 换行，第一行在下方

##### flex-flow

```css
flex-flow: <flex-direction> || <flex-wrap>;
```

##### justify-content

+ flex-start 左对齐
+ flex-end 右对齐
+ center 居中对齐
+ space-between 两端对齐，项目之间的间隔都相等
+ space-around 每个项目两侧的间隔相等。所以，项目之间的间隔比项目与边框的间隔大一倍

##### align-items

+ flex-start 交叉轴的起点对齐（上对齐）
+ flex-end 交叉轴的终点对齐
+ center 交叉轴的中点对齐
+ baseline 项目的第一行文字的基线对齐
+ stretch 如果项目未设置高度或设为auto，将占满整个容器的高度 （default）

##### align-content 多根轴线的对齐方式

+ flex-start
+ flex-end
+ center
+ space-between
+ space-around
+ stretch

#### 项目的属性

##### order 定义项目的排列顺序。数值越小，排列越靠前，默认为0

##### flex-grow 定义项目的放大比例 

##### flex-shrink 定义项目的缩小比例

##### flex-basic 定义项目的宽度

##### flex `flex: flex-grow flex-shrink flex-basic;` 

##### align-self 效果同align-items
