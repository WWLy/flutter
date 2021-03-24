// main 函数是入口
// print 打印
main() {
  print("Hello world" + "22");

  // 变量声明
  // 1. 明确声明
  String name = "ww";

  // 2. 类型推导 (var, final, const), 虽然没有指定类型, 但是变量其实是有明确的类型的.
  // var: 变量
  var age = 20;
  final height1;
  // final: 常量
  final height = 10;
  // height = 13;
  // const: 常量
  const num = 10;
  // num = 11;
  // final 和 const 的对比
  // const 必须赋值 常量值(编译期间需要有一个确定的值)
  // final 可以通过计算/函数获取一个值(运行期间获取确定的值)
  // const date1 = DateTime.now(); // 写法错误
  final date2 = DateTime.now();

  const p1 = Person("张飞");
  const p2 = Person("张飞");
  const p3 = Person("张三");
  print(identical(p1, p2)); // true
  print(identical(p2, p3)); // false

  // 字符串
  var str1 = 'aaa';
  var str2 = "aaa";
  // 可以换行
  var str3 = """a
  aa""";
  // 拼接字符串 ${}, 如果是变量, {} 可以省略
  print("str1 = ${str1}, str2 = $str2, str3 = ${str3}");

  // 获取类型
  print(str2.runtimeType);

  // 集合
  // 1. 列表 List
  var names = ["abc", str1, str2, "abc"];
  names.add("111");
  names.remove(str1);
  // 2. 集合 Set
  var name_set = {"abc", str1, "abcd"};
  names = Set<String>.from(names).toList();

  // 3. 映射 Map
  var name_info = {"name": "abc", "age": 16};

  sum2(1, 2, 3);
  sum3(1, num3: 3, num2: 2);

  test(bar);

  // 匿名函数
  test(() {
    print("匿名函数被调用");
  });

  // 箭头函数: 函数体只有一行代码
  test(() => print("箭头函数被调用"));

  test2((num1, num2) => num1 + num2);

  var cal1 = test4();
  print(cal1(10, 30));

  // 赋值运算符
  String? name3;
  // 1. ??= 当 name3 为 null 时进行赋值
  name3 ??= "李四";
  name3 ??= "赵武";
  print(name3);
  // 2. ?? 当前面的数据为 null 时使用后面的值
  String? name4;
  print(name4 ?? "周六");

  // 级联运算符
  var p5 = Person2()
    ..name = "王五"
    ..eat()
    ..run();

  // 循环, var i = 0; i < 10; i++ / for in
}

class Person {
  final String name;
  double height;

  Person.fromHeight(this.height);
  const Person(this.name);
}

var p1 = Person("123");
var p2 = Person("123");

class Person2 {
  String? name;

  void eat() {
    print("eat");
  }

  void run() {
    print("run");
  }
}

// 函数, 返回值类型可以省略, 但不建议
// dart 没有函数重载
int sum(int num1, int num2) {
  return num1 + num2;
}

// 位置可选参数, [], 根据位置匹配
// 只有可选参数有默认值
// 感觉写法有点别扭, 是否有更优雅的写法
int sum2(int num1, [int? num2, int? num3 = 3]) {
  if (num2 != null) {
    if (num3 != null) {
      return num1 + num2 + num3;
    }
    return num1 + num2;
  }
  return num1;
}

sum2(num1, 1, 2);

// 命名可选参数, {}, 根据名字匹配, 用得更多
int sum3(int num1, {int? num2, int? num3 = null}) {
  if (num2 != null) {
    if (num3 != null) {
      return num1 + num2 + num3;
    }
    return num1 + num2;
  }
  return num1;
}
sum3(num1: 1, num3: 3, num2: 2);


// 函数可以作为另一个函数的参数
void test(Function foo) {
  foo();
}

void test2(int foo(int num1, int num2)) {
  foo(20, 30);
}

void bar() {
  print("bar 函数被调用");
}

typedef Calculate = int Function(int num1, int num2);

void test3(Calculate cal) {
  cal(10, 20);
}

Calculate test4() {
  return (num1, num2) {
    return num1 + num2;
  };
}
