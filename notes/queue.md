title: Queue
category: Algorithm

time: 1520504702303
---
```js
//构造函数
class Queue {
    constructor () {
        this.items = [];
    }

    enqueue(item) {
        this.items.push(item);
    }

    dequeue() {
        return this.items.shift();
    }

    isEmpty() {
        return this.items.length === 0;
    }

    clear() {
        this.items = [];
    }

    size() {
        return this.items.length;
    }

    print() {
        console.log(this.items.toString());
    }
}

// 实例化一个队列
let queue = new Queue()
```