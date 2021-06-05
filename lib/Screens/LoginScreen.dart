import 'dart:convert';
// import 'dart:html';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:karma_app/Screens/KarmaDriveScreen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                height: size.height * 0.3,
                color: Color(0xFFFF8500),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'images/karma_logo.jpg',
                        width: size.width * 0.4,
                        height: size.height * 0.2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        5.0,
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.075),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: size.height * 0.075,
                  ),
                  Card(
                    color: Color(0xFFF0F0F0),
                    child: ListTile(
                      title: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration.collapsed(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ReusableField(
                  //   'Email',
                  //   Icon(null),
                  //     (value){
                  //     email=value;
                  //     }
                  // ),
                  SizedBox(
                    height: size.height * 0.075,
                  ),
                  Card(
                    color: Color(0xFFF0F0F0),
                    child: ListTile(
                      title: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value){
                          password = value;
                        },
                        decoration: InputDecoration.collapsed(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      trailing: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  // ReusableField(
                  //     'Password',
                  //     Icon(
                  //       Icons.remove_red_eye,
                  //       color: Colors.black,
                  //     ), (value) {
                  //   password = value;
                  // }),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Color(
                            0xFFFF8500,
                          ),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.075,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: size.width * 0.4, height: size.height * 0.075),
                    child: ElevatedButton(
                      onPressed: () {
                        signInMethod(email, password, context);
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF53e40d),
                          textStyle: TextStyle(
                            fontSize: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: 'Not a member yet? ',
                              // style: TextStyle(),
                            ),
                            TextSpan(
                                text: 'Click Here',
                                style: TextStyle(
                                  color: Color(0xFFFF8500),
                                ))
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ReusableField extends StatelessWidget {
//   final String hint;
//   final Icon icon;
//   final FunctionStringCallback onChanged;
//
//   const ReusableField(this.hint, this.icon, this.onChanged,{Key? key}) : super(key: key);
//
//   // ReusableField({this.hint,this.icon});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Color(0xFFF0F0F0),
//       child: ListTile(
//         title: TextField(
//           keyboardType: TextInputType.emailAddress,
//           onChanged: onChanged,
//           decoration: InputDecoration.collapsed(
//             hintText: hint,
//             hintStyle: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//         ),
//         trailing: icon,
//       ),
//     );
//   }
// }

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

signInMethod(String email, String password, BuildContext context) async {
  String url = "https://reqres.in/api/login";
  var response = await http
      .post(Uri.parse(url), body: {"email": email, "password": password});

  var jsonResponse = null;

  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);
    if (jsonResponse != null) {
      print(jsonResponse['token']); // for Printing the token

      // Navigator used to enter inside app if the authentication is correct
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => KarmaDriveScreen(),
          ),
          (Route<dynamic> route) => false);
    }
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => _buildPopupDialog(context),
    );
    // print("Email or Password wrong!!!!"); // Toast
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Error!'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Wrong email or password"),
      ],
    ),
    actions: <Widget>[
      new TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}