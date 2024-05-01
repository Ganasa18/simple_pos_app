import 'package:flutter/material.dart';
import 'package:simple_pos_app/core/utils/text_format.dart';
import 'package:simple_pos_app/core/values/colors.dart';
import 'package:simple_pos_app/core/values/constants.dart';

List<Map<String, dynamic>> exampleItemList = [
  {
    "image": Icons.money_off,
    "title": "Revenue",
    "value": 12000,
  },
  {
    "image": Icons.book,
    "title": "Orders",
    "value": 12000,
  },
  {
    "image": Icons.group,
    "title": "Walk-ins",
    "value": 12000,
  },
  {
    "image": Icons.wallet,
    "title": "Online Order",
    "value": 12000,
  },
];

List<Map<String, dynamic>> exampleDataList = [
  {
    'itemName': 'Quarter Pounder With Cheese',
    'orders': 10,
    'revenue': 12000,
  },
  {
    'itemName': 'Big Mac',
    'orders': 15,
    'revenue': 8000,
  },
  {
    'itemName': 'Filet-O-Fish',
    'orders': 2,
    'revenue': 20000,
  },
  {
    'itemName': 'McChicken Deluxe',
    'orders': 5,
    'revenue': 12000,
  },
  {
    'itemName': 'Oreo Mcflurry',
    'orders': 5,
    'revenue': 12000,
  },
  {
    'itemName': 'McDouble',
    'orders': 6,
    'revenue': 6000,
  },
];

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'assets/images/sample-logo.png',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "28 October 2021 Thursday | 17:30",
              style: blackTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/menu.png",
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 90,
                width: double.infinity,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.0, // Aspect ratio of items
                  ),
                  itemCount: exampleItemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = exampleItemList[index];
                    return Container(
                      margin: EdgeInsets.only(
                        left: index != 0
                            ? 4
                            : 0, // Adjust margin for the first item
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: darkBlueColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(
                              0,
                              3,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            item['image'],
                            color: whiteColor,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Rp ${formatAmount(item['value'].toString())}",
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: bold,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "${item['title']}",
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                height: screenHeight / 1.5,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 17,
                          vertical: 20,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Ordered ",
                                  style: blackTextStyle.copyWith(
                                    fontWeight: bold,
                                  ),
                                ),
                                const Text(
                                  "Items",
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            DataTable(
                              columns: [
                                DataColumn(
                                  label: Text(
                                    'Item',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Orders',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Revenue',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                              rows: List.generate(
                                exampleDataList.length,
                                (index) {
                                  var item = exampleDataList[index];
                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          item['itemName'],
                                          style: blackTextStyle.copyWith(
                                            fontSize: 12,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Text(
                                            item['orders'].toString(),
                                            style: blackTextStyle,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          formatAmount(
                                              item['revenue'].toString()),
                                          style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Overal ",
                                      style: blackTextStyle.copyWith(
                                        fontWeight: bold,
                                      ),
                                    ),
                                    const Text(
                                      "Statistics",
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.settings),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 40,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 0,
                                              offset: const Offset(
                                                1,
                                                1,
                                              ), // changes position of shadow
                                            ),
                                          ]),
                                      child: Center(
                                        child: Text(
                                          "This Week",
                                          style: baseTextStyle.copyWith(
                                            color: darkBlueColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: darkBlueColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 0,
                                              offset: const Offset(
                                                1,
                                                1,
                                              ), // changes position of shadow
                                            ),
                                          ]),
                                      child: Center(
                                        child: Text(
                                          "This Month",
                                          style: baseTextStyle.copyWith(
                                            color: whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 0,
                                              offset: const Offset(
                                                1,
                                                1,
                                              ), // changes position of shadow
                                            ),
                                          ]),
                                      child: Center(
                                        child: Text(
                                          "This Year",
                                          style: baseTextStyle.copyWith(
                                            color: darkBlueColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // Add more widgets or ListViews here if needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
        child: BottomNavigationBar(
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Online Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          selectedItemColor: darkBlueColor,
        ),
      ),
    );
  }
}
