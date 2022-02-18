part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          context.bloc<PageBloc>().add(GoToSplashPage());

          return;
        },
        child: Scaffold(
          backgroundColor: Color(0xFF152C5B),
          body: SingleChildScrollView(
            child: Center(
                child: Stack(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.2,
                width: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/start1.jpg"),
                  fit: BoxFit.none,
                )),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Transform.rotate(
                      angle: math.pi,
                      child: IconButton(
                        padding: const EdgeInsets.only(left: 300),
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Colors.white,
                        iconSize: 40,
                        onPressed: () {
                          context.bloc<PageBloc>().add(GoToSplashPage());
                        },
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'IOT APPS',
                      style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: '',
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black,
                            offset: Offset(3.0, 4.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  //JARAK DARI ATAS KITA AMBIL DARI HEIGHT DIBAGI 3.6
                  top: MediaQuery.of(context).size.height / 5,
                  //ISINYA ADALAH CONTAINER YANG WIDTHNYA SELEBAR MUNGKIN
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          //LALU CARD KITA SET MARGINNYA 20 DARI CONTAINER
                          margin: const EdgeInsets.all(20.0),
                          elevation: 8, //KETEBALANNYA
                          color: Colors.grey[300],
                          child: Padding(
                              //KEMUDIAN COLUMN KITA SET LAGI PADDINGNYA DARI CARD
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        "Login Account",
                                        style: GoogleFonts.poppins().copyWith(
                                          color: Color(0xFF152C5B),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 240),
                                      child: Text(
                                        "Email",
                                        style: GoogleFonts.poppins().copyWith(
                                          color: Color(0xFF152C5B),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 49,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.blue,
                                              blurRadius: 3.0,
                                              offset: Offset(0, 0),
                                            ),
                                          ]),
                                      child: TextField(
                                          onChanged: (text) {
                                            setState(() {
                                              isEmailValid =
                                                  EmailValidator.validate(text);
                                            });
                                          },
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.blue,
                                            fontFamily: 'OpenSans',
                                          ),
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Colors.blue,
                                            ),
                                            labelText: "Enter your Email",
                                            hintText: 'Enter your Email',
                                          )),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 200),
                                      child: Text(
                                        "Password",
                                        style: GoogleFonts.poppins().copyWith(
                                          color: Color(0xFF152C5B),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 49,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.blue,
                                              blurRadius: 3.0,
                                              offset: Offset(0, 0),
                                            ),
                                          ]),
                                      child: TextField(
                                          onChanged: (text) {
                                            setState(() {
                                              isPasswordValid =
                                                  text.length >= 6;
                                            });
                                          },
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.blue,
                                            fontFamily: 'OpenSans',
                                          ),
                                          controller: passwordController,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Colors.blue,
                                            ),
                                            labelText: "Enter your Password",
                                            hintText: 'Enter your Password',
                                          )),
                                    ),
                                    SizedBox(height: 20),
                                    Center(
                                        child: isSigningIn
                                            ? SpinKitFadingCircle(
                                                color: Colors.blue
                                                    .withOpacity(0.7),
                                              )
                                            : RaisedButton(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 90),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                color: Colors.blue
                                                    .withOpacity(0.7),
                                                child: Text(
                                                  'LOGIN',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 1.5,
                                                    fontSize: 23.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'OpenSans',
                                                  ),
                                                ),
                                                onPressed: isEmailValid &&
                                                        isPasswordValid
                                                    ? () async {
                                                        setState(() {
                                                          isSigningIn = true;
                                                        });

                                                        SignInSignUpResult
                                                            result =
                                                            await AuthServices.signIn(
                                                                emailController
                                                                    .text,
                                                                passwordController
                                                                    .text);

                                                        if (result.user ==
                                                            null) {
                                                          setState(() {
                                                            isSigningIn = false;
                                                          });

                                                          Flushbar(
                                                            duration: Duration(
                                                                seconds: 4),
                                                            flushbarPosition:
                                                                FlushbarPosition
                                                                    .TOP,
                                                            backgroundColor:
                                                                Color(
                                                                    0xFFFF5C83),
                                                            message:
                                                                result.message,
                                                          )..show(context);
                                                        }
                                                      }
                                                    : null)),
                                    SizedBox(height: 8),
                                  ])))))),
            ])),
          ),
        ));
  }
}
