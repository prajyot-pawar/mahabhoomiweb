import 'package:flutter/material.dart';
import 'package:mahabhoomiweb/widgets/header.dart';
import 'package:mahabhoomiweb/widgets/homePageDesc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/utils.dart';
import 'package:sizer/sizer.dart';
// import 'package:adaptive_navbar/adaptive_navbar.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  double scrWidth =0.0;
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Top Header
            const Material(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
                child: HeaderWidget(),
              ),
            ),

            // Expanded(
            //   child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: <Widget>[
            //     const LeftDescription(),
            //     Flexible(
            //       child: Container(
            //         width: width,
            //         height: height,
            //         child: SvgPicture.asset(
            //           'assets/in.svg',
            //           //color: Color.fromARGB(255, 255, 169, 98),
            //           height: 20.0,
            //           width: 20.0,
            //           allowDrawingOutsideViewBox: true,
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 200, top: 0, right: 0),
            //
            // ),
            getMiddleSizedBox(),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAnimatedContainer('Contract Owner', () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const CheckPrivateKey(
                  //               val: "owner",
                  //             )));
                  Navigator.of(context).pushNamed(
                    '/login',
                    arguments: "owner",
                  );
                }),
                CustomAnimatedContainer('Land Inspector', () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const CheckPrivateKey(
                  //               val: "LandInspector",
                  //             )));
                  Navigator.of(context).pushNamed(
                    '/login',
                    arguments: "LandInspector",
                  );
                }),
                CustomAnimatedContainer('User', () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const CheckPrivateKey(
                  //               val: "UserLogin",
                  //             )));
                  Navigator.of(context).pushNamed(
                    '/login',
                    arguments: "UserLogin",
                  );
                }),
              ],
            ),
            // const SizedBox(
            //   height: 100,
            // ),
          ],
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  getMiddleSizedBox() {
    return Container(
      child: Row(
        children: [
          Container(
            width: scrWidth * 0.5,
            height: scrWidth * 0.5,
            child:  const LeftDescription(),
          ),
        Container(
                width: scrWidth * 0.5,
                height: scrWidth * 0.5,
                child: SvgPicture.asset(
                  'assets/in.svg',
                  //color: Color.fromARGB(255, 255, 169, 98),
                  height: 20.0,
                  width: 20.0,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
        ],
      ),
    );
  }
}
