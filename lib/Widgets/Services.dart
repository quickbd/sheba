import 'package:flutter/material.dart';
import '../View/AllServices.dart';

class ServiceMod extends StatefulWidget {
  const ServiceMod({Key? key}) : super(key: key);

  @override
  State<ServiceMod> createState() => _ServiceModState();
}

class _ServiceModState extends State<ServiceMod> {
  var categoryArr = [
    {'title': 'Best Deal', 'linkItem': 'best-deal', 'icon': Icons.display_settings},
    {'title': 'AC Repair', 'linkItem': 'ac-repair', 'icon': Icons.air},
    {'title': 'Appliance Repair', 'linkItem': 'appliance-repair', 'icon': Icons.computer_rounded},
    {'title': 'Beauty', 'linkItem': 'beauty', 'icon': Icons.face_4},
    {'title': 'Cleaning', 'linkItem': 'cleaning', 'icon': Icons.cleaning_services},
    {'title': 'Electric', 'linkItem': 'electric', 'icon': Icons.electrical_services},
    {'title': 'Shifting', 'linkItem': 'shifting', 'icon': Icons.fire_truck_outlined},
    {'title': 'Driver Service', 'linkItem': 'driver-service', 'icon': Icons.drive_eta_outlined},

    {'title': 'Appliance Repair', 'linkItem': 'appliance-repair', 'icon': Icons.computer_rounded},
    {'title': 'Beauty', 'linkItem': 'beauty', 'icon': Icons.face_4},
    {'title': 'Cleaning', 'linkItem': 'cleaning', 'icon': Icons.cleaning_services},
    {'title': 'Electric', 'linkItem': 'electric', 'icon': Icons.electrical_services},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return CategoryItem(category: categoryArr[i]);
                  },
                  itemCount: categoryArr.length > 8 ? 8 : categoryArr.length,

                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    crossAxisSpacing: 11,
                    mainAxisSpacing: 11,
                  ),
                ),
              ),
              Divider(
                color: Colors.tealAccent,
                height: 3,
                thickness: 1,
                indent: 25,
                endIndent: 25,
              ),
              SizedBox(height: 16.0),
              buildButton(
                text: "More Categories",
                onClicked: () => showModalBottomSheet(
                  isDismissible: true,
                  context: context,
                  builder: (context) => moreCategory(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget moreCategory() => SingleChildScrollView(
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Categories',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Divider(
                  color: Colors.tealAccent,
                  height: 3,
                  thickness: 1,
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(height: 16.0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, x) {
                    return CategoryItem(category: categoryArr[x]);
                  },
                  itemCount: categoryArr.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    crossAxisSpacing: 11,
                    mainAxisSpacing: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );











  Widget buildButton({required String text, required VoidCallback onClicked}) {
    return ElevatedButton(
      onPressed: onClicked,
      child: Text(text),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Map<String, dynamic> category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (category['linkItem'] != null &&
                  category['linkItem'] is String &&
                  category['linkItem'].isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AllServices(services: category['linkItem'])));
              }
            },
            child: Icon(
              (category['icon'] as IconData?) ?? Icons.error,
              color: Colors.black45,
              size: 30.0,
            ),
          ),
          SizedBox(height: 8.0),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: (category['title'] as String?) ?? '',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 10.0,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
