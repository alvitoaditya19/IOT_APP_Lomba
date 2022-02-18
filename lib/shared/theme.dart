part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = Color(0xFF503E9D);
Color accentColor1 = Color(0xFF2C1F63);
Color accentColor2 = Color(0xFFFBD460);
Color accentColor3 = Color(0xFFADADAD);
Color blackColor = Color(0xff13194F);
Color blueColor = Color(0xff168CE2);
Color redColor = Color(0xffEF2929);
Color whiteColor = Color(0xffFFFFFF);

TextStyle blackTextFont = GoogleFonts.poppins(
  color: blackColor,
);
TextStyle reddTextFont = GoogleFonts.poppins(
  color: redColor,
);

TextStyle whiteTextFont = GoogleFonts.poppins(
  color: whiteColor,
);
TextStyle blueTextFont = GoogleFonts.poppins(
  color: blueColor,
);
TextStyle purpleTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);
TextStyle redTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.red, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle yellowNumberFont =
    GoogleFonts.openSans().copyWith(color: accentColor2);
