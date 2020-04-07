import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var currentPage = 0;
  var isPageCanChanged = true;
  TabController _tabcontroller;
  @override
  void initState() {
    super.initState();

    _tabcontroller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: AppBar(
              elevation: 0,
              backgroundColor: Color(0xff030e47),
              bottom: TabBar(
                  indicator: UnderlineTabIndicator(
                    insets: EdgeInsets.symmetric(horizontal: 50.0),
                    borderSide: BorderSide(
                      width: 3.0,
                      color: Color(0xff69f1f5),
                    ),
                  ),
                  controller: _tabcontroller,
                  tabs: <Tab>[
                    new Tab(
                        child: Text(
                      'Iceland',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    )),
                    new Tab(
                        child: Text(
                      'Greenland',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    )),
                    new Tab(
                        child: Text(
                      'Norway',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    )),
                  ]),
            ),
          ),
          body: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: width,
                    height: height / 3.5,
                    decoration: BoxDecoration(
                        color: Color(0xff030e47),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: width,
                    height: height/2,
                    child: TabBarView(
                      controller: _tabcontroller,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
                        width: width / 2.5,
                        height: height /2.5 ,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/iceland.jpg'),fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.blueGrey, blurRadius: 10)
                            ]),
                      ),
                     Container(
                        margin: EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
                        width: width / 2.5,
                        height: height /2.5 ,
                        decoration: BoxDecoration(
                             image: DecorationImage(
                              image: AssetImage('assets/greenland.jpg'),fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.blueGrey, blurRadius: 10)
                            ]),
                      ),
                                            Container(
                        margin: EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
                        width: width / 2.5,
                        height: height /2.5 ,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/norway.jpg'),fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.blueGrey, blurRadius: 10)
                            ]),
                      ),
                    ],

                  ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
