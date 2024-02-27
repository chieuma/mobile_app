import 'package:flutter/material.dart';

class Infor extends StatelessWidget {
  const Infor({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Thông tin cá nhân",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 147, 139, 139)
                ],
              )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/image/anhdaidien.jpg'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.black,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tên đăng nhập: mavanchieu',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Họ và tên: Mã Văn Chiều',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('Số điện thoại: 0369951760',
                                style: TextStyle(color: Colors.white)),
                            Text('Email: chieub2005665@student.ctu.edu.vn',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  side: const BorderSide(width: 0.8, color: Colors.black),
                  shadowColor: Colors.black,
                  elevation: 10,
                ),
                child: const Text(
                  'Cập nhật thông tin cá nhân',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  side: const BorderSide(width: 0.8, color: Colors.black),
                  shadowColor: Colors.black,
                  elevation: 10,
                ),
                child: const Text(
                  'Thay đổi mật khẩu',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
