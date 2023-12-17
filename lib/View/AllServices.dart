import 'package:flutter/material.dart';

class AllServices extends StatefulWidget {
  const AllServices({Key? key, this.services}) : super(key: key);

  final String? services;

  @override
  _AllServicesState createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  late String services;
  int selectedIndex = 0; // Set a default index

  @override
  void initState() {
    super.initState();
    services = categoryArr[selectedIndex]['title'] as String;
    updateServiceList();
  }

  void updateServiceList() {
    // Your logic to update the service list based on the selected index
    // You can fetch the list from a database or use a predefined list
    // For now, let's assume you have a predefined list in serviceArr map
    List<Map<String, String>> serviceList = serviceArr[categoryArr[selectedIndex]['linkItem']] ?? [];
    // TODO: Use the serviceList as needed in your application
  }

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

  var serviceArr = {
    'best-deal': [
      {'name': 'best-deal item 1', 'details': 'Details for best-deal item 1'},
      {'name': 'best-deal item 2', 'details': 'Details for best-deal item 2'},
      {'name': 'best-deal item 3', 'details': 'Details for best-deal item 3'},
      {'name': 'best-deal item 4', 'details': 'Details for best-deal item 4'},
    ],
    'shifting': [
      {'name': 'shifting item 1', 'details': 'Details for shifting item 1'},
      {'name': 'shifting item 2', 'details': 'Details for shifting item 2'},
      {'name': 'shifting item 3', 'details': 'Details for shifting item 3'},
    ],
    'beauty': [
      {'name': 'beauty item 1', 'details': 'Details for beauty item 1'},
      {'name': 'beauty item 2', 'details': 'Details for beauty item 2'},
    ],
    'cleaning': [
      {'name': 'cleaning item 1', 'details': 'Details for cleaning item 1'},
      {'name': 'cleaning item 2', 'details': 'Details for cleaning item 2'},
      {'name': 'cleaning item 3', 'details': 'Details for cleaning item 3'},
      {'name': 'cleaning item 4', 'details': 'Details for cleaning item 4'},
      {'name': 'cleaning item 5', 'details': 'Details for cleaning item 5'},
    ],
    'electric': [
      {'name': 'electric item 1', 'details': 'Details for electric item 1'},
      {'name': 'electric item 2', 'details': 'Details for electric item 2'},
      {'name': 'electric item 3', 'details': 'Details for electric item 3'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: Row(
        children: [
          // First Column (20% width) - Vertical Tabs
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: ListView.builder(
              itemCount: categoryArr.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Handle tab click - update selected index and services
                    setState(() {
                      selectedIndex = index;
                      services = categoryArr[index]['title'] as String;
                      updateServiceList();
                    });
                  },
                  child: Ink(
                    color: selectedIndex == index ? Colors.blue : null,
                    child: Container(
                      child: Column(
                        children: [
                          // Top icon
                          Icon(
                            categoryArr[index]['icon'] as IconData,
                            color: selectedIndex == index ? Colors.white : null,
                          ),
                          // Tab name with line break
                          Text(
                            categoryArr[index]['title'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: selectedIndex == index ? Colors.white : null,
                            ),
                          ),
                          // Divider between tabs
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Second Column (80% width) - Details
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Service: ${services ?? "Unknown"}',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  // Display the selected services with details using ListView.builder
                  if (selectedIndex != -1)
                    Expanded(
                      child: ListView.builder(
                        itemCount: serviceArr[categoryArr[selectedIndex]['linkItem']]!.length,
                        itemBuilder: (context, serviceIndex) {
                          final service = serviceArr[categoryArr[selectedIndex]['linkItem']]![serviceIndex];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(16.0),
                              title: Row(
                                children: [
                                  // Image on the left side
                                  Container(
                                    margin: EdgeInsets.only(right: 16.0),
                                    child: Icon(
                                      categoryArr[selectedIndex]['icon'] as IconData,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  // Service details
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(service['name'] ?? ''),
                                      Text(service['details'] ?? ''),
                                    ],
                                  ),
                                ],
                              ),
                              onTap: () {
                                // Handle tap on a service item (e.g., navigate to a detailed view)
                                // You can define your action here
                                print('Tapped on ${service['name']}');
                              },
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
