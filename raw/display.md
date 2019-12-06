---
title: Display
category: CSS
time: 1515655203495
---
#### block

block独占一行，元素宽度自动填满其父元素宽度，可以设置`width`，`height`，`margin`，`padding`属性

常见元素有：p,div,h1~h6,ol,ul,dl,table,address,blockquote,form,article,canvas,header,footer,section等

#### inline

inline元素不会独占一行，多个相邻的行内元素会排在同一行内，直到排不下才回换行，其宽度随元素内容变化而变化；inline元素设置`width`和`height`属性无效；水平方向的`padding`和`margin`有效，竖直方向的`padding`和`margin`不会产生效果。

常见元素有：a,span,br,i,em,strong,label,q,var,cite,code等

***margin/padding的百分比均相对于包含元素的宽度***

#### inline-block

将对象呈现为`inline`对象，但是对象的内容作为`block`对象呈现

常见元素有：img,input

##### 解决`inline-block`元素间间距

+ 去除标签之前的换行符和空格
+ 父元素`font-size`为0
+ 负margin

#### list-item

该元素生成一个容纳内容和单独的列表行内元素盒的块状盒

### 表格模型值

+ table：同\<table\>
+ inline-table
+ table-caption：同\<caption\>
+ table-cell：同\<td\>
+ table-column：同\<col\>
+ table-column-group：同\<colgroup\>
+ table-footer-group：同\<tfoot\>
+ table-header-group：同\<thead\>
+ table-row：同\<tr\>
+ table-row-group：同\<tbody\>

### Flexbox模型值

+ flex
+ inline-flex

### 栅格盒模型值

+ grid
+ inline-grid


