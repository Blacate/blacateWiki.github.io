title: CSS Selectors
category: CSS
time: 1515644161699
---
 #### 选择器其特殊性值

| 选择器          | 特殊性值    |
| ------------ | ------- |
| //内联声明       | 1 0 0 0 |
| ID选择器        | 0 1 0 0 |
| 类选择器、属性选择、伪类 | 0 0 1 0 |
| 元素、伪元素选择器    | 0 0 0 1 |
| 结合符和通配选择器    | 0 0 0 0 |

```css
/* 内联声明 */
<h1 style="color:green;">内联声明<h1>
/* ID选择器 */
#main {
  color: green;
}
/* 类选择器、属性选择、伪类 */
.main {
  color: green;
}
a[href="www.baidu.com"] {
  color: green;
}
a:hover {
  color: green;
}
/* 元素、伪元素选择器 */
a {
  color: green;
}
p:first-letter {
  color: green;
}
/* 结合符、通配符选择器 */
div > h1 + p {
  color: green;
}
* {
  color: green;
}
```



#### CSS优先级法则

1. 选择器都有一个权值，权值越大越优先
2. 当权值相等时，后出现的样式表设置要优先于先出现的样式表设置
3. 创作者的设置高于浏览器的默认样式
4. 在同一组属性设置中标有**!important**规则的优先级最大



#### 伪类选择器

+ link
+ visited
+ focus
+ hover
+ active
+ disabled 表示被禁用的元素
+ first-child 一组兄弟元素中的第一个元素
+ first-of-type 表示一组兄弟元素中其类型的第一个元素
+ invalid input或form中输入内容无法通过验证
+ valid
+ last-child 父元素的最后一个子元素
+ last-of-type 表示一组兄弟元素中其类型的最后一个元素
+ checked
+ default 表示一组相关元素中的默认表单元素
+ in-range input的值在合理范围
+ out-of-range input的值超出了合理范围
+ lang() 根据其所确定的语言匹配元素
+ not() 匹配不符合参数选择器X描述的元素
+ nth-child(2n+1)
+ nth-last-child(-n+4)
+ nth-last-of-type(an+b)
+ optional
+ required
+ only-child 属于某个父元素的唯一一个子元素
+ only-of-type 代表了任意一个元素，这个元素没有其他相同类型的兄弟元素
+ read-only
+ read-write
+ nth-of-type(an+b)
+ fullscreen
+ left
+ right
+ target
+ root 匹配根元素html
+ dir
+ indeterminate
+ any

#### 伪元素选择器

+ after
+ before
+ first-letter
+ first-line
+ selection

##### 伪类与伪元素的区别

伪类的效果可以通过添加一个实际的类来达到，而伪元素的效果则需要通过添加一个实际的元素才能达到，这也是为什么他们一个称为伪类，一个称为伪元素的原因。

