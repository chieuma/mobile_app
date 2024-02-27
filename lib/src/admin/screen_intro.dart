import 'package:flutter/material.dart';
import 'package:mobile_app/src/admin/account/account_admin/infor.dart';
import 'package:mobile_app/src/admin/product_management.dart';
import 'package:mobile_app/src/admin/order/order.dart';

class AdminIntroScreen extends StatelessWidget {
  const AdminIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MC - SHOP'),
          // backgroundColor: Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
          shadowColor: Colors.black,
          elevation: 10,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications,
                          color: Color.fromARGB(255, 22, 22, 22)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 59, 59),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '5', // Số lượng thông báo
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
        body: const Center(
            child: Text(
          'A drawer is an invisible side screen.',
          style: TextStyle(fontSize: 20.0),
        )),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
                  accountName: Text(
                    "Abhishek Mishra",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("abhishekm977@gmail.com"),
                  currentAccountPictureSize: Size.square(50),

                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ), //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' Thông tin cá nhân '),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Infor()));
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text(' Quản lý sản phẩm '),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductManagement()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.receipt_long),
                title: const Text(' Quản lý đơn hàng '),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderManagement()));
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(' Thống kê '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text(' Đăng xuất '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ), //Drawer
      ),
    );
  }
}
