import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'color.dart';

void main() => runApp(const MyHomePage());

ThemeData meinBasisTheme() {
  final basisTheme = ThemeData.light();
  return basisTheme.copyWith(
    primaryColor: meinePrimFarbe,
    primaryColorDark: meinePrimDunke,
    primaryColorLight: meinePrimLight,
    scaffoldBackgroundColor: meineSekuFarbe,
  );
}

class MyHomePage extends StatefulWidget {
  @override
  const MyHomePage({super.key});

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PH Navi",
      theme: meinBasisTheme(),
      home: Scaffold(
        appBar: new AppBar(centerTitle: true, title: const Text("PH Navi")),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              Container(
                color: meineSekuDunke,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Startpunkt"),
                      SizedBox(height: 22),
                      Text("Ziel"),
                    ],
                  ),
                ),
              ),
              Container(
                color: meineSekuDunke,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: _currentIndex,
            backgroundColor: meinePrimLight,
            onItemSelected: (index) {
              setState(() {
                _pageController.jumpToPage(index);
              });
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                  title: Text("Navigation"),
                  icon: Icon(Icons.assistant_direction, color: meinePrimFarbe),
                  activeColor: meinePrimDunke),
              BottomNavyBarItem(
                  title: Text("Pläne"),
                  icon: Icon(Icons.map_outlined, color: meinePrimFarbe),
                  activeColor: meinePrimFarbe),
            ]),
      ),
    );
  }
}
