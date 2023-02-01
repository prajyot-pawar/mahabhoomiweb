import 'package:flutter/material.dart';
import 'package:mahabhoomiweb/widgets/header.dart';
import 'package:mahabhoomiweb/widgets/homePageDesc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/utils.dart';
import 'package:sizer/sizer.dart';
// import 'package:adaptive_navbar/adaptive_navbar.dart';

class my_login_page extends StatefulWidget {
  const my_login_page({Key? key}) : super(key: key);

  @override
  _my_login_pageState createState() => _my_login_pageState();
}

class _my_login_pageState extends State<my_login_page> {
  double scrWidth = 0.0;
  double scrHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    scrWidth = MediaQuery.of(context).size.width;
    scrHeight = MediaQuery.of(context).size.height;

    // final sw = MediaQuery.of(context).size.width;
    width = MediaQuery.of(context).size.width;
    // if (width > 600) {
    //   width = 590;
    //   isDesktop = true;
    // }
    // if (width < 600) {
    //   width = 460;
    //   isDesktop = false;
    // }

    return Scaffold(
      body: Card(
          child: Material(
            // elevation: 10,
            // padding: EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
            child: Stack(
              children: [
                Container(
                    alignment: FractionalOffset.bottomCenter,
                  width: scrWidth * 0.5,
                  height: scrWidth * 1,
                    child:
                    Padding(
                        padding: EdgeInsets.only(bottom: 5.0,left: 1.0),
                        child:(
                            Image.asset('assets/background_image.png',
                              height: height,
                              width: double.infinity,
                              fit: BoxFit.cover,)
                        ),
                    )
                ),
                Container(
                  width: scrWidth * 0.5,
                  height: scrWidth * 0.5,
                    child: const LeftDescription(),
                  // child: SvgPicture.asset(
                  //   'assets/background_image.svg',
                  //   color: Color.fromARGB(255, 255, 169, 98),
                  //   height: 20.0,
                  //   width: 20.0,
                  //   allowDrawingOutsideViewBox: true,
                  // ),
                ),
              ],
            ),
          )

        )
        , // This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}
