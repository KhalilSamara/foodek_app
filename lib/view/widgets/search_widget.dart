import 'package:flutter/material.dart';

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.grey),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.search),
            Expanded(
              child: CustomText(
                text: 'Search menu, restaurant, or etc',
                size: 12,
                color: AppColors.grey,
                alignment: TextAlign.center,
              ),
            ),
            Icon(Icons.filter_list),
          ],
        ),
      ),
    );
  }
}
