title: BFC
category: CSS
time: 1515656853743
---
### 盒模型

+ content area
+ padding area
+ border area
+ margin area

#### box-sizing

##### content-box

默认值，`width`和`height`只包括内容的宽和高，不包括内边距，边框和外边距

##### border-box

`width`和`height`属性包括内容，内边距和边框，但是不包括外边距

### 块级格式化上下文

##### 布局规则

1. Box垂直方向的距离由margin决定。属于同一个BFC的两个相邻Box的margin会发生重叠
2. BFC区域不会与浮动元素重叠
3. BFC在页面上是一个独立的容器，与其他元素互不影响（e.g. 内部清除浮动）
4. 计算BFC高度时，浮动元素也会参与计算

##### 如何创建BFC

- float不为none
- position不为static
- display不为默认值
- overflow不为visible

