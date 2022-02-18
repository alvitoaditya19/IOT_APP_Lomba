import 'package:flutter/material.dart';

class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/start2.jpg"),
              fit: BoxFit.cover,
            )),
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, right: 100),
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 40.0),
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(3.0, 4.0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 7.0),
                          Text(
                            'To The',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(3.0, 4.0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 7.0),
                          Text(
                            'IOT APPS',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(3.0, 4.0),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Application',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(3.0, 4.0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 7.0),
                        ])
                    // ),
                    //  ),
                    ))));
  }
}
