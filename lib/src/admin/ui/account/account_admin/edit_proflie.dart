import 'package:flutter/material.dart';

class EditProfileAdmin extends StatefulWidget {
  const EditProfileAdmin({super.key});

  @override
  State<EditProfileAdmin> createState() => _EditProfileAdminState();
}

class _EditProfileAdminState extends State<EditProfileAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chỉnh Sửa Thông Tin Cá Nhân',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Colors.black, Colors.purple]),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Quay lại trang trước đó khi nhấp vào biểu tượng
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Họ và tên',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                        hintText: 'Ví dụ: Nguyễn Văn A',
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: 'Số điện thoại',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                        hintText: 'Ví dụ: 0369961760',
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    maxLines: 2,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.contact_mail),
                        labelText: 'Địa chỉ liên hệ',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                        hintText:
                            'Ví dụ: Đường 30/4, Phường Hưng Lợi, Quận Ninh Kiều, Cần Thơ',
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
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
                                'CANCLE',
                                style: TextStyle(
                                    fontFamily: 'BebasNeue',
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfileAdmin()),
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
                                'SAVE',
                                style: TextStyle(
                                    fontFamily: 'BebasNeue',
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
