import 'package:flutter/material.dart';
import 'package:my_app/core/constant/image_constants.dart';
import 'package:my_app/core/constant/string_constants.dart';
import 'package:my_app/model/drawer_data_model.dart';
import 'package:my_app/views/dineout_screen.dart';
import 'package:my_app/views/food_screen.dart';
import 'package:my_app/views/genie_screen.dart';
import 'package:my_app/views/instamart_screen.dart';
import 'package:my_app/views/swiggy_screen.dart';

import 'widget/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _indexChanged(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List tabs = [
    const SwiggyScreen(),
    const FoodScreen(),
    const InstamartScreen(),
    const DineoutScreen(),
    const GenieScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Drawer(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Builder(builder: (context) {
                      return InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_rounded));
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 30, right: 10, bottom: 10),
                  child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: const [
                              Text(
                                StringConstants.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                StringConstants.mobile,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            const Text(
                              StringConstants.edit,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ],
                        ),
                      ]),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: drawerList.length,
                    itemBuilder: (context, index) {
                      DrawerDataModel item = drawerList[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(item.title,
                                style: index != 6
                                    ? const TextStyle(
                                        fontSize: 15,
                                      )
                                    : const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                            subtitle: index != 6
                                ? Text(
                                    item.subTitle ?? '',
                                    style: const TextStyle(fontSize: 13),
                                  )
                                : null,
                            trailing: InkWell(
                              child: const Icon(Icons.chevron_right_sharp),
                              onTap: () {
                                // final snackBar = SnackBar(
                                //   content: const Text('Hi, I am a SnackBar!'),
                                //   backgroundColor: (Colors.black12),
                                //   action: SnackBarAction(
                                //     label: 'dismiss',
                                //     onPressed: () {},
                                //   ),
                                // );
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(snackBar);
                              },
                            ),
                            // onTap: () {
                            //   Navigator.pop(context);
                            // },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: index != 5 && index != 6
                                ? const Divider(
                                    color: Colors.black,
                                  )
                                : null,
                          ),
                          SizedBox(
                            child: index == 5
                                ? Divider(
                                    color: Colors.grey.shade200,
                                    thickness: 25,
                                    height: MediaQuery.of(context).size.height *
                                        0.030)
                                : null,
                          ),
                        ],
                      );
                    }),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: const Text(
                    StringConstants.appVersion,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: const CustomAppBar(),

        // BOTTOM NAVIGATION BAR
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _indexChanged,
          iconSize: 20,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                ImageConstants.swiggy,
                width: 15,
              ),
              label: StringConstants.swiggy,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: StringConstants.food,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart_outlined),
              label: StringConstants.instamart,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.dinner_dining_outlined),
              label: StringConstants.dineout,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: StringConstants.genie,
            ),
          ],
        ),
        // BODY
        body: tabs[_selectedIndex]);
  }
}
