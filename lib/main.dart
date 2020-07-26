import 'package:flutter/material.dart';

import 'constants/Colorscheme.dart';
import 'constants/Strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
  _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: Text(
              'Skip',
              style: TextStyle(
                  color: Colorscheme.gray,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
             /* Image.asset('assets/image1.jpg'),
              Image.asset('assets/image2.jpg'),
              Image.asset('assets/image3.jpg'),*/
             makePage(
                  image: 'assets/image1.jpg',
                  title: Strings.Title1,
                  content: Strings.Content1
              ),
              makePage(
                  reverse: true,
                  image: 'assets/image2.jpg',
                  title: Strings.Title2,
                  content: Strings.Content2
              ),
              makePage(
                  image: 'assets/image3.jpg',
                  title: Strings.Title3,
                  content: Strings.Content3
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }


  Widget makePage({image, title, content, reverse = false}) {
    return Container(

      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse ?
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Image.asset(image),
              ),
              SizedBox(height: 30,),
            ],
          ) : SizedBox(),
          Text(title, style: TextStyle(
              color: Colorscheme.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20,),
          Text(content, textAlign: TextAlign.center, style: TextStyle(
              color: Colorscheme.gray,
              fontSize: 20,
              fontWeight: FontWeight.w400
          ),),
          reverse ?
          Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Image.asset(image),
              ),
            ],
          ) : SizedBox(),
        ],
      ),
    );
  }
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 20),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colorscheme.secondry,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
