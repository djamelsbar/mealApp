import 'package:flutter/material.dart';
import 'package:mealapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pview extends StatefulWidget {
  @override
  _PviewState createState() => _PviewState();
}

class Data {
  final String title;
  final String description;
  final String imageUrl;
  final IconData iconData;

  Data({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.iconData,
  });
}

class _PviewState extends State<Pview> {
  int _currentIndex = 0;
  final List<Data> myData = [
    Data(
        title: "Title 1",
        description: "Lorem ipsum dolor sit amet",
        imageUrl: "assets/images/q1.jpg",
        iconData: Icons.add_box),
    Data(
        title: "Title 2",
        description: "Lorem hit met dolor sit amet",
        imageUrl: "assets/images/q2.jpg",
        iconData: Icons.add_circle),
    Data(
        title: "Title 3",
        description: "Lorem ipsum coll nutop sit amet",
        imageUrl: "assets/images/q3.jpg",
        iconData: Icons.add_circle_outline),
    Data(
        title: "Title 4",
        description: "Lorem ipsum dolor vite amet",
        imageUrl: "assets/images/q4.jpg",
        iconData: Icons.add_comment),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/a': (ctx) => MyApp(),
      },
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              onPageChanged: (val) {
                setState(() {
                  _currentIndex = val;
                });
              },
              children: myData
                  .map((page) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: ExactAssetImage(page.imageUrl))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(page.iconData),
                          SizedBox(
                            height: 50,
                          ),
                          Center(child: Text(page.title)),
                          SizedBox(
                            height: 50,
                          ),
                          Center(child: Text(page.description)),
                        ],
                      )))
                  .toList(),
              // [
              //   Center(child: Text("text1")),
              //   Center(child: Text("text2")),
              //   Center(child: Text("text3")),
              // ],
            ),
            Center(child: Indicator(_currentIndex)),
            Builder(
              builder: (ctx) => Align(
                  alignment: Alignment(0, 0.9),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: EdgeInsets.all(7),
                      color: Colors.red,
                      child: Text(
                        "GET STARTED",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      onPressed: () async{
                        Navigator.of(ctx).pushReplacementNamed('/a');
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool('p_viewed', true);
                      },
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int index;
  const Indicator(this.index);

  @override
  Widget build(BuildContext context) {
    return Align( 
      alignment: Alignment(0, 0.75),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(index == 0 ? Colors.red : Colors.grey),
          buildContainer(index == 1 ? Colors.red : Colors.grey),
          buildContainer(index == 2 ? Colors.red : Colors.grey),
          buildContainer(index == 3 ? Colors.red : Colors.grey),
        ],
      ),
    );
  }

  Container buildContainer(Color color) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 15,
      width: 15,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
