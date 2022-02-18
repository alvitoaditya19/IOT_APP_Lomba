part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  EditProfilePage(this.user);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController;
  String profilePath;
  bool isDataEdited = false;
  File profileImageFile;
  bool isUpdating = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    profilePath = widget.user.profilePicture;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSaintekPage());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Edit Profile\nKamu",
                        textAlign: TextAlign.center,
                        style: blackTextFont.copyWith(fontSize: 20),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 22, bottom: 10),
                        width: 90,
                        height: 104,
                        child: Stack(
                          children: <Widget>[
                            Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: (profileImageFile != null)
                                            ? FileImage(profileImageFile)
                                            : (profilePath != "")
                                                ? NetworkImage(profilePath)
                                                : AssetImage(
                                                    "assets/user_pic.png"),
                                        fit: BoxFit.cover))),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () async {
                                  if (profilePath == "") {
                                    profileImageFile = await getImage();

                                    if (profileImageFile != null) {
                                      profilePath =
                                          basename(profileImageFile.path);
                                    }
                                  } else {
                                    profileImageFile = null;
                                    profilePath = "";
                                  }

                                  setState(() {
                                    isDataEdited =
                                        (nameController.text.trim() !=
                                                    widget.user.name ||
                                                profilePath !=
                                                    widget.user.profilePicture)
                                            ? true
                                            : false;
                                  });
                                },
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage((profilePath == "")
                                              ? "assets/btn_add_photo.png"
                                              : "assets/btn_del_photo.png"))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      AbsorbPointer(
                        child: TextField(
                          controller:
                              TextEditingController(text: widget.user.id),
                          style: whiteNumberFont.copyWith(color: accentColor3),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            labelText: "User ID",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      AbsorbPointer(
                        child: TextField(
                          controller:
                              TextEditingController(text: widget.user.email),
                          style: greyTextFont,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            labelText: "Email Address",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: nameController,
                        onChanged: (text) {
                          setState(() {
                            isDataEdited = (text.trim() != widget.user.name ||
                                    profilePath != widget.user.profilePicture)
                                ? true
                                : false;
                          });
                        },
                        style: blackTextFont,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            labelText: "Full Name",
                            hintText: "Full Name"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 250,
                        height: 45,
                        child: RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.exit_to_app,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Ubah Password",
                                  style: whiteTextFont.copyWith(
                                      fontSize: 16,
                                      color: (isUpdating)
                                          ? Color(0xFFBEBEBE)
                                          : Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.archive,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                            disabledColor: Color(0xFFE4E4E4),
                            color: Colors.red[400],
                            onPressed: (isUpdating)
                                ? null
                                : () async {
                                    await AuthServices.resetPassword(
                                        widget.user.email);

                                    Flushbar(
                                      duration: Duration(milliseconds: 2000),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Color(0xFFFF5C83),
                                      message:
                                          "The link to change your password has been sent to your email.",
                                    )..show(context);
                                  }),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      (isUpdating)
                          ? SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitFadingCircle(
                                color: Color(0xFF3E9D9D),
                              ),
                            )
                          : SizedBox(
                              width: 250,
                              height: 45,
                              child: RaisedButton(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    "Update My Profile",
                                    style: whiteTextFont.copyWith(
                                        fontSize: 16,
                                        color: (isDataEdited)
                                            ? Colors.white
                                            : Color(0xFFBEBEBE)),
                                  ),
                                  disabledColor: Color(0xFFE4E4E4),
                                  color: Color(0xFF3E9D9D),
                                  onPressed: (isDataEdited)
                                      ? () async {
                                          setState(() {
                                            isUpdating = true;
                                          });

                                          if (profileImageFile != null) {
                                            profilePath = await uploadImage(
                                                profileImageFile);
                                          }

                                          context.bloc<UserBloc>().add(
                                              UpdateData(
                                                  name: nameController.text,
                                                  profileImage: profilePath));

                                          context
                                              .bloc<PageBloc>()
                                              .add(GoToMainPage());
                                        }
                                      : null),
                            ),
                      SizedBox(height: 10),
                      RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.black,
                          onPressed: () async {
                            final ConfirmAction action =
                                await _asyncConfirmDialog(context);
                            print("Confirm Action $action");
                          },
                          child: Text(
                            "Keluar",
                            style: whiteTextFont.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )),
                    ],
                  )
                ],
              ),
            ),
            SafeArea(
                child: Container(
              margin: EdgeInsets.only(top: 20, left: defaultMargin),
              child: GestureDetector(
                onTap: () {
                  context.bloc<PageBloc>().add(GoToSaintekPage());
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

enum ConfirmAction { Cancel, Accept }
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Log Out',
          style: blackTextFont.copyWith(fontSize: 25),
        ),
        content: Text(
          'Kamu yakin ingin keluar?',
          style: blackTextFont.copyWith(fontSize: 20),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Batal',
              style: blueTextFont.copyWith(
                  fontSize: 15, fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          FlatButton(
            child: Text(
              'Keluar',
              style: redTextFont.copyWith(
                  fontSize: 15, fontWeight: FontWeight.w500),
            ),
            onPressed: () {
              AuthServices.signOut();
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}
