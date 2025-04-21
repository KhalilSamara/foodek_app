import 'package:flutter/material.dart';
import 'package:foodek_app/core/util/extension.dart';
import 'package:foodek_app/core/util/responsive.dart';
import 'package:foodek_app/view/widgets/appbar_widget.dart';
import 'package:foodek_app/view/widgets/custom_text.dart';
import 'package:foodek_app/view/widgets/search_widget.dart';

import '../../core/util/colors.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  int status = 0;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case 0:
        return _buildOrder();
      default:
        return _buildOrder();
    }
  }

  _buildOrder() {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/map.png',
                height: context.screenHeight * 0.625,
                width: context.screenWidth,
                fit: BoxFit.fill,
              ),
              Column(
                children: [
                  SizedBox(height: responsiveHeight(context, 70)),
                  SearchBarWidget(
                    searchIconColor: AppColors.green,
                    hintText: 'Find your location',
                    backgroundColor: Colors.white,
                    showFilter: false,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: responsiveHeight(context, 30)),
          CustomText(text: 'On The Way', weight: FontWeight.w600),
          SizedBox(height: responsiveHeight(context, 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildProgressItem(text: 'Order Placed', progress: 0.5),
              _buildProgressItem(text: 'On The Way', progress: 0),
              _buildProgressItem(text: 'Delivered', progress: 0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressItem({required String text, required double progress}) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: text, size: 14, color: AppColors.light_grey),
            SizedBox(height: 4),
            SizedBox(
              width: 100,
              height: 4,
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.grey,
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
