import 'package:flutter/material.dart';
import 'package:mobile_app/src/client/cart/cart_screen.dart';
import 'package:mobile_app/src/client/general/general.dart';

import 'package:mobile_app/src/client/productdetailscreen/phone_detail_screen.dart';

import 'package:mobile_app/src/client/shop/phone/filter_phone.dart';
import 'package:mobile_app/src/model/shop/phone/phone.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatefulWidget {
  final String name;

  const PhoneScreen({super.key, required this.name});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  // Chuyển về trang home
  void _navigateToCart() {
    _navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const CartScreen(),
      ),
      (route) => false,
    );

    // truy cập về trang home
    // final bottomNavState =
    //     context.findAncestorStateOfType<BottomNavigationState>();
    // if (bottomNavState != null) {
    //   bottomNavState.navigateToIndex(3);
    // }
  }

  bool isSearchActivated = false;

  final List<String> _listBrands = [
    'Iphone',
    'SamSung',
    'Nokia',
    'Realme',
    'ViVo',
  ];
  @override
  Widget build(BuildContext context) {
    final bottomNavigationModel = Provider.of<BottomNavigationModel>(context);

    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    // return Navigator(
    //   key: _navigatorKey,
    //   onGenerateRoute: (settings) {
    //     return MaterialPageRoute(
    //       builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearchActivated
            ? buildSearchField()
            : Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
        shadowColor: Colors.black,
        elevation: 4,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isSearchActivated ? Icons.close : Icons.search,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                isSearchActivated = !isSearchActivated;
              });
            },
          ),
          PopupMenuButton(
            iconColor: Colors.black,
            onSelected: (value) => (),
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    bottomNavigationModel.setSelectedIndex(3);
                  },
                  child: const Text('Xem giỏ hàng'),
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Filter()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(66, 246, 246, 246)),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                              width: 1.2,
                            ),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Tắt radius
                            ),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.filter_alt,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            Text(
                              'Lọc',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _listBrands.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(66, 255, 255, 255)),
                            side: MaterialStateProperty.all<BorderSide>(
                              const BorderSide(
                                color: Color.fromARGB(255, 52, 51, 51),
                                width: 1.2,
                              ),
                            ),
                          ),
                          child: Text(
                            _listBrands[index],
                            style: const TextStyle(
                              color: Color.fromARGB(219, 0, 139, 116),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SizedBox(
              height: deviceHeight - 232,
              width: deviceWidth,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.7,
                ),
                itemCount: Phone.phone.length,
                itemBuilder: (context, index) {
                  final phone = Phone.phone[index];
                  return Container(
                    //  color: Color.fromARGB(255, 0, 0, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PhoneDetailScreen(phone),
                                  ),
                                );
                              },
                              child: Image.asset(
                                phone.colorimagephone.first.imagephone.first
                                    .imagephone,
                                fit: BoxFit.cover,
                                width: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
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
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    '${phone.inch}"',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    phone.screen,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Row(
                                children: [
                                  for (var color in phone.colorimagephone)
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      height: 20,
                                      width: 20,
                                      color: color.color,
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Wrap(
                                children: [
                                  for (var memory in phone
                                      .colorimagephone.first.memoryprice)
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      child: Text(
                                        '${memory.memory}GB',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    '${phone.colorimagephone.first.memoryprice.first.price.toString().replaceAll(RegExp(r'\.0*$'), '')}đ',
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                                // ),
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
          )
        ]),
      ),
    );
    //       },
    //     );
    //   },
    // );
  }

  Widget buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Tìm kiếm sản phẩm...',
          hintStyle: TextStyle(fontStyle: FontStyle.italic),
          border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Customize the color
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Customize the color
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
