import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../homepage/home.dart';
import '../shop/shop.dart';
import '../account/account.dart';
import '../favourite/favourite_screen.dart';
import '../cart/cart_screen.dart';

class BottomNavigationModel extends ChangeNotifier {
  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  String selectedPage = '';
  @override
  Widget build(BuildContext context) {
    final bottomNavigationModel = Provider.of<BottomNavigationModel>(context);
    return Scaffold(
      body: IndexedStack(
        index: bottomNavigationModel.selectedIndex,
        children: const [
          Home(),
          Search(),
          FavouriteScreen(),
          CartScreen(),
          Account(),
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
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search),
            label: 'Shop',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.pink),
            label: 'Favourite',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Account',
            backgroundColor: Colors.black,
          ),
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }
}
