import 'package:flutter/material.dart';

class ThreePage extends StatefulWidget {
  @override
  _ThreePageState createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/start4.jpg"),
              fit: BoxFit.cover,
            )),
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, right: 30.0),
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 40.0),
                          Text(
                            'IoT Application',
                            style: TextStyle(
                              fontSize: 35,
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
                            'with Various',
                            style: TextStyle(
                              fontSize: 35,
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
                            'Features',
                            style: TextStyle(
                              fontSize: 35,
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
                            'that Makes it Easy',
                            style: TextStyle(
                              fontSize: 35,
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
                            'For Users To Do',
                            style: TextStyle(
                              fontSize: 35,
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
                            'Monitoring and',
                            style: TextStyle(
                              fontSize: 35,
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
                            'Control',
                            style: TextStyle(
                              fontSize: 35,
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
                        ])
                    // ),
                    //  ),
                    ))));
  }
}
