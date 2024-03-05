import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app/src/client/model/Laptop/laptop.dart';
import 'package:mobile_app/src/client/model/phone/phone.dart';
// import 'package:mobile_app/src/client/cart/cart_screen.dart';
// import 'package:mobile_app/src/client/general/general.dart';
import 'package:mobile_app/src/client/ui/productdetailscreen/phone_detail_screen.dart';
import 'package:mobile_app/src/client/ui/shop/phone/phone_screen.dart';
// import 'package:mobile_app/src/client/productdetailscreen/phone_detail_screen.dart';


import '../../../admin/ui/BuildSearchField.dart';
// import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void _navigateToPhoneDetail(Phone phone) {
    _navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => PhoneDetailScreen(phone),
      ),
    );
  }

  final List<String> _listItem = [
    'Điện thoại',
    'Laptop',
    'Máy tính bảng',
    'Phụ kiện'
  ];

  final List<String> _listImage = [
    'assets/image/Apple/iphone_15_1.jpg',
    'assets/image/Apple/iphone_15_2.jpg',
    'assets/image/Apple/iphone_15_1.jpg',
    'assets/image/Apple/iphone_15_2.jpg',
    'assets/image/Apple/iphone_15_1.jpg',
  ];

  // Biến icon show TextField
  bool isSearchActivated = false;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Shop',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'BebasNeue'),
                ),
                shadowColor: Colors.black,
                elevation: 4,
                leading: Container(),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BuildSearchField()));
                    },
                  ),
                ],
              ),
              body: ListView(
                children: [
                  Column(
                    children: [
                      // Danh mục
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (ctx, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width:
                                    200.0, // Adjust the width of each item as needed
                                margin: const EdgeInsets.all(8.0),
                                color: const Color.fromARGB(255, 0, 0, 0),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PhoneScreen(
                                            name: _listItem[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      _listItem[index],
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // sản phẩm nổi bật
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                        child: Row(
                          children: [
                            Text(
                              'SẢN PHẨM NỔI BẬT',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 245, 104, 11)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 245,
                        width: 600,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _listImage.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width:
                                    200.0, // Adjust the width of each item as needed
                                margin: const EdgeInsets.all(8.0),
                                color: const Color.fromARGB(255, 255, 255, 255),

                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _navigateToPhoneDetail(
                                              Phone.phone[index]);
                                        },
                                        child: Image.asset(
                                          _listImage[
                                              index], // Replace with your fallback image path
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'iphone 15',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        width: 600,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Phone.phone.length,
                          itemBuilder: (context, index) {
                            final phone = Phone.phone[index];

                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width:
                                    200.0, // Adjust the width of each item as needed
                                margin: const EdgeInsets.all(8.0),
                                color: const Color.fromARGB(255, 255, 255, 255),

                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _navigateToPhoneDetail(
                                              Phone.phone[index]);
                                        },
                                        child: Image.asset(
                                          phone
                                              .colorimagephone
                                              .first
                                              .imagephone
                                              .first
                                              .imagephone, // Replace with your fallback image path
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              phone.name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Text('${phone.inch}"',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(phone.screen,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            for (var color
                                                in phone.colorimagephone)
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                height: 20,
                                                width: 20,
                                                color: color.color,
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Wrap(
                                          children: [
                                            for (var memory in phone
                                                .colorimagephone
                                                .first
                                                .memoryprice)
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Text(
                                                  '${memory.memory}GB',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            // Padding(
                                            //   padding: const EdgeInsets.fromLTRB(
                                            //       16, 0, 0, 0),
                                            Row(
                                              children: [
                                                Text(
                                                  '${phone.colorimagephone.first.memoryprice.first.price.toString().replaceAll(RegExp(r'\.0*$'), '')} VND',
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Laptop
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Laptop.laptop.length,
                          itemBuilder: (context, index) {
                            final laptop = Laptop.laptop[index];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width:
                                    400.0, // Adjust the width of each item as needed
                                margin: const EdgeInsets.all(8.0),
                                color: const Color.fromARGB(255, 255, 255, 255),

                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Image(
                                        image: AssetImage(laptop.urlImage),
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              laptop.name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Text('${laptop.inch}"',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(laptop.screen,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 20,
                                              color: laptop.color,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Wrap(
                                              children: [
                                                for (var memory
                                                    in laptop.memory)
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 5),
                                                    child: Text(
                                                      '${memory.gb}GB',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${laptop.price.toString().replaceAll(RegExp(r'\.0*$'), '')} VND',
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
