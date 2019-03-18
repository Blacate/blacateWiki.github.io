title: Float
category: CSS
time: 1515638015857
---
### 浮动元素的定位

当一个元素浮动后，它会被移出正常的文档流，然后向左或向右平移，直到碰到所处容器的边框或碰到另一个浮动的元素

### 清除浮动

1. clear清除浮动（添加空div）

   ```css
   在浮动元素下方添加空div，css样式：{clear:both;overflow:hidden;height:0}
   ```

2. 给浮动元素父级设置高度

   ```
   缺点：在浮动元素高度不确定的时候不适用
   ```

3. 父级同时浮动

   ```
   缺点：需要给每个浮动元素父级添加浮动，浮动多了容易出问题
   ```

4. 父级设置成`inline-block`

   ```
   缺点：父级的margin左右auto失效，无法使用margin：0 auto；居中了
   ```

5. **br** 清除浮动

   ```
   <div class="box">
   	<div class="top"></div>
   	</br clear="both">
   </div>
   ```

   br标签自带clear属性，将它设置为both其实和添加空div原理是一样的。

   问题：不符合工作中：结构、样式、行为，三者分离的要求

6. 给父级添加`overflow:hidden`清浮动方法

   ```
   overflow:hidden;
   *zoom:1;
   ```

   问题：需要配合宽度或者zoom兼容IE6 IE7;

7. **after** 伪类清除浮动

   ```
   选择符:after {
     content: ".";
     clear:both;
     display:block;
     height:0;
     overflow:hidden;
     visibility:hidden;
   }
   ```
