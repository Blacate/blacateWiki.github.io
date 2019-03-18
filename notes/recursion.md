title: Recursion
category: Algorithm

time: 1520509856847
---
### 求n的阶乘

#### 普通递归

```JavaScript
function factorial(n) {
  if (n === 0) {
    return 1;
  } else {
    return n*factorial(n-1);
  }
}
//思路： n！=n*(n-1)*(n-2)*...*1
//		 =n*(n-1)!
```

#### 尾递归

```JavaScript
function tailFactorial(n, total  = 1) {
  if (n === 0) {
    return total;
  } else {
    return tailFactorial(n-1, n*total)
  }
}
//思路:把结果作为参数传入函数中，n可以理解为有1到n个元素的栈
//假设n=4，栈中压入1,2,3,4四个元素，第一次调用函数，由于是累乘，传入默认参数total=1,
//4出栈，将4*total=4作为第一次运算结果传入第二次调用；此时，栈中还有三个元素，传入的total为4；
//3出栈，将3*total=12作为第一次运算结果传入第三次调用；此时，栈中还有两个元素，传入的total为12；
//2出栈，将2*total=24作为第一次运算结果传入第四次调用；此时，栈中还有一个元素，传入的total为24；
//1出栈，将1*total=24作为第一次运算结果传入第五次调用；
//此时，栈中没有元素了，传入的total为24,执行n=0时的语句，return total;
```

##### 结果缓存

```JavaScript
//这不是递归的写法，但是通过把结果缓存下来，能够很大程度上提高多次运算时的运算速度
let factorial = (function() {
  let result = [1,1];
  let calc = function(n) {
    if(n > (result.length - 1)) {
      for(let i = result.length; i <=n; i++) {
        result[i] = result[i-1] * i;
      }
    }
    return result[n];
  }
  return calc;
})()
```

