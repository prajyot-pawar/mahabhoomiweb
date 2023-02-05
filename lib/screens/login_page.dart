import 'dart:io';
import 'dart:math';

// import 'package:hb_check_code/hb_check_code.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../providers/MetamaskProvider.dart';
import '../constants/loadingScreen.dart';
import './registerUser.dart';
import 'package:provider/provider.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import '../providers/LandRegisterModel.dart';
import '../constants/utils.dart';

class CheckPrivateKey extends StatefulWidget {
  final String val;
  const CheckPrivateKey({Key? key, required this.val}) : super(key: key);

  @override
  _CheckPrivateKeyState createState() => _CheckPrivateKeyState();
}

class _CheckPrivateKeyState extends State<CheckPrivateKey> {
  String code = randomAlpha(5);
  String privatekey = "";
  String errorMessage = "";
  bool isDesktop = false;
  double width = 590;
  bool _isObscure = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<LandRegisterModel>(context);
    var model2 = Provider.of<MetaMaskProvider>(context);

    width = MediaQuery.of(context).size.width;

    if (width > 600) {
      isDesktop = true;
      width = 590;
    }
    return Scaffold(
      

      
      body: 
      
      Container(
        //width: 500,
        // alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  '/gom.jpeg',
                  height: 280.0,
                  width: 520.0,
                ),
                Text(
                  "GOVT. of Maharashtra ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  
                ),
                Text(
                  "Dept. of Land Registration and Surveillance",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  
                )
              ],
            ),
            // Image.asset(
            //   'assets/authenticate.png',
            //   height: 280,
            //   width: 520,
            // ),
            VerticalDivider(
              color: Colors.black38,
              thickness: 2,
              indent: 150,
              endIndent: 150,
            ),
            SizedBox(
              width: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'UID :',
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Form(
                      // key: _formKey,
                      child: TextFormField(
                        controller: keyController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter uid';
                          }
                          return null;
                        },
                        obscureText: _isObscure,
                        onChanged: (val) {
                          privatekey = val;
                        },
                        decoration: InputDecoration(
                          suffixIcon: MaterialButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () async {
                              final clipPaste =
                                  await Clipboard.getData(Clipboard.kTextPlain);
                              keyController.text = clipPaste!.text!;
                              privatekey = keyController.text;
                              setState(() {});
                            },
                          ),
                          border: const OutlineInputBorder(),
                          hintText: 'Enter Your UID',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Private Key :',
                ),
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: keyController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter private key';
                          }
                          return null;
                        },
                        obscureText: _isObscure,
                        onChanged: (val) {
                          privatekey = val;
                        },
                        decoration: InputDecoration(
                          suffixIcon: MaterialButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () async {
                              final clipPaste =
                                  await Clipboard.getData(Clipboard.kTextPlain);
                              keyController.text = clipPaste!.text!;
                              privatekey = keyController.text;
                              setState(() {});
                            },
                            child: const Text(
                              "Paste",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          suffix: IconButton(
                              iconSize: 20,
                              constraints: const BoxConstraints.tightFor(
                                  height: 15, width: 15),
                              padding: const EdgeInsets.all(0),
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          border: const OutlineInputBorder(),
                          hintText: 'Enter Your Private Key',
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
                // Container(
                //     alignment: Alignment.center,
                //     child: HBCheckCode(
                //       code: code,
                //     )),
                InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Icon(Icons.refresh)),
                const Text('Type the above Text :'),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Form(
                      // key: _formKey,
                      child: TextFormField(
                        controller: keyController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter captcha';
                          }
                          return null;
                        },
                        obscureText: _isObscure,
                        onChanged: (val) {
                          privatekey = val;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Enter Captcha',
                        ),
                      ),
                    ),
                  ),
                ),
                CustomButton(
                    'Continue',
                    isLoading
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              privateKey = privatekey;
                              //print(privateKey);
                              connectedWithMetamask = false;
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                // await model.initiateSetup();

                                if (widget.val == "owner") {
                                  bool temp =
                                      await model.isContractOwner(privatekey);
                                  if (temp == false) {
                                    setState(() {
                                      errorMessage = "You are not authrosied";
                                    });
                                  } else {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const AddLandInspector()));
                                    Navigator.of(context).pushNamed(
                                      '/contractowner',
                                    );
                                  }
                                } else if (widget.val == "RegisterUser") {
                                  bool temp = await model.isUserregistered();
                                  if (temp) {
                                    setState(() {
                                      errorMessage = "You already registered";
                                    });
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterUser(),
                                      ),
                                    );
                                  }
                                } else if (widget.val == "LandInspector") {
                                  bool temp =
                                      await model.isLandInspector(privatekey);
                                  if (temp == false) {
                                    setState(() {
                                      errorMessage = "You are not authrosied";
                                    });
                                  } else {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const LandInspector()));
                                    Navigator.of(context).pushNamed(
                                      '/landinspector',
                                    );
                                  }
                                } else if (widget.val == "UserLogin") {
                                  bool temp = await model.isUserregistered();
                                  if (temp == false) {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const RegisterUser()));
                                    Navigator.of(context).pushNamed(
                                      '/registeruser',
                                    );
                                  } else {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const UserDashBoard()));
                                    Navigator.of(context).pushNamed(
                                      '/user',
                                    );
                                  }
                                }
                              } catch (e) {
                                print(e);
                                showToast("Something Went Wrong",
                                    context: context,
                                    backgroundColor: Colors.red);
                              }
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }),
                isLoading ? spinkitLoader : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
