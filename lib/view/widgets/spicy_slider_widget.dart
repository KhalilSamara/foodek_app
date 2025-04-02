import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodek_app/core/util/responsive.dart';

import '../../core/util/colors.dart';
import 'custom_text.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key});

  @override
  _SpicySliderState createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  double _sliderValue = 0.3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: responsiveWidth(context, 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                  text: "Spicy",
                  color: AppColors.dark_grey,
                  size: 12.sp,
                  weight: FontWeight.w500,
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 6,
                  activeTrackColor: Colors.red,
                  inactiveTrackColor: Colors.grey.shade300,
                  thumbColor: Colors.red,
                  overlayColor: Colors.red.withValues(alpha: 0.2),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                ),
                child: Slider(
                  label: 'Spicy',
                  value: _sliderValue,
                  min: 0,
                  max: 1,
                  onChanged: (newValue) {
                    setState(() {
                      _sliderValue = newValue;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context, 24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Mild",
                      size: 12.sp,
                      color: Colors.green,
                      weight: FontWeight.w500,
                    ),
                    CustomText(
                      text: "Hot",
                      size: 12.sp,
                      color: Colors.red,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
