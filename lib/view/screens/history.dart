import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodek_app/view/widgets/appbar_widget.dart';
import 'package:foodek_app/view/widgets/switcher_widget.dart';
import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/empty_widget.dart';
import '../widgets/history_item_widget.dart';
import '../widgets/notification_wiget.dart';
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
  bool cartEmpty = false;
  bool historyEmpty = true;
  int status = 0;

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage() {
    switch (status) {
      case 0:
        return _buildSwitcher();
      case 1:
        return _buildLocation();
      default:
        return _buildSwitcher();
    }
  }

  Widget _buildSwitcher() {
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
              cartEmpty
                  ? EmptyWidget(
                    title: "Cart Empty",
                    subtitle:
                        "You don't have add any foods in cart at this time",
                    emptyImage: "assets/images/empty.png",
                  )
                  : Stack(
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
                        child: OrderSheetWidget(
                          context: context,
                          onTap: () {
                            setState(() {
                              status = 1;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
              historyEmpty
                  ? EmptyWidget(
                    title: "History Empty",
                    subtitle: "You don't have order any foods before",
                    emptyImage: "assets/images/empty.png",
                  )
                  : ListView.builder(
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

  Widget _buildLocation() {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Spacer(),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(5),
                width: responsiveWidth(context, 34),
                height: responsiveHeight(context, 34),
                decoration: BoxDecoration(
                  color: AppColors.off_white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset('assets/icons/bell.svg'),
              ),
              onTap: () {
                showNotifications(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(children: []),
    );
  }
}
