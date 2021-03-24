import 'dart:io';

// Dart 是通过 单线程+事件循环 实现异步

// main(List<String> args) {
//   // 这里使用数组模拟队列, 先进先出的原则
//   List eventQueue = [];
//   var event;

//   // 事件循环从启动的一刻，永远在执行
//   while (true) {
//     if (eventQueue.length > 0) {
//       // 取出一个事件
//       event = eventQueue.removeAt(0);
//       // 执行该事件
//       event();
//     }
//   }
// }

// 异步操作主要使用 Future 以及 async、await

// Future
main(List<String> args) async {
  print("main function start");
  // print(getNetworkData());
  // 3s 后打印回调结果
  // print(getNetworkData2().then((value) => print(value)));
  // 如果执行过程中出现异常, 通过 .catchError 捕获
  // 我们可以在then中继续返回值，会在下一个链式的then调用回调函数中拿到返回的结果
  // getNetworkData2()
  //     .then((value) {
  //       print(value);
  //       return "123";
  //     })
  //     .then((value) {
  //       print(value);
  //       return "456";
  //     })
  //     .then((value) => print(value))
  //     .catchError((error) {
  //       print(error);
  //     });
  // print("main function end");

  // asyncFunc();

  // print(getNetworkData3());

  print(await getNetworkData3());
}

// 同步执行, 阻塞 3s
String getNetworkData() {
  sleep(Duration(seconds: 3));
  return "network data";
}

// 异步执行
// 创建一个 Future 实例, 把耗时操作放在 Future 中执行
// 通过 .then 的回调获取异步执行的结果, 通过 .catchError 捕获异常
Future getNetworkData2() {
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    // return "network data";
    throw Exception("网络请求出现错误");
  });
}

// 延迟执行
void asyncFunc() {
  Future.delayed(Duration(seconds: 3), () {
    return "3s后的信息";
  }).then((value) => print(value));
}

// 通过 await 异步执行, awiat 必须在 async 函数中使用
Future<String> getNetworkData3() async {
  var result = await Future.delayed(Duration(seconds: 3), () {
    return "network data";
  });
  print(result);
  return "返回值 " + result;
}
