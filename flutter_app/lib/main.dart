// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("first demo")),
//         body: HomeBody()
//       )
//     )
//   );
// }
//
// // class HomeBody extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Text("1345666", style: TextStyle(fontSize: 20, color: Colors.red)),
// //     );
// //   }
// // }
//
// class HomeBody extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _HomeBodyState();
//   }
// }
//
// class _HomeBodyState extends State<HomeBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("134599966886", style: TextStyle(fontSize: 20, color: Colors.red)),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';

// main() {
//   runApp(MyApp());
// }

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First_Demo"),
      ),
      body: HomeBody()
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeBodyState();
  }
}

class HomeBodyState extends State<HomeBody> {
  var flag = false;

  set setFlag(value) {
    flag = value;
    if (flag == true) {
      _agreeProtocol();
    }
  }

  @override
  void initState() {
    super.initState();

    ShareSDKRegister register = ShareSDKRegister();
    register.setupWechat("wx0a260f6facf63c9e",
        "d2e0fd95bf053cd12c5161c28a816d39", "https://t9vcn.share2dlink.com/");
    register.setupSinaWeibo("97740", "d88901e19d578f52af917a54ad6988c0",
        "http://www.sharesdk.cn", "https://t9vcn.share2dlink.com/");
    register.setupQQ("1105852039", "8rHBANRuruA0Ojbi");
    register.setupDouyin(
        "aw9ivykfjvi4hpwo", "42b4caa6bda60bd49f05f06d0a4956e1");
    register.setupTikTok(
        "aw3vqar8qg1oy91q", "18cf1714c53e9f9c64aec484ca4f2e29");
    register.setupFacebook(
        "256061234844378", "b1430cd7f85f69ca33285a40b81675ee", "shareSDK");
    register.setupTwitter("itR4H7ImpeGNEbzdFQ5ApCzLX",
        "LlbbUfpWkqWjNMSGbhb8peyHIsFQxCn2entEKxd4jVOZulGda3", "http://mob.com");
    // register.setupOasis("568898243");
    // register.setupSnapchat(
    //     "dbe54b15-1939-4bfc-b6a0-c30a4af426a6", "", "ssdkmoba0b0c0d0://mob");
    // register.setupKuaiShou("ks705657770555308030", "RQ17enXUOioeoDMrwk3j2Q",
    //     "https://bj2ks.share2dlink.com/");
    SharesdkPlugin.regist(register);
    SharesdkPlugin.addRestoreReceiver(_onEvent, _onError);
  }

  void _onEvent(Object event) {
    print("event: " + event);
  }

  void _onError(Object error) {
    print("error: " + error);
  }

  void _agreeProtocol() {
    SharesdkPlugin.uploadPrivacyPermissionStatus(1, (success) {
      if (success) {
        print("已同意");
      } else {
        print("未同意");
      }
    });
  }

  void _showLoginMenu() {
    SharesdkPlugin.getUserInfo(ShareSDKPlatforms.facebook, (state, user, error) {
      print(user);
    });
  }

  void _showShareMenu() {
    SSDKMap params = SSDKMap()
      ..setGeneral(
          "title",
          "text",
          [
            "http://download.sdk.mob.com/web/images/2019/07/30/14/1564468183056/750_750_65.12.png"
          ],
          "http://download.sdk.mob.com/web/images/2019/07/30/14/1564468183056/750_750_65.12.png",
          null,
          "http://pic28.photophoto.cn/20130818/0020033143720852_b.jpg",
          "http://pic28.photophoto.cn/20130818/0020033143720852_b.jpg",
          "http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT",
          "http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT",
          null,
          SSDKContentTypes.image);
    SharesdkPlugin.share(ShareSDKPlatforms.wechatSession, params,
            (SSDKResponseState state, Map userdata, Map contentEntity,
            SSDKError error) {
      print("分享回调");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(value: flag, onChanged: (value) {
                setState(() {
                  flag = value;
                });
                print(value);
              }),
              Text("同意协议", style: TextStyle(fontSize: 18)),
            ]
          ),
          FloatingActionButton(
            child: Text("登录"),
            onPressed: () {
              print("点击登录");
              _showLoginMenu();
            }),
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                print("点击分享");
                _showShareMenu();
              }),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "用户编辑", style: TextStyle(fontSize: 20, color: Colors.black)),
                TextSpan(text: "小译续写", style: TextStyle(fontSize: 20, color: Colors.redAccent)),
                TextSpan(
                    text: "小译续写",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.redAccent,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed
                    )
                ),
              ]
            )
          )
        ],
      ),
    );
  }
}


// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("First_Demo"),
//       ),
//       body: Center(
//         child: Text("这是内容2", style: TextStyle(fontSize: 20)),
//       ),
//     );
//   }
// }



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//             title: Text("First_App"),
//             centerTitle: true
//           ),
//           body: Center(
//             child: Text("这是内容", style: TextStyle(fontSize: 20)),
//           ),
//         ),
//     );
//   }
// }

// main() {
//   runApp(
//     Center(
//       child: Text(
//         "123456789",
//         textDirection: TextDirection.ltr,
//         style: TextStyle(
//             fontSize: 26,
//             color: Colors.amber
//         ),
//       )
//     )
//   );
// }

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
