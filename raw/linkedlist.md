---
title: LinkedList
category: Algorithm
time: 1520505033544
---
```javascript
// 节点构造函数
class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

// 链表构造函数
class LinkedList {
    constructor() {
        this.head = null;
        this.length = 0;
    }

  	// 找到指定位置的节点
    getAt(position) {
        if(position > -1 && position < this.length) {
            let current = this.head;
            let index = 0;
            while(index < position) {
                index++;
                current = current.next;
            }
            return current;
        }
        return null;
    }

  	// 如果链表没有任何节点，添加到this.head；否则，找到最后一个节点并添加
    append(value) {
        const node = new Node(value);
        if(this.length === 0) {
            this.head = node;
        } else {
            let current = this.getAt(this.length - 1);
            current.next = node;
        }
        this.length++;
    }

  	// 找到需要添加位置的前一个节点，后面的部分添加到新节点后面，新节点添加到找到的节点上
    insert(position, value) {
        if(position >= 0 && position <= this.length) {
            const node = new Node(value);
            if(position === 0) {
                node.next = this.head;
                this.head = node;
            } else {
                let previous = this.getAt(position - 1);
                node.next = previous.next;
                previous.next = node;
            }
            this.length++;
            return true;
        }
        return false;
    }

  	// 找到前一个节点，临时保存被删除节点的后面部分，待删除节点后添加到找到的节点后面
    removeAt(position) {
        if(position > -1 && position < this.length) {
            let current = this.head;
            if(position === 0) {
                this.head = current.next;
            } else {
                let previous = this.getAt(position - 1);
                current = previous.next;
                previous.next = current.next;
            }
            this.length--;
            return current.value;
        }
        return null;
    }

  	// 遍历找到value
    findIndex(value) {
        let current = this.head;
        let index = -1;
        while(current) {
            index++;
            if(current.value === value) {
                return index;
            }
            current = current.next;
        }
        return -1;
    }

  	// 先遍历找到value，然后删除
    remove(value) {
        const index = this.findIndex(value);
        return this.removeAt(index);
    }

    isEmpty() {
        return !this.length;
    }

    size() {
        return this.length;
    }

    toString() {
        let current = this.head;
        let str = '';
        while(current) {
            str += ` ${current.value}`;
            current = current.next;
        }
        return str;
    }
}

// 实例化一个链表
let linkedlist = new LinkedList()
```

