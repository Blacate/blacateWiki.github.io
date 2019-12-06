---
title: CSS Animation
category: CSS
time: 1515648307345
---
### animation

##### animation-delay

​	设置延时，即从元素加载完成之后到动画序列开始执行的这段时间。

##### animation-direction

​	`animation-direction:normal|alternate|reverse|alternate-reverse;`

​	设置动画在每次运行完后是反向运行还是重新回到开始位置重复运行。

##### animation-duration

​	设置动画一个周期的时长。

##### animation-iteration-count

​	设置动画重复次数， 可以指定infinite无限次重复动画

##### animation-name

​	指定由`@keyframes`描述的关键帧名称。

##### animation-play-state

​	`animation-paly-state:running|paused;`

​	允许暂停和恢复动画。

##### animation-timing-function

​	设置动画速度， 即通过建立加速度曲线，设置动画在关键帧之间是如何变化。

##### animation-fill-mode

​	`animation-fill-mode:none|backwards|both|forwards;`

​	指定动画执行前后如何为目标元素应用样式。

```css
p {
  animation-duration: 3s;
  animation-name: slidein; 
}

@keyframes slidein {
  from {
    margin-left: 100%;
    width: 300%; 
  }
  
  50% {
    margin-left: 50%;
    width: 150%; 
  }

  to {
    margin-left: 0%;
    width: 100%;
  }
}
```

<p data-height="265" data-theme-id="0" data-slug-hash="ppLYLa" data-default-tab="css,result" data-user="Blacate" data-embed-version="2" data-pen-title="animation" class="codepen">See the Pen <a href="https://codepen.io/Blacate/pen/ppLYLa/">animation</a> by BestYang (<a href="https://codepen.io/Blacate">@Blacate</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>

### transition

```css
img {
  transition-duration: 10s;
  transition-delay: 1s;
  transition-property: height;
  transition-timing-function: ease;
}
img {
  transition: 10s 1s height ease;
}
```

##### transition-timing-function

+ linear 匀速
+ ease-in 加速
+ ease-out 减速
+ cubic-bezier 自定义速度模式


<p data-height="265" data-theme-id="0" data-slug-hash="ppLYQV" data-default-tab="css,result" data-user="Blacate" data-embed-version="2" data-pen-title="ppLYQV" class="codepen">See the Pen <a href="https://codepen.io/Blacate/pen/ppLYQV/">ppLYQV</a> by BestYang (<a href="https://codepen.io/Blacate">@Blacate</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>