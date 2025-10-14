import 'package:evently_app/extensions/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../design/design.dart';

class EventCards extends StatelessWidget {
  const EventCards({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: size.height * .22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(AppImages.Eating),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  '21',
                  style: context.appTextTheme.titleMedium?.copyWith(
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                Text(
                  'Nov',
                  style: context.appTextTheme.titleMedium?.copyWith(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () {},
                child: Icon(Icons.favorite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
