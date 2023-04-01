import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitals_app/utils/color_from_hex.dart';

import 'bottom_options.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<Widget> _pages = [];
  int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      Column(children: [
        const SizedBox(
          height: 70,
        ),
        const Image(
          image: AssetImage('assets/hospital.png'),
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Find a hospital with the ',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#0071F2'),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextSpan(
                text: 'services',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#C92C6D'),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextSpan(
                text: ' you need.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#0071F2'),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      Column(children: [
        const SizedBox(
          height: 70,
        ),
        const Image(
          image: AssetImage('assets/location.png'),
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 50,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Find a hospital ',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#0071F2'),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextSpan(
                text: 'near',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#C92C6D'),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextSpan(
                text: ' you.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#0071F2'),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      Column(children: [
        const SizedBox(
          height: 50,
        ),
        const Image(
          image: AssetImage('assets/app.png'),
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 40,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Search by',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#0071F2'),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextSpan(
                text: ' name',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#C92C6D'),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextSpan(
                text: ' or',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#0071F2'),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextSpan(
                text: ' location',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#C92C6D'),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextSpan(
                text: ' and',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#0071F2'),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextSpan(
                text: ' click on a service',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#C92C6D'),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextSpan(
                text: ' to get hospitals that offer it.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: ColorUtil.fromHex('#0071F2'),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    ];
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 0,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: _pages,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomOptions(
                currentPage: _currentPage,
                totalPages: _pages.length,
              ),
            )
          ],
        ),
      )
    );
  }
}
