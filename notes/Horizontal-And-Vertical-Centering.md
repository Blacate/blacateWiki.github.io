title: Horizontal And Vertical Centering
category: CSS
time: 1515638508650
---
#### 水平居中

##### 行内元素的水平居中

```css
#container {
  text-align: center;
}
```

##### 块状元素的水平居中

```css
#center {
  margin: 0 auto;
}
```

##### 多个块状元素的水平居中

```css
#container {
  text-align: center;
}
#center {
  display: inline-block;
}
```

##### Flex

```css
#container {
  display: flex;
  justify-content:center;
}
```

#### 已知高度的水平垂直居中

##### 绝对定位与负边距实现

```css
#container {
  position: relative;
}
#center {
  width: 100px;
  height:100px;
  position: absolute;
  top: 50%;
  left:50%;
  margin: -50px 0 0 -50px;
}
```

#### 未知宽度高度元素的水平垂直居中

##### 绝对定位与margin实现

```css
#container {
  display: relative;
}
#center {
  position: absolute;
  margin: auto;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}
```

##### 需要居中的元素是`inline`或`inline-block`

```css
#container {
  dispaly: table-cell;
  text-align: center;
  vertical-align: middle;
}
```

##### CSS3的transform

```css
#container {
  position: relative;
}
#center {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(50%,50%);
}
```

##### Flex布局

```css
#container {
  display: flex;
  justify-content: center;
  align-items: center;
}
```

