import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mobile_app/src/client/order/payment/payment_screen.dart';
import 'package:mobile_app/src/client/shared/top_right_badge.dart';
import '../homepage/home.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  bool isChecked = false;
  bool isCheckedCS = false;
  final TextEditingController _quantity = TextEditingController();
  late int _counter = 1;

  void addItem() {
    _updateQuantity();
    setState(() {
      _counter++;
      _quantity.text = '$_counter';
    });
  }

  void removeItem() {
    _updateQuantity();
    if (_counter > 0) {
      setState(() {
        _counter--;
        _quantity.text = '$_counter';
      });
    }
  }

  @override
  void initState() {
    setState(() {
      super.initState();
      _quantity.text = '$_counter';
    });
  }

  void _updateQuantity() {
    if (_quantity.text == '') {
      setState(() {
        _counter = 0;
      });
    } else {
      setState(() {
        _counter = int.parse(_quantity.text);
      });
    }
  }

  // Radio
  String selectedRadio = '';
  // Chuyển về trang home
  void _navigateToHome() {
    _navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
      (route) => false,
    );
  }

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
                  'Giỏ Hàng',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                shadowColor: Colors.black,
                elevation: 4,
                // leading: IconButton(
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   icon: const Icon(Icons.arrow_back_ios),
                // ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TopRightBadge(
                      data: 1,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart)),
                    ),
                  ),
                  PopupMenuButton(
                    color: Color.fromARGB(255, 218, 213, 213),
                    iconColor: Colors.black,
                    onSelected: (value) {
                      if (value == "select_all") {
                      } else if (value == "delete_all") {}
                    },
                    icon: const Icon(
                      Icons.more_vert,
                    ),
                    itemBuilder: (ctx) => [
                      const PopupMenuItem(
                        value: "select_all",
                        child: Text('Chọn tất cả'),
                      ),
                      const PopupMenuItem(
                        value: "delete_all",
                        child: Text('Xóa tất cả'),
                      ),
                    ],
                  )
                ],
              ),
              //body: CartNoItemScreen(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 626,
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(0.3),
                                    1: FlexColumnWidth(0.5),
                                    2: FlexColumnWidth(0.5),
                                  },
                                  children: [
                                    TableRow(
                                      children: [
                                        const TableCell(
                                          child: Column(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    'assets/image/Apple/iphone_15_1.jpg'),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 10, 0, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              139, 138, 138),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("Xóa"),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const TableCell(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Điện thoại Iphone 15 ProMax',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'Màu: Xanh Titan',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TableCell(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Text(
                                                '22000000đ',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Text(
                                                '26000000đ',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromARGB(
                                                        255, 106, 106, 106),
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                height: 30,
                                                child: TextFormField(
                                                  controller: _quantity,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  decoration: InputDecoration(
                                                    suffixIcon: GestureDetector(
                                                      onTap: addItem,
                                                      child: Container(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 17, 17, 17),
                                                        child: const Icon(
                                                          Icons.add,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    prefixIcon: GestureDetector(
                                                      onTap: removeItem,
                                                      child: Container(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 0, 0, 0),
                                                        child: const Icon(
                                                          Icons.remove,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        const Color.fromARGB(
                                                            255, 255, 255, 255),
                                                    border: InputBorder.none,
                                                  ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                ),
                                              ),
                                              Checkbox(
                                                value: isChecked,
                                                onChanged: (bool? value) {
                                                  setState(
                                                    () {
                                                      isChecked = value!;
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '59.999.000 VND',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentScreen()));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(66, 182, 181, 181)),
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: Color.fromARGB(255, 131, 1, 192),
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
                            child: const Text(
                              'Thanh Toán',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 183, 52, 240),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CartNoItemScreen extends StatefulWidget {
  const CartNoItemScreen({super.key});

  @override
  State<CartNoItemScreen> createState() => _CartNoItemScreenState();
}

class _CartNoItemScreenState extends State<CartNoItemScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void _navigateToHome() {
    _navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
      (route) => false,
    );

    // truy cập về trang home
    // final bottomNavState =
    //     context.findAncestorStateOfType<BottomNavigationState>();
    // if (bottomNavState != null) {
    //   bottomNavState.navigateToIndex(0);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const SizedBox(height: 240),
            const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Giỏ hàng của bạn hiện tại đang trống',
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 260,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _navigateToHome,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Shop Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
