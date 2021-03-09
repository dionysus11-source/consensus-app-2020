import 'package:flutter/material.dart';
import 'sub/firstPage.dart';
import 'sub/secondPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './consensusItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consensus Display App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Consensus> consensusList = List();
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    String cid = '005930';
    getInfo(cid);
    print("test");
  }

  @override
  void dispose() {
    // 탭 컨트롤ㄹ러는 애니메이션을 사용하므로 controller에서 dispose()를 호출하여야
    // 메모리 누수를 막을 수 있다
    controller.dispose();
    super.dispose();
  }

  String getCompanyName(String cid) {
    return '삼성전자'; // To be fixed
  }

  void getInfo(String cid) async {
    Map<String, String> header = {
      "user-agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36"
    };
    //const String cid = '005930';
    String url =
        'https://navercomp.wisereport.co.kr/company/ajax/c1050001_data.aspx?flag=2&cmp_cd=$cid&finGubun=MAIN&frq=0&sDT=20210305&chartType=svg';
    http.Response response = await http.get(url, headers: header);
    var jsonString = response.body;
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    List consensus = jsonData['JsonData'];
    List<String> profit = List();
    List<String> eps = List();
    List<String> per = List();
    List<String> date = List();
    for (int i = 3; i < consensus.length; ++i) {
      profit.add(consensus[i]['SALES']);
      eps.add(consensus[i]['EPS']);
      per.add(consensus[i]['PER']);
      date.add(consensus[i]['YYMM']);
    }
    consensusList.add(Consensus(
        companyName: getCompanyName(cid),
        companyId: cid,
        date: date,
        per: per,
        eps: eps,
        profit: profit));
    print("test log");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Consensus App'),
      ),
      body: TabBarView(
        children: <Widget>[
          FirstApp(
            list: consensusList,
          ),
          SecondApp(
            list: consensusList,
          )
        ],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: <Tab>[
          Tab(
              icon: Icon(
            Icons.looks_one,
            color: Colors.blue,
          )),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.blue,
            ),
          ),
        ],
        controller: controller,
      ),
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
