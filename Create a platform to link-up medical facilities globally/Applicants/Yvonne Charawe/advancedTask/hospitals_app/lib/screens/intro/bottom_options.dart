import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitals_app/utils/app_router.dart';
import 'package:hospitals_app/utils/color_from_hex.dart';

class BottomOptions extends StatelessWidget {
  const BottomOptions({super.key, this.currentPage = 0, this.totalPages = 3});
  final int currentPage;
  final int totalPages;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalPages, (index)
          {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 5,
              // width: currentPage == index ? 20 : 10,
              width: 60,
              decoration: BoxDecoration(
                color: currentPage == index
                ? ColorUtil.fromHex('#0071F2')
                : Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(5),
              ),
            );}
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.hospitals);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtil.fromHex('#0071F2'),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 10,
            ),
          ),
          child: Text(
            'Continue',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins (
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          ),
          const SizedBox(
            height: 100,
          ),
      ],
    );
  }
}
