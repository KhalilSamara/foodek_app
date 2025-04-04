import 'package:flutter/material.dart';
import 'package:foodek_app/core/util/colors.dart';
import 'package:foodek_app/core/util/responsive.dart';
import 'package:foodek_app/view/widgets/appbar_widget.dart';
import 'package:foodek_app/view/widgets/bottom_widget.dart';
import 'package:foodek_app/view/widgets/custom_text.dart';
import 'package:foodek_app/view/widgets/switcher_widget.dart';

import '../widgets/cart_item_widget.dart';
import '../widgets/history_item_widget.dart';
import '../widgets/order_sheet_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> myTabs = ["Cart", "History"];
  ValueNotifier<String> selectedTabNotifier = ValueNotifier("Cart");
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<Map> items = [
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Chicken Burger",
        "description": "Burger factory LTD",
        "price": 20.0,
        "date": "25.3.2024",
      },
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Cheese Burger",
        "description": "Burger factory LTD",
        "price": 25.0,
        "date": "25.3.2024",
      },
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Cheese Burger",
        "description": "Burger factory LTD",
        "price": 25.0,
        "date": "25.3.2024",
      },
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Cheese Burger",
        "description": "Burger factory LTD",
        "price": 25.0,
        "date": "25.3.2024",
      },
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Cheese Burger",
        "description": "Burger factory LTD",
        "price": 25.0,
        "date": "25.3.2024",
      },
      {
        "path": "assets/images/cheese-burger.png",
        "title": "Cheese Burger",
        "description": "Burger factory LTD",
        "price": 25.0,
        "date": "25.3.2024",
      },
    ];
    return Scaffold(
      appBar: AppBarWidget(context: context),
      body: Column(
        children: [
          SwitcherWidget(
            tabs: myTabs,
            selectedTabNotifier: selectedTabNotifier,
            pageController: pageController,
            pages: [
              Stack(
                children: [
                  ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        path: items[index]['path'],
                        title: items[index]['title'],
                        description: items[index]['description'],
                        price: items[index]['price'],
                        onDismissed: () {},
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: OrderSheetWidget(context: context),
                  ),
                ],
              ),

              ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return HistoryItemWidget(
                    path: items[index]['path'],
                    title: items[index]['title'],
                    description: items[index]['description'],
                    price: items[index]['price'],
                    date: items[index]['date'],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
