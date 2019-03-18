title: Ajax
category: JavaScript
time: 1520520753354
---
```javascript
function ajax(type, url, data = {}) {
    return new Promise((resolve) => {
      	// 创建对象（兼容IE）
        let xhr =  XMLHttpRequest 
        ? new XMLHttpRequest() 
        : new ActiveXObjece('Microsoft.XMLHTTP');
        type = type.toUpperCase();
      	// 处理参数
        let dataArr = [];
        for(let k in data) {
            dataArr.push(`${k}=${data[k]}`)
        }
        // get请求
        if (type === 'GET') {
            url = `${url}?${dataArr.join('&')}`;
            xhr.open(type, url.replace(/\?$/g, ''), true);
            xhr.send();
        }
      	// post请求
        if (type === 'POST') {
            xhr.open(type, url, true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.send(dataArr.join('&'))
        }
      	// 请求成功触发后交付数据
        xhr.onload = function() {
            let res = {};
            res.status = xhr.status;
            res.data = JSON.parse(xhr.responseText);
            resolve(res)
        }
    })
}
ajax('get', 'https://api.github.com/').then((res) => {
    console.log(res.data);
})
```

#### readyState

| 值    | 状态               | 描述                 |
| ---- | ---------------- | ------------------ |
| 0    | UNSENT           | 请求未初始化，open()未调用   |
| 1    | OPENED           | 服务器连接已连接，但还未发送请求   |
| 2    | HEADERS_RECEIVED | 已经收到了响应头，但还未收到响应主体 |
| 3    | LOADING          | 正在接收响应主体，但还未完成     |
| 4    | DONE             | 整个请求完成             |

#### 事件处理程序

| 事件                 | 描述                                       |
| ------------------ | ---------------------------------------- |
| onabort            | 当请求终止时触发                                 |
| onload             | 当请求成功时触发                                 |
| onloadend          | 当请求成功或失败时触发;after load,abort,error,timeout |
| onloadstart        | 当请求开始时触发                                 |
| onreadystatechange | 当readyState属性改变时触发                       |
| ontimeout          | 当timeout属性指定的时间已经过去后触发                   |
| onerror            | 请求因错误失败时触发                               |
| onprogress         | 当响应主体正在下载重复触发(50ms interval)             |

##### ref

+ [MDN-XMLHttpRequest](https://developer.mozilla.org/zh-CN/docs/Web/API/XMLHttpRequest)
+ [w3school-ajax](http://www.w3school.com.cn/ajax/ajax_xmlhttprequest_create.asp)
+ [XMLHttpRequest对象主要属性和事件](http://blog.csdn.net/ruoyiqing/article/details/39191287)
