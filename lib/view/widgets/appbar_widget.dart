import 'package:flutter/material.dart';
import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import 'custom_text.dart';

PreferredSizeWidget AppBarWidget({required BuildContext context}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          _buildIconContainer(
            context: context,
            icon: Icons.location_on_outlined,
            containerColor: AppColors.light_green,
            iconColor: AppColors.green,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: 'Current Location',
                    color: AppColors.grey,
                    size: 12,
                    weight: FontWeight.w400,
                  ),
                  Icon(Icons.arrow_drop_down, color: AppColors.grey),
                ],
              ),
              CustomText(
                text: 'JI. Soekarno Hatta 15A...',
                size: 14,
                weight: FontWeight.w600,
              ),
            ],
          ),
          Spacer(),
          _buildIconContainer(
            context: context,
            icon: Icons.notifications_none_rounded,
            containerColor: AppColors.off_white,
            iconColor: Colors.black,
          ),
        ],
      ),
    ),
  );
}

Widget _buildIconContainer({
  required BuildContext context,
  required IconData icon,
  required Color iconColor,
  required Color containerColor,
}) {
  return Container(
    width: responsiveWidth(context, 34),
    height: responsiveHeight(context, 34),
    decoration: BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Icon(icon, color: iconColor),
  );
}
