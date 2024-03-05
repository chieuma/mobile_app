import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final List<String> _listBrands = [
    'Iphone',
    'Samsung',
    'Oppo',
    'Xiaomi',
    'ViVo',
    'realme',
    'NOKIA',
    'Masstel',
  ];

  final List<String> _listPrice = [
    'Dưới 2 triệu',
    'Từ 2 - 6 triệu',
    'Từ 6- 15 triệu',
    'Từ 15 - 20 triệu',
    'Trên 20 triệu'
  ];

  final List<Map<String, String>> _listType = [
    {
      'image': 'assets/image/Apple/iphone_15_1.jpg',
      'name': 'Iphone',
    },
    {
      'image': 'assets/image/Samsung/samsung_2.jpg',
      'name': 'Android',
    },
    {
      'image': 'assets/image/Nokia/nokia_1.jpg',
      'name': 'Điện thoại phổ thông',
    },
  ];

  final List<String> _listRAM = ['2', '3', '4', '6', '8', '12'];

  final List<String> _listSSD = [
    '32 GB',
    '64 GB',
    '128 GB',
    '256 GB',
    '512 GB',
    '1 TB'
  ];

  final List<String> _listTN = [
    'Sạc nhanh (từ 20W)',
    'Sạc nhanh (Từ 60W)',
    'Sạc không dây',
  ];

  final List<String> _listTNDB = [
    'Kháng nước, bụi',
    'Hỗ trợ 5G',
    'Bảo mật khuôn mặt 3D',
  ];

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(66, 246, 246, 246)),
                      side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(
                          color: Color.fromARGB(255, 145, 145, 145),
                        ),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Tắt radius
                        ),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                        Text(
                          'Đóng',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
          leading: Container(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'Hãng',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: deviceWidth + 20,
                height: 120,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Số cột bạn muốn
                    crossAxisSpacing: 2.0, // Khoảng cách giữa các cột
                    mainAxisSpacing: 2,
                  ),
                  itemCount: _listBrands.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(66, 246, 246, 246)),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Color.fromARGB(255, 145, 145, 145),
                            ),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Tắt radius
                            ),
                          ),
                        ),
                        child: Text(
                          _listBrands[index],
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'Giá',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                width: deviceWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listPrice.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(66, 246, 246, 246)),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Color.fromARGB(255, 145, 145, 145),
                            ),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Tắt radius
                            ),
                          ),
                        ),
                        child: Text(
                          _listPrice[index],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 101, 91),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'Loại điện thoại',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                width: deviceWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listType.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(66, 246, 246, 246)),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Color.fromARGB(255, 145, 145, 145),
                            ),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Tắt radius
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              _listType[index]['image'] ?? '',
                              fit: BoxFit.cover,
                              width: 90,
                            ),
                            Text(
                              _listType[index]['name'] ?? '',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 101, 91),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'RAM',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                width: deviceWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listRAM.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(66, 246, 246, 246)),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Color.fromARGB(255, 145, 145, 145),
                            ),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Tắt radius
                            ),
                          ),
                        ),
                        child: Text(
                          ' ${_listRAM[index]} GB',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 101, 91),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'Dung lượng lưu trữ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                width: deviceWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listRAM.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(66, 246, 246, 246)),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Color.fromARGB(255, 145, 145, 145),
                            ),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Tắt radius
                            ),
                          ),
                        ),
                        child: Text(
                          ' ${_listSSD[index]}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 101, 91),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'Tính năng sạc',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                width: deviceWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listTN.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(66, 246, 246, 246)),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Color.fromARGB(255, 145, 145, 145),
                            ),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Tắt radius
                            ),
                          ),
                        ),
                        child: Text(
                          ' ${_listTN[index]}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 101, 91),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'Tính năng đặc biệt',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                width: deviceWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listTNDB.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(66, 246, 246, 246)),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Color.fromARGB(255, 145, 145, 145),
                            ),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Tắt radius
                            ),
                          ),
                        ),
                        child: Text(
                          ' ${_listTNDB[index]}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 101, 91),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
