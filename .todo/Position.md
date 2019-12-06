title: Position
category: CSS
time: 1515637107610
---
#### static

**默认值**，元素使用正常的布局行为，此时`top`，`right`，`bottom`，`left`和`index`属性无效。

#### relative

元素放在未添加定位时的位置，此时可通过`top`等属性调整元素位置，元素仍保持未定位前的形状，它原本所占的空间仍然保留。`position:relative` 对 `table-*-group`,` table-row`,` table-column`, `table-cell`,` table-caption` 元素无效。

#### absolute

元素脱离文档流，指定元素相对于最近的非static定位祖先元素偏移。可设置外边距，且不会与其他边距合并

*把动画元素设置为absolute可减少页面的回流，优化性能*

### fixed

元素脱离文档流，相对于屏幕视口定位

*把动画元素设置为fixed可减少页面的回流，优化性能*
