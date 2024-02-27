import 'package:flutter/material.dart';
import 'package:mobile_app/src/admin/account/account_admin/account.dart';
import 'package:mobile_app/src/admin/statistic/statistic.dart';
import 'package:mobile_app/src/admin/home/home.dart';
import 'package:mobile_app/src/admin/order/order.dart';
import 'package:mobile_app/src/admin/product_management.dart';
import 'package:provider/provider.dart';

class BottomNavigationModelAdmin extends ChangeNotifier {
  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class BottomNavigationAdmin extends StatefulWidget {
  const BottomNavigationAdmin({Key? key});

  @override
  State<BottomNavigationAdmin> createState() => BottomNavigationAdminState();
}

class BottomNavigationAdminState extends State<BottomNavigationAdmin> {
  @override
  Widget build(BuildContext context) {
    final bottomNavigationModel =
        Provider.of<BottomNavigationModelAdmin>(context);
    return Scaffold(
      body: IndexedStack(
        index: bottomNavigationModel.selectedIndex,
        children: const [
          Home(),
          OrderManagement(),
          ProductManagement(),
          Statistic(),
          AccountAdmin(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavigationModel.selectedIndex,
        onTap: (index) {
          bottomNavigationModel.setSelectedIndex(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Order',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Product',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Statistic',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: Colors.black,
          ),
        ],
        selectedItemColor:
            const Color.fromARGB(255, 255, 31, 188), // Màu của icon được chọn
        unselectedItemColor: Colors.white, // Màu của các icon không được chọn
      ),
    );
  }
}
