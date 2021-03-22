// 默认所有类都继承 Object
main(List<String> args) {
  var p1 = Person.withArgs("张三", 16);

  Object obj1 = "123abc";
  print(obj1);
  // 动态类型, 编译时没问题, 运行时可能报错
  dynamic obj2 = "123abc";
  print(obj2.substring(1));

  var obj3 = Person.withMap({"name": "李四", "age": 21});
  print(obj3.height);

  print(obj3);
}

class Person {
  String? name;
  int? age;
  double? height;

  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }
  // 使用命名构造函数
  Person(this.name, this.age, {this.height});

  Person.withArgs(this.name, this.age, {this.height});

  Person.withMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.age = map["age"];
    this.height = map["height"];
  }

  @override
  String toString() {
    return "$name $age $height";
  }
}

class Person2 {
  final String name;
  final int age;

  Person2(this.name) : age = 10;
  // Person2(this.name, {int age = 10});
}
