part of 'pages.dart';

class SaintekPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final String title;
  final url;

  SaintekPage({this.bottomNavBarIndex = 0, this.title, this.url});

  @override
  _SaintekPageState createState() => _SaintekPageState();
}

class _SaintekPageState extends State<SaintekPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  YoutubePlayerController _controller;
  final fb = FirebaseDatabase.instance;
  TextEditingController _textFieldControllerTanggal = TextEditingController();
  TextEditingController _textFieldControllerWaktu = TextEditingController();

  bool select = false;
  bool select1 = false;
  bool select2 = false;
  bool select3 = false;
  bool select4 = false;
  bool select5 = false;
  String name = "1";
  String name1 = "0";
  double _volumeValue = 50;
  AudioManager audioManager;
  int maxVol, currentVol;
  Timer _timer;
  var jam = '';
  void startJam() {
    Timer.periodic(new Duration(seconds: 1), (_) {
      var tgl = new DateTime.now();
      var formatedjam = new DateFormat.Hms().format(tgl);
      setState(() {
        jam = formatedjam;
      });
    });
  }

  @override
  void initState() {
    startJam();
    // TODO: implement initState
    super.initState();
  }

  void onVolumeChanged(double value) {
    setState(() {
      _volumeValue = value;
    });
  }

  final List<Feature> features = [];

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference().child("Node1");
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor1)));

    return Scaffold(
        backgroundColor: Color(0xFFe6f7ff),
        appBar: new AppBar(
          backgroundColor: Color(0xFFe6f7ff),
          centerTitle: true,
          title: Text(
            "Atmosfer_SGD APPS",
            style: GoogleFonts.poppins().copyWith(
              color: blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  !snapshot.hasError &&
                  snapshot.data.snapshot.value != null) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 12.5),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 12, 12.5, 0),
                        child: BlocBuilder<UserBloc, UserState>(
                            builder: (_, userState) {
                          if (userState is UserLoaded) {
                            if (imageFileToUpload != null) {
                              uploadImage(imageFileToUpload)
                                  .then((downloadURL) {
                                imageFileToUpload = null;
                                context
                                    .bloc<UserBloc>()
                                    .add(UpdateData(profileImage: downloadURL));
                              });
                            }

                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/button_menu.png',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                140,
                                        child: Text(
                                          "Welcome, " + userState.user.name,
                                          style: blueTextFont.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Be Smart for your\nSmart Home',
                                        style: blackTextFont.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.clip,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Stack(
                                    children: <Widget>[
                                      SpinKitFadingCircle(
                                        color: accentColor2,
                                        size: 50,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context.bloc<PageBloc>().add(
                                              GoToEditProfilePage(
                                                  (userState as UserLoaded)
                                                      .user));
                                        },
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: blackColor, width: 4),
                                            image: DecorationImage(
                                                image: (userState.user
                                                            .profilePicture ==
                                                        ""
                                                    ? AssetImage(
                                                        "assets/user_pic.png")
                                                    : NetworkImage(userState
                                                        .user.profilePicture)),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return SpinKitFadingCircle(
                              color: accentColor2,
                              size: 50,
                            );
                          }
                        }),
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Monitoring",
                              style: GoogleFonts.openSans().copyWith(
                                  color: Color(0xFF152C5B),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0),
                            ),
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            size: 30,
                            color: blueColor,
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            size: 30,
                            color: blueColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // NOTE: GRAFIK
                      Graph(
                        dataInGb1:
                            snapshot.data.snapshot.value["cahaya"].toDouble(),
                        dataInGb2:
                            snapshot.data.snapshot.value["suhuc"].toDouble(),
                        dataInGb3:
                            snapshot.data.snapshot.value["suhuf"].toDouble(),
                        dataInGb4:
                            snapshot.data.snapshot.value["udara"].toDouble(),
                      ),
                      // NOTE: AKHIR GRAFIK

                      SizedBox(height: 10),
                      SingleChildScrollView(
                          child: Center(
                        child: Wrap(spacing: 15, runSpacing: 10.0, children: <
                            Widget>[
                          Container(
                            width: 148.0,
                            height: 185.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: 0,
                                  maximum: 1023,
                                  showLabels: false,
                                  showTicks: false,
                                  radiusFactor: 0.7,
                                  axisLineStyle: AxisLineStyle(
                                      cornerStyle: CornerStyle.bothCurve,
                                      color: Colors.black12,
                                      thickness: 20),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                        value: snapshot
                                            .data.snapshot.value["cahaya"]
                                            .toDouble(),
                                        cornerStyle: CornerStyle.bothCurve,
                                        width: 20,
                                        sizeUnit: GaugeSizeUnit.logicalPixel,
                                        gradient: const SweepGradient(
                                            colors: <Color>[
                                              Color(0xFF00FFFF),
                                              Color(0xFF3498DB)
                                            ],
                                            stops: <double>[
                                              0.25,
                                              0.75
                                            ])),
                                    MarkerPointer(
                                        value: snapshot
                                            .data.snapshot.value["cahaya"]
                                            .toDouble(),
                                        enableDragging: false,
                                        onValueChanged: onVolumeChanged,
                                        markerHeight: 27,
                                        markerWidth: 27,
                                        markerType: MarkerType.circle,
                                        color: Color(0xFF3498DB),
                                        borderWidth: 2,
                                        borderColor: Colors.white54)
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 10,
                                        positionFactor: 0.2,
                                        widget: Text(
                                            snapshot
                                                .data.snapshot.value["cahaya"]
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF3498DB)))),
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 5,
                                        positionFactor: 1.5,
                                        widget: Text('Light\nIntensity',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF3498DB),
                                            ),
                                            textAlign: TextAlign.center))
                                  ])
                            ]),
                          ),
                          Container(
                            width: 148.0,
                            height: 185.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: 0,
                                  maximum: 100,
                                  showLabels: false,
                                  showTicks: false,
                                  radiusFactor: 0.7,
                                  axisLineStyle: AxisLineStyle(
                                      cornerStyle: CornerStyle.bothCurve,
                                      color: Colors.black12,
                                      thickness: 20),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                        value: snapshot
                                            .data.snapshot.value["suhuc"]
                                            .toDouble(),
                                        cornerStyle: CornerStyle.bothCurve,
                                        width: 20,
                                        sizeUnit: GaugeSizeUnit.logicalPixel,
                                        gradient: const SweepGradient(
                                            colors: <Color>[
                                              Color(0xFFCC2B5E),
                                              Color(0xFF753A88)
                                            ],
                                            stops: <double>[
                                              0.25,
                                              0.75
                                            ])),
                                    MarkerPointer(
                                        value: snapshot
                                            .data.snapshot.value["suhuc"]
                                            .toDouble(),
                                        enableDragging: false,
                                        onValueChanged: onVolumeChanged,
                                        markerHeight: 27,
                                        markerWidth: 27,
                                        markerType: MarkerType.circle,
                                        color: Color(0xFF753A88),
                                        borderWidth: 2,
                                        borderColor: Colors.white54)
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 5,
                                        positionFactor: 0.2,
                                        widget: Text(
                                            snapshot.data.snapshot
                                                    .value["suhuc"]
                                                    .toString() +
                                                '°C',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFCC2B5E)))),
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 5,
                                        positionFactor: 1.5,
                                        widget: Text('Celcius\nTemperature',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFCC2B5E)),
                                            textAlign: TextAlign.center))
                                  ])
                            ]),
                          ),
                          Container(
                            width: 148.0,
                            height: 185.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: 0,
                                  maximum: 100,
                                  showLabels: false,
                                  showTicks: false,
                                  radiusFactor: 0.7,
                                  axisLineStyle: AxisLineStyle(
                                      cornerStyle: CornerStyle.bothCurve,
                                      color: Colors.black12,
                                      thickness: 20),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                        value: snapshot
                                            .data.snapshot.value["suhuf"]
                                            .toDouble(),
                                        cornerStyle: CornerStyle.bothCurve,
                                        width: 20,
                                        sizeUnit: GaugeSizeUnit.logicalPixel,
                                        gradient: const SweepGradient(
                                            colors: <Color>[
                                              Color(0xFF66FF66),
                                              Color(0xFF27AE60)
                                            ],
                                            stops: <double>[
                                              0.25,
                                              0.75
                                            ])),
                                    MarkerPointer(
                                        value: snapshot
                                            .data.snapshot.value["suhuf"]
                                            .toDouble(),
                                        enableDragging: false,
                                        onValueChanged: onVolumeChanged,
                                        markerHeight: 27,
                                        markerWidth: 27,
                                        markerType: MarkerType.circle,
                                        color: Color(0xFF27AE60),
                                        borderWidth: 2,
                                        borderColor: Colors.white54)
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 10,
                                        positionFactor: 0.2,
                                        widget: Text(
                                            snapshot.data.snapshot
                                                    .value["suhuf"]
                                                    .toString() +
                                                '°F',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF27AE60)))),
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 5,
                                        positionFactor: 1.5,
                                        widget: Text('Fahrenheit\nTemperature',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF27AE60),
                                            ),
                                            textAlign: TextAlign.center))
                                  ])
                            ]),
                          ),
                          Container(
                            width: 148.0,
                            height: 185.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: 0,
                                  maximum: 100,
                                  showLabels: false,
                                  showTicks: false,
                                  radiusFactor: 0.7,
                                  axisLineStyle: AxisLineStyle(
                                      cornerStyle: CornerStyle.bothCurve,
                                      color: Colors.black12,
                                      thickness: 20),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                        value: snapshot
                                            .data.snapshot.value["udara"]
                                            .toDouble(),
                                        cornerStyle: CornerStyle.bothCurve,
                                        width: 20,
                                        sizeUnit: GaugeSizeUnit.logicalPixel,
                                        gradient: const SweepGradient(
                                            colors: <Color>[
                                              Color(0xFFFFFF66),
                                              Color(0xFFF1C40F)
                                            ],
                                            stops: <double>[
                                              0.25,
                                              0.75
                                            ])),
                                    MarkerPointer(
                                        value: snapshot
                                            .data.snapshot.value["udara"]
                                            .toDouble(),
                                        enableDragging: false,
                                        onValueChanged: onVolumeChanged,
                                        markerHeight: 27,
                                        markerWidth: 27,
                                        markerType: MarkerType.circle,
                                        color: Color(0xFFF1C40F),
                                        borderWidth: 2,
                                        borderColor: Colors.white54)
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 10,
                                        positionFactor: 0.2,
                                        widget: Text(
                                            snapshot
                                                .data.snapshot.value["udara"]
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFF1C40F)))),
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 5,
                                        positionFactor: 1.2,
                                        widget: Text('Humidity',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFF1C40F),
                                            ),
                                            textAlign: TextAlign.center))
                                  ])
                            ]),
                          ),
                        ]),
                      )),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Monitoring",
                              style: blackTextFont.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            size: 30,
                            color: blueColor,
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            size: 30,
                            color: blueColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Wrap(spacing: 20, runSpacing: 20, children: <
                            Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 140,
                              height: 150.0,
                              decoration: snapshot.data.snapshot.value["cuaca"]
                                          .toDouble() ==
                                      1
                                  ? BoxDecoration(
                                      gradient: RadialGradient(
                                        colors: [
                                          Color(0xff22A7F0).withOpacity(0.26),
                                          Color(0xffC4FAF8).withOpacity(0.23)
                                        ],
                                        radius: 1.8,
                                        center: Alignment(0, 0),
                                      ),
                                      border: Border.all(
                                        width: 4,
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(27),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 3),
                                          blurRadius: 3,
                                          color: const Color(0xff000000)
                                              .withOpacity(0.90),
                                        )
                                      ],
                                    )
                                  : BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                    ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: snapshot.data.snapshot.value["cuaca"]
                                              .toDouble() ==
                                          1
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/icon_sun2.png",
                                              width: 75.0,
                                              height: 75,
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Rainy",
                                              style: whiteTextFont.copyWith(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/icon_sun1.png",
                                              width: 75.0,
                                              height: 75,
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "Sunny",
                                              style: blackTextFont.copyWith(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 140,
                              height: 150.0,
                              decoration: snapshot.data.snapshot.value["gas"]
                                          .toDouble() ==
                                      1
                                  ? BoxDecoration(
                                      color: redColor,
                                      borderRadius: BorderRadius.circular(27),
                                    )
                                  : BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                    ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: snapshot.data.snapshot.value["gas"]
                                              .toDouble() ==
                                          1
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/icon_awan2.png",
                                              width: 75.0,
                                              height: 75,
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Danger!!!",
                                              style: whiteTextFont.copyWith(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/icon_awan1.png",
                                              width: 75.0,
                                              height: 75,
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "Safe",
                                              style: blackTextFont.copyWith(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              launch(snapshot.data.snapshot.value["camera"]
                                  .toString());
                            },
                            child: Container(
                              width: 140,
                              height: 150.0,
                              decoration: select5
                                  ? BoxDecoration(
                                      gradient: RadialGradient(
                                        colors: [
                                          Color(0xff22A7F0).withOpacity(0.26),
                                          Color(0xffC4FAF8).withOpacity(0.23)
                                        ],
                                        radius: 1.8,
                                        center: Alignment(0, 0),
                                      ),
                                      border: Border.all(
                                        width: 4,
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(27),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 3),
                                          blurRadius: 3,
                                          color: const Color(0xff000000)
                                              .withOpacity(0.90),
                                        )
                                      ],
                                    )
                                  : BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                    ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: select5
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/icon_camera.png",
                                              width: 75.0,
                                              height: 75,
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "Camera",
                                              style: blackTextFont.copyWith(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/icon_camera.png",
                                              width: 75.0,
                                              height: 75,
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "Camera",
                                              style: blackTextFont.copyWith(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 140,
                              height: 150.0,
                              decoration: snapshot.data.snapshot.value["pir"]
                                          .toDouble() ==
                                      1
                                  ? BoxDecoration(
                                      color: redColor,
                                      borderRadius: BorderRadius.circular(27),
                                    )
                                  : BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                    ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: snapshot.data.snapshot.value["pir"]
                                              .toDouble() ==
                                          1
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/icon_thief1.png",
                                              width: 70.0,
                                              height: 70,
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Danger!!!",
                                              style: whiteTextFont.copyWith(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/icon_thief2.png",
                                              width: 70.0,
                                              height: 70,
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "Safe",
                                              style: blackTextFont.copyWith(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Control",
                              style: blackTextFont.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            size: 30,
                            color: blueColor,
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            size: 30,
                            color: blueColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Wrap(spacing: 20, runSpacing: 20, children: <
                            Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                select1 = !select1;
                                print('Button Selected = $select'); //log
                              });
                              select1
                                  ? ref.child("lampu1").set(name1)
                                  : ref.child("lampu1").set(name);
                              print('FAB tapped');
                            },
                            child: Container(
                              width: 140,
                              height: 150.0,
                              decoration: select1
                                  ? BoxDecoration(
                                      gradient: RadialGradient(
                                        colors: [
                                          Color(0xff22A7F0).withOpacity(0.26),
                                          Color(0xffC4FAF8).withOpacity(0.23)
                                        ],
                                        radius: 1.8,
                                        center: Alignment(0, 0),
                                      ),
                                      border: Border.all(
                                        width: 4,
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(27),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 3),
                                          blurRadius: 3,
                                          color: const Color(0xff000000)
                                              .withOpacity(0.90),
                                        )
                                      ],
                                    )
                                  : BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                    ),
                              child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: select1
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/icon_lamp2.png",
                                                  width: 120.0,
                                                  height: 70,
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "Lamp 1 On",
                                                  style: whiteTextFont.copyWith(
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                              ],
                                            )
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/icon_lamp1.png",
                                                  width: 70.0,
                                                  height: 70,
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "Lamp 1 Off",
                                                  style: blackTextFont.copyWith(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                              ],
                                            ))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Row(
                                        children: [
                                          Text(
                                            'Lamp 2',
                                            style: GoogleFonts.poppins(
                                              color: blackColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            jam,
                                            style: GoogleFonts.poppins(
                                              color: redColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          snapshot.data.snapshot
                                                      .value["lampu2"] ==
                                                  "1"
                                              ? Text(
                                                  'Hidup',
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.green,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              : Text(
                                                  'Mati',
                                                  style: GoogleFonts.poppins(
                                                    color: redColor,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Waktu 1',
                                            style: GoogleFonts.poppins(
                                              color: blackColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextFormField(
                                            controller:
                                                _textFieldControllerTanggal,
                                            decoration: InputDecoration(
                                              hintText: 'HH:MM:SS',
                                              hintStyle: greyTextFont,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Sampai',
                                            style: GoogleFonts.poppins(
                                              color: redColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Waktu 2',
                                            style: GoogleFonts.poppins(
                                              color: blackColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextFormField(
                                            controller:
                                                _textFieldControllerWaktu,
                                            decoration: InputDecoration(
                                              hintText: 'HH:MM:SS',
                                              hintStyle: greyTextFont,
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        FlatButton(
                                          child: Text('Cancel',
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                        //this needs to validate if the typed value was the same as the
                                        //hardcoded password, it would run the _getImage() function
                                        //the same as the validator in the TextFormField
                                        FlatButton(
                                          child: Text('OK',
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          onPressed: () {
                                            var jam1 =
                                                _textFieldControllerTanggal
                                                    .text;
                                            var jam2 =
                                                _textFieldControllerWaktu.text;

                                            if (jam1.compareTo(jam2) > 0) {
                                              print("1");
                                              ref.child("lampu2").set(name);
                                            } else {
                                              print("0");
                                              ref.child("lampu2").set(name1);
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              width: 140,
                              height: 150.0,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icon_lamp1.png",
                                    width: 120.0,
                                    height: 70,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Lamp 2",
                                    style: blackTextFont.copyWith(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                );
              } else {}
              return SpinKitFadingCircle(
                color: accentColor2,
                size: 90,
              );
            },
            stream: ref.onValue,
          ),
        ));
  }

  Future<void> readData() async {
    fb
        .reference()
        .child("Node1")
        .child("ldr")
        .once()
        .then((DataSnapshot snapshot) {
      print(snapshot.value);
    });
  }
}
