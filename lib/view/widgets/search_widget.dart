import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import 'custom_text.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: responsiveWidth(context, 370),
        height: responsiveHeight(context, 42),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.grey),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/search.svg',
              color: AppColors.light_grey,
            ),
            SizedBox(width: responsiveWidth(context, 8)),
            CustomText(
              text: 'Search menu, restaurant, or etc',
              size: 12,
              color: AppColors.grey,
              alignment: TextAlign.center,
            ),
            Spacer(),
            SvgPicture.asset(
              'assets/icons/filter.svg',
              color: AppColors.light_grey,
            ),
          ],
        ),
      ),
    );
  }
}
