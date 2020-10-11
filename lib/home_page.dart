import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:manasik/screen_util.dart';

class HomePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            header(),
            pageBody(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    var notche = ScreenUtil.statusBarHeight;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          'assets/images/header.png',
          fit: BoxFit.fill,
          height: 220,
          width: ScreenUtil.screenWidthDp,
        ),
        Positioned(
          top: notche + 15,
          child: Text(
            'MANASIK',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Positioned(
          top: notche + 15,
          left: 20,
          child: GestureDetector(
            onTap: () => _scaffoldKey.currentState.openDrawer(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey[100],
              ),
              child: Icon(Icons.menu, color: Colors.black, size: 20),
            ),
          ),
        ),
      ],
    );
  }

  Padding pageBody() {
    return Padding(
      padding: EdgeInsets.only(top: 135),
      child: Column(
        children: [
          // welcome title
          Text(
            'WELCOME',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          // card 1
          cardItem(
            image: 'assets/images/1.png',
            title: 'HAJ',
            onTab: () {},
          ),

          SizedBox(height: 20),

          // card 2
          cardItem(
            image: 'assets/images/2.png',
            title: 'UMRA',
            onTab: () {},
          ),

          SizedBox(height: 30),

          // Kafarat Al Ehram title
          Text(
            'Kafarat Al Ehram ',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          // Kafarat Al Ehram Row
          bottomRow(),

          // footer bubble
          bottombubble(),
        ],
      ),
    );
  }

  Container bottomRow() {
    bool isPortrait = ScreenUtil.portrait;
    double screenWidth = ScreenUtil.screenWidthDp;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(
        left: isPortrait ? screenWidth * 0.13 : screenWidth * 0.23,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowItem(
              title: 'Clothing',
              icon: Icons.person,
            ),
            rowItem(
              title: 'Hair\ncovering',
              icon: Icons.apps,
            ),
            rowItem(
              title: 'Hair\nclipping',
              icon: Icons.border_all,
            ),
            rowItem(
              title: 'Hair\ncovering',
              icon: Icons.code,
            ),
            rowItem(
              title: 'Hair\nclipping',
              icon: Icons.person,
            ),
          ],
        ),
      ),
    );
  }

  Widget rowItem({IconData icon, String title}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: ScreenUtil.screenWidthDp * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey[350],
                  offset: Offset(2, 5),
                ),
              ],
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(40),
                topStart: Radius.circular(40),
                topEnd: Radius.circular(40),
              ),
            ),
            child: Icon(icon, color: Colors.white, size: 40),
          ),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottombubble() {
    bool isPortrait = ScreenUtil.portrait;
    double screenWidth = ScreenUtil.screenWidthDp;

    return Padding(
      padding: EdgeInsets.only(
        left: isPortrait ? screenWidth * 0.15 : screenWidth * 0.25,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: isPortrait ? 160 : 170,
            width: screenWidth,
            child: Image.asset(
              'assets/images/bubble.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    bubbleRowItem(text1: 'in progress', text2: 'Hej Baddal'),
                    bubbleRowItem(text1: 'Time remaining', text2: '21:30 H'),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'swipe up for details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column bubbleRowItem({String text1, String text2}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 5),
        Text(
          text2,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Padding cardItem({String image, String title, Function onTab}) {
    bool isPortrait = ScreenUtil.portrait;
    double screenWidth = ScreenUtil.screenWidthDp;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isPortrait ? screenWidth * 0.15 : screenWidth * 0.25),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          // Image
          Container(
            width: double.infinity,
            child: Image.asset(image, fit: BoxFit.fill),
          ),

          // Bottom Button
          Positioned.directional(
            textDirection: TextDirection.ltr,
            bottom: -10,
            end: -20,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: Colors.grey[300],
                    offset: Offset(3, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: 120,
                    color: Colors.white.withOpacity(0.75),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: GestureDetector(
                      onTap: onTab,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
