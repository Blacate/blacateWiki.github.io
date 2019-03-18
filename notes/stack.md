title: Stack
category: Algorithm

time: 1520504839567
---
```javascript
// 栈构造函数
class Stack {
    constructor() {
        this.items = [];
    }

    push(item) {
        this.items.push(item);
    }

    pop() {
        return this.items.pop();
    }

    peek() {
        return this.items[this.items.length - 1];
    }

    isEmpty() {
        return this.items.length < 1;
    }

    clear() {
        this.items = [];
    }

    size() {
        return this.items.length;
    }

    print() {
        console.log(this.items.toString())
    }
}

// 实例化一个栈
let stack = new Stack();
```

