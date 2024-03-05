import 'package:flutter/material.dart';
import 'package:mobile_app/src/admin/ui/account/account_admin/infor.dart';
import 'package:mobile_app/src/admin/ui/account/account_admin/password/edit_password.dart';
import 'package:mobile_app/src/admin/ui/account/account_admin/rule.dart';
import 'package:mobile_app/src/admin/ui/account/account_manager/account_manager..dart';
import 'package:mobile_app/src/admin/ui/general/general.dart';
import 'package:mobile_app/src/client/ui/account/edit_profile.dart';
import 'package:mobile_app/src/public/login.dart';
import 'package:provider/provider.dart';

class AccountAdmin extends StatefulWidget {
  const AccountAdmin({super.key});

  @override
  State<AccountAdmin> createState() => _AccountAdminState();
}

class _AccountAdminState extends State<AccountAdmin> {
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
    final bottomNavigationModelAdmin =
        Provider.of<BottomNavigationModelAdmin>(context);
    return Navigator(
      key: _navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Tài Khoản Cá Nhân',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                shadowColor: Colors.black,
                elevation: 4,
              ),
              body: ListView(
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
                                      builder: (context) =>
                                          const EditProfile()),
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const EditPasswordAdmin()));
                                      },
                                      child: const Icon(
                                        Icons.password_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Thay đổi\n mật khẩu',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Infor()));
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
                                          Text('  Thông tin cá nhân'),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Rule()));
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.rule,
                                            color:
                                                Color.fromARGB(255, 0, 191, 10),
                                          ),
                                          Text('  Điều khoản MC - SHOP'),
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
                        const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Divider(
                            height: 5,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AccountManager()));
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.account_box,
                                            color: Color.fromARGB(
                                                255, 138, 1, 150),
                                          ),
                                          Text('  Quản lý tài khoản'),
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
                        const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Divider(
                            height: 5,
                            color: Colors.black,
                          ),
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
                                            color:
                                                Color.fromARGB(255, 255, 0, 0),
                                          ),
                                          Text(
                                            ' Đăng xuất',
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
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
