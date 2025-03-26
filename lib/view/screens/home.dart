import 'package:flutter/material.dart';
import 'package:foodek_app/core/util/colors.dart';
import 'package:foodek_app/view/widgets/appbar_widget.dart';
import 'package:foodek_app/view/widgets/custom_text.dart';

import '../widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; // "All" is selected by default

  final List<String> categories = [
    "All",
    "Burger",
    "Pizza",
    "Sushi",
    "Pasta",
    "Salad",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          SearchBarWidget(),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update selected index
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.green : Colors.transparent,
                        border: Border.all(
                          color:
                              isSelected
                                  ? AppColors.green
                                  : AppColors.light_green,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(
                              index == 0
                                  ? Icons.apps
                                  : Icons.no_food, // Icon for "All"
                              size: 24,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                            SizedBox(width: 10),
                            CustomText(
                              text: categories[index],
                              size: 18,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
