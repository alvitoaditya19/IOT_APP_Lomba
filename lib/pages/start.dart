part of 'pages.dart';

class StartMenu extends StatefulWidget {
  @override
  _StartMenuState createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    new OnePage(),
    new TwoPage(),
    new ThreePage(),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 17,
                        width: (index == _currentPage) ? 40 : 20,
                        margin:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (index == _currentPage)
                                ? Colors.white
                                : Colors.white.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                  child:
                  (_currentPage == (_pages.length - 1))
                      ? context.bloc<PageBloc>().add(GoToLoginPage())
                      : (_currentPage == (_pages.length - 1));
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      : Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
