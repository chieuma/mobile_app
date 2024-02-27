import 'package:mobile_app/src/client/account/edit_profile.dart';
import 'package:mobile_app/src/client/account/infor.dart';
import 'package:mobile_app/src/client/account/password/edit_password.dart';
import 'package:mobile_app/src/client/account/system/help.dart';
// import 'package:mobile_app/src/client/favourite/favourite_screen.dart';
import 'package:mobile_app/src/client/general/general.dart';
import 'package:mobile_app/src/client/order/order_screen.dart';
import 'package:mobile_app/src/public/login.dart';
// import 'package:mobile_app/src/public/screen_intro/screen_intro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../account/system/transport.dart';
import 'search.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void image() {
    showDialog(
      context: (context),
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chọn ảnh từ thư viện',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.black,
                    height: 1,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chụp ảnh bằng camera',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      elevation: 5,
                    ),
                    onPressed: () {
                      // Đóng hộp thoại
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void logOut() {
    showDialog(
      context: (context),
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Column(
            children: [
              ClipOval(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    radius: 50,
                    child: Icon(
                      Icons.warning,
                      color: Color.fromARGB(255, 255, 0, 0),
                      size: 40,
                    ),
                  ),
                ),
              ),
              Text(
                'Bạn có chắc chắn đăng xuất?',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 253, 210, 210),
                    elevation: 5,
                  ),
                  onPressed: () {
                    // Đóng hộp thoại
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    // Đóng hộp thoại
                    Navigator.of(context).pop();
                    // Chuyển hướng đến màn hình BottomNavigation
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavigationModel = Provider.of<BottomNavigationModel>(context);
    return Navigator(
        key: _navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            return ListView(
              children: [
                Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/image/anhdaidien.jpg'),
                        ),
                      ),
                      const Text(
                        'chieuma',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text('chieub2005665@ssstudent.ctu.edu.vn'),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EditProfile()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                                side: const BorderSide(
                                    width: 0.8, color: Colors.black)),
                            child: const Text(
                              'EDIT PROFILE',
                              style: TextStyle(
                                  fontFamily: 'BebasNeue',
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: CircleAvatar(
                                  radius: 30,
                                  child: GestureDetector(
                                    onTap: () => image(),
                                    child: const Icon(
                                      Icons.photo_camera,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Đổi ảnh\n đại diện',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  child: Icon(
                                    Icons.source,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text('Sản phẩm \nđã xem',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SearchItem(),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const Text('Mục đã  \ntìm kiếm',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  child: GestureDetector(
                                    onTap: () {
                                      bottomNavigationModel.setSelectedIndex(2);
                                    },
                                    child: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              const Text('Sản phẩm \nyêu thích',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 10,
                        color: const Color.fromARGB(255, 185, 185, 185),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Infor()));
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person_outlined,
                                          color: Colors.blue,
                                        ),
                                        Text('Thông tin cá nhân'),
                                      ],
                                    ),
                                    Icon(Icons.keyboard_arrow_right),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EditPassword(),
                                    ),
                                  );
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.key_outlined,
                                          color: Colors.green,
                                        ),
                                        Text('Thay đổi mật khẩu'),
                                      ],
                                    ),
                                    Icon(Icons.keyboard_arrow_right),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: //ORDER
                                  const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OrderScreen()));
                                },
                                child: //ORDER
                                    const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.shopping_bag_outlined,
                                          color: Colors.red,
                                        ),
                                        Text('Lịch sử đặt hàng'),
                                      ],
                                    ),
                                    Icon(Icons.keyboard_arrow_right),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 10,
                        color: const Color.fromARGB(255, 185, 185, 185),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Help()));
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.help_outline,
                                          color:
                                              Color.fromARGB(255, 255, 0, 183),
                                        ),
                                        Text('Trung tâm trợ giúp'),
                                      ],
                                    ),
                                    Icon(Icons.keyboard_arrow_right),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TranSport()));
                                },
                                child: const Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.local_shipping_outlined,
                                              color: Color.fromARGB(
                                                  255, 250, 0, 0),
                                            ),
                                            Text('Chính sách vận chuyển'),
                                          ],
                                        ),
                                        Icon(Icons.keyboard_arrow_right),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.privacy_tip_outlined,
                                        color: Color.fromARGB(255, 14, 170, 0),
                                      ),
                                      Text('Chính sách bảo mật'),
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: Color.fromARGB(255, 206, 155, 0),
                                      ),
                                      Text('Chính sách khiếu nại'),
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 10,
                        color: const Color.fromARGB(255, 185, 185, 185),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () => logOut(),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          color: Color.fromARGB(255, 255, 0, 0),
                                        ),
                                        Text(
                                          'Đăng xuất',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.keyboard_arrow_right),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                        color: const Color.fromARGB(255, 185, 185, 185),
                      ),
                    ],
                  ),
                ),
                //  )
              ],
            );
          });
        });
  }
}
