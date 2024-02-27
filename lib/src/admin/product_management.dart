import 'package:flutter/material.dart';
import 'package:mobile_app/src/admin/product/laptop/laptop.dart';
import 'package:mobile_app/src/admin/product/phone/phone.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({Key? key}) : super(key: key);

  @override
  State<ProductManagement> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<ProductManagement> {
  final List<String> _listItem = [
    'Điện thoại',
    'Laptop',
  ];

  late Widget _selectedWidget = const PhoneScreen();

  bool isSelectedItem = false;
  bool isSearchActivated = false;

  int isSelectedItemColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 10,
        title: isSearchActivated
            ? buildSearchField()
            : const Text(
                'Danh Mục Sản Phẩm',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isSearchActivated ? Icons.close : Icons.search,
              color: Colors.blue,
            ),
            onPressed: () {
              setState(() {
                isSearchActivated = !isSearchActivated;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listItem.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelectedItemColor = index;
                          if (_listItem[index] == 'Điện thoại') {
                            _selectedWidget = const PhoneScreen();
                          } else {
                            _selectedWidget = const LaptopScreen();
                          }
                        });
                      },
                      child: Container(
                        width: 200.0,
                        margin: const EdgeInsets.all(8.0),
                        color: isSelectedItemColor == index
                            ? const Color.fromARGB(255, 162, 2, 2)
                            : const Color.fromARGB(255, 0, 0, 0),
                        child: Center(
                          child: Text(
                            _listItem[index],
                            style: TextStyle(
                              color: isSelectedItemColor == index
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 0, 234, 255)),
                      ),
                      child: const Text(
                        'Thêm',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    )
                  ],
                ),
              ),
              _selectedWidget,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Tìm kiếm sản phẩm...',
          hintStyle: TextStyle(fontStyle: FontStyle.italic),
          border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Customize the color
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Customize the color
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
