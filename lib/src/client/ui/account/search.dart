import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  final List<String> _listChip = [
    'haha',
    'cai',
    'carot',
    'khoai tay',
    'rau can',
  ];

  void _handleDelete(int index) {
    setState(() {
      _listChip.removeAt(index); // Xóa phần tử tại index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh sách đã tìm',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 4,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 10,
              children: List.generate(
                _listChip.length,
                (index) {
                  return Chip(
                    label: Text(
                      _listChip[index],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                    ),
                    onDeleted: () {
                      _handleDelete(index);
                    },
                    deleteIconColor: Colors.red,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
