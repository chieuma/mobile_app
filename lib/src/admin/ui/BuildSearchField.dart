import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuildSearchField extends StatefulWidget {
  const BuildSearchField({Key? key});

  @override
  State<BuildSearchField> createState() => _BuildSearchFieldState();
}

class _BuildSearchFieldState extends State<BuildSearchField> {
  final List<String> _listPopularSearch = ['Iphone 15', 'Asus TUF', 'AirPod'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: // Thêm padding bên trái
            TextField(
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            hintText: 'Tìm kiếm sản phẩm',
            border: InputBorder.none,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          onChanged: (value) {
            // Perform search-related operations here
          },
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 4,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 3, right: 8),
              child: Text(
                "Hủy",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _listPopularSearch.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 8, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 157, 151, 151),
                      ),
                    ),
                    Text(
                      _listPopularSearch[index],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Image(
                      image: AssetImage('assets/icon/arrow_top.png'),
                      width: 20,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
