import 'package:flutter/material.dart';

class Laptop extends StatelessWidget {
  const Laptop({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('haha'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            // Quay lại trang trước đó khi nhấp vào biểu tượng
            Navigator.pop(context);
          },
        ),
      ),
      body: Text('hihi'),
    );
  }
}
