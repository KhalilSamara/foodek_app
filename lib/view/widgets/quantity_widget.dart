import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import 'custom_text.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: responsiveWidth(context, 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                  text: "Quantity",
                  color: AppColors.dark_grey,
                  size: 12,
                  weight: FontWeight.w500,
                ),
              ),
              SizedBox(height: responsiveHeight(context, 20)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context, 20),
                ),
                child: Row(
                  children: [
                    Container(
                      height: responsiveHeight(context, 32),
                      width: responsiveWidth(context, 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.mid_green),
                      ),
                      child: Icon(Icons.remove, color: AppColors.mid_green),
                    ),
                    Spacer(),
                    CustomText(text: "1", weight: FontWeight.w500, size: 20.sp),
                    Spacer(),
                    Container(
                      height: responsiveHeight(context, 32),
                      width: responsiveWidth(context, 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.mid_green,
                      ),
                      child: Icon(Icons.add, color: Colors.white),
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
