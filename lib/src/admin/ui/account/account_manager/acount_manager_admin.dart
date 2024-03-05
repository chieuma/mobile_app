import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountManagerAdmin extends StatelessWidget {
  const AccountManagerAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tài Khoản Admin",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 4,
      ),
    );
  }
}
