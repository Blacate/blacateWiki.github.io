title: Inherit
category: JavaScript
time: 1520522251644
---
### 原型

每个`JavaScript`对象(除null)在创建时都会关联另一个对象，这个对象就是我们所说的原型，每个对象都会从原型“继承”属性；每个对象(除null)的`__proto__`指向该对象的原型。

### 原型链

对象的`__proto__`依次串联，会形成一条`__proto__`连起来的链条，递归访问`__proto__`最终到null。

ps: 类比链表，每个节点的next都指向下一个节点，最终到null；区别：节点并没有继承下一个节点的属性。

### 继承

##### 原型链继承

```javascript
function Parent() {
  this.property = true
}
Parent.prototype.getParentValue = function () {
  return this.property
}
function Child() {
  this.Childproperty = false
}
Child.prototype = new Parent()
Child.prototype.getChildValue = function () {
  return this.Childproperty
}
var instance = new Child()
console.log(instance.getParentValue())
```

##### 构造函数继承

```javascript
function Parent() {
  this.colors = ['red', 'blue', 'green']
}
function Child() {
  // 继承Parent
  Parent.call(this)
}
var instance1 = new Child()
var instance2 = new Child()
instance1.colors.push('black')
console.log(instance1.colors)  // [“red”, “blue”, “green”, “black”]
console.log(instance2.colors) // [“red”, “blue”, “green”]
```

##### 组合继承（原型链+构造函数）

```javascript
function Parent(name) {
	this.name = name;
  this.colors = ['red','blue','green'];
}

Parent.prototype.sayName = function() {
	console.log(this.name)
}

function Child(name, job) {
	Parent.call(this,name);
  this.job = job;
}

Child.prototype = new Parent();
Child.prototype.constructor = Parent;
Child.prototype.sayJob = function() {
	console.log(this.job);
}

console.log(new Child('xiaoming', 'student'));
```

##### 原型式继承

```javascript
function object(o) {
	function F() {}
  F.prototype = o;
  return new F();
}

var person = {
  name: 'Jiang',
  friends: ['Shelby', 'Court']
}
console.log(object(person))
console.log(Object.create(person))
```

##### 寄生组合式继承

```javascript
function inheritPrototype(Child, Parent) {
  var prototype = Object.create(Parent.prototype)
  prototype.constructor = Child
  Child.prototype = prototype
}

//ES6
// 继承
Object.setPrototypeOf(Child.prototype, Parent.prototype)
console.log(Child.prototype.constructor === Child) // true

```


#### 附图

![proto.jpg](/static/proto.jpg)