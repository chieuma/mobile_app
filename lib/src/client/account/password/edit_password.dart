import 'package:flutter/material.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  late TextEditingController _pass1 = TextEditingController();
  bool _showPass1 = false;
  late TextEditingController _pass2 = TextEditingController();
  bool _showPass2 = false;
  late TextEditingController _pass3 = TextEditingController();
  bool _showPass3 = false;

  @override
  void initState() {
    super.initState();
    _pass1 = TextEditingController();
    _pass2 = TextEditingController();
    _pass3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thay Đổi Mật Khẩu',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 181, 181, 181),
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _pass1,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.key),
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 16),
                    hintText: 'Nhập mật khẩu hiện tại',
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPass1 = !_showPass1;
                        });
                      },
                      icon: Icon(
                        _showPass1 ? Icons.visibility : Icons.visibility_off,
                        color: _showPass1 ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                  obscureText: !_showPass1,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _pass2,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.vpn_key),
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 16),
                    hintText: 'Nhập mật khẩu mới',
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPass2 = !_showPass2;
                        });
                      },
                      icon: Icon(
                        _showPass2 ? Icons.visibility : Icons.visibility_off,
                        color: _showPass2 ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                  obscureText: !_showPass2,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _pass3,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.vpn_key),
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 16),
                    hintText: 'Nhập lại mật khẩu mới',
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPass3 = !_showPass3;
                        });
                      },
                      icon: Icon(
                        _showPass3 ? Icons.visibility : Icons.visibility_off,
                        color: _showPass3 ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                  obscureText: !_showPass3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _pass1.clear();
                          _pass2.clear();
                          _pass3.clear();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        side: const BorderSide(width: 0.8, color: Colors.black),
                        shadowColor: Colors.black,
                        elevation: 20,
                      ),
                      child: const Text(
                        'Hủy',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        shadowColor: Colors.black,
                        elevation: 20,
                      ),
                      child: const Text(
                        'Lưu',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        side: const BorderSide(width: 0.8, color: Colors.black),
                        shadowColor: Colors.black,
                        elevation: 10,
                      ),
                      child: const Text(
                        'Thay đổi mật khẩu thông qua SMS',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        side: const BorderSide(width: 0.8, color: Colors.black),
                        shadowColor: Colors.black,
                        elevation: 10,
                      ),
                      child: const Text(
                        'Thay đổi mật khẩu thông qua Email',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
