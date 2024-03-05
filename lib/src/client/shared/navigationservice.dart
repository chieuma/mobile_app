import 'package:flutter/material.dart';
import 'package:mobile_app/src/client/model/phone/phone.dart';
import 'package:mobile_app/src/client/ui/favourite/favourite_screen.dart';
// import 'package:mobile_app/src/client/general/general.dart';
import 'package:mobile_app/src/client/ui/productdetailscreen/phone_detail_screen.dart';


class NavigationService {
  static final GlobalKey<NavigatorState> shopNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> phoneDetailNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> favouriteNavigatorKey =
      GlobalKey<NavigatorState>();

  void printNavigationStack() {
    print('Navigation Stack:');
    final navigatorKey = NavigationService.shopNavigatorKey;
    final stack =
        navigatorKey.currentState?.widget.pages.map((page) => page.name);
    print(stack?.toList().reversed);
  }

  void navigateToPhoneDetail(Phone phone) {
    shopNavigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => PhoneDetailScreen(phone),
    ));
    printNavigationStack();
  }

  static void navigateBackFromPhoneDetail() {
    phoneDetailNavigatorKey.currentState?.pop();
  }

  static void navigateToFavourite() {
    shopNavigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => const FavouriteScreen(),
    ));
  }

  static void navigateBackFromFavourite() {
    favouriteNavigatorKey.currentState?.pop();
  }
}
