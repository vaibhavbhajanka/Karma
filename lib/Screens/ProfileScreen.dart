import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        backgroundColor: Color(
          0xFFFF8500,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white30,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.45,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white30,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            30.0,
                          ),
                          topRight: Radius.circular(
                            30.0,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.15,
                          horizontal: size.width * 0.05,
                        ),
                        child: SizedBox(
                          width: size.width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: DetailWidget(
                                      size: size,
                                      heading: 'Name',
                                      info: 'Paul',
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.1,
                                  ),
                                  Expanded(
                                    child: DetailWidget(
                                      size: size,
                                      heading: 'Phone Number',
                                      info: '+91 9876543210',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.06,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: DetailWidget(
                                      size: size,
                                      heading: 'Location',
                                      info: 'New York City',
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.1,
                                  ),
                                  Expanded(
                                    child: DetailWidget(
                                      size: size,
                                      heading: 'Interest',
                                      info: 'Football',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Notifications',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Switch(
                                    activeColor: Color(0xFFFF8500),
                                    activeTrackColor: Color(0xFFFF8500),
                                    value: isSwitched,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitched=value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.15),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/profile_pic.jpg"),
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  final String heading;
  final String info;

  const DetailWidget({
    Key? key,
    required this.size,
    required this.heading,
    required this.info,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          heading,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Card(
          color: Color(
            0xFFF0F0F0,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.01,
            ),
            child: Center(
              child: Text(
                info,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
