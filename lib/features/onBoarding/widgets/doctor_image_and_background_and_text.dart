import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oop/core/theming/styles.dart';

class DoctorImageAndBackgroundAndText extends StatelessWidget {
  const DoctorImageAndBackgroundAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.centerRight,
      children: [
        SvgPicture.asset(
          'assets/svgs/docdoc_background.svg',
        ),
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.white,
              // ignore: deprecated_member_use
              Colors.white.withOpacity(0.0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.14, 0.4],
          )),
          child: Image.asset(
            'assets/images/doctor.png',
          ),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Text(
            'Best Doctor\nAppointment App',
            textAlign: TextAlign.center,
            style: TextStyles.font32bluebold.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}
