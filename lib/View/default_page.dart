import 'package:flutter/material.dart';
import 'package:sheba/View/HelpPage.dart';
import 'package:sheba/View/MorePage.dart';
import 'package:sheba/View/OrdersPage.dart';

import '../const/all_color.dart';
import '../const/all_icon.dart';
import 'CategoryPage.dart';
import 'HomePage.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  int index = 0;
  List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    OrderPage(),
    HelpPage(),
    MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leadingWidth: 50,

        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () {},
            elevation: 2.0,
            color: Colors.blue,
            textColor: Colors.white,
            child: Icon(
              Icons.location_pin,
              size: 16,
            ),
            padding: EdgeInsets.all(5),
            shape: CircleBorder(),
            highlightElevation: 10,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          //Icon(Icons.print),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () {},
            ),
          ),
        ],
        titleSpacing: -10.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Text('Mohakhali',
                    style: TextStyle(fontSize: 14.0, color: Colors.red))),
            Container(
                child: Text('76, Arjatpara, Dhaka-1215',
                    style: TextStyle(fontSize: 10.0))),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CategoryPage();
                },
              )),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                isDense: true, // Added this
                contentPadding: EdgeInsets.all(8), // Ad
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // Add this line to always show labels
        onTap: (value) {
          setState(() {
            index = value;
          });
          index = value;
        },
        currentIndex: index,
        selectedItemColor: AllColors.blueColor,
        unselectedItemColor: AllColors.lightGray,
        items: [
          BottomNavigationBarItem(icon: AllIcons.homeIcon, label: 'Home'),
          BottomNavigationBarItem(icon: AllIcons.categoriesIcon, label: 'Inbox'),
          BottomNavigationBarItem(icon: AllIcons.cartIcon, label: 'Orders'),
          BottomNavigationBarItem(icon: AllIcons.wishlistIcon, label: 'Help'),
          BottomNavigationBarItem(icon: AllIcons.accountIcon, label: 'More'),
        ],
      ),
    );
  }
}
