part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/splash-screen.png'),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    context.bloc<PageBloc>().add(GoToLoginPage());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    margin: EdgeInsets.only(
                      bottom: 46,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.poppins(
                        color: Color(0xff13194F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
