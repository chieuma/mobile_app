import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _selectedMenuIndex = 0;

  bool isSearchActivated = false;

  final List<String> _listMenu = [
    'Chờ xác nhận',
    'Chờ lấy hàng',
    'Chờ giao hàng',
    'Đã giao',
    'Đã Hủy',
    'Trả hàng',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearchActivated
            ? buildSearchField()
            : const Text(
                'Đơn Mua',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 4,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                isSearchActivated ? Icons.close : Icons.search,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  isSearchActivated = !isSearchActivated;
                });
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 37,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _listMenu.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedMenuIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: _selectedMenuIndex == index
                                  ? Colors.red
                                  : const Color.fromARGB(0, 22, 67, 74),
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Text(
                          _listMenu[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _selectedMenuIndex == index
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                color: const Color.fromARGB(255, 219, 219, 219),
                child: ListView(
                  children: const [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Image(
                              image: AssetImage('assets/image/icon_order.jpg'),
                              fit: BoxFit.cover,
                              width: 100,
                            ),
                          ),
                        ),
                        Text('Chưa có đơn hàng'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // body: DefaultTabController(
      //   length: 7,
      //   child: Column(
      //     children: [
      //       TabBar(
      //         tabs: [
      //           Tab(
      //             icon: Icon(Icons.favorite),
      //           ),
      //           Tab(
      //             icon: Icon(Icons.favorite),
      //           ),
      //           Tab(
      //             icon: Icon(Icons.favorite),
      //           ),
      //           Tab(
      //             icon: Icon(Icons.favorite),
      //           ),
      //           Tab(
      //             icon: Icon(Icons.favorite),
      //           ),
      //           Tab(
      //             icon: Icon(Icons.favorite),
      //           ),
      //           Tab(
      //             icon: Icon(Icons.favorite),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      //),
    );
  }

  Widget buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Tìm kiếm đơn hàng...',
          hintStyle: TextStyle(fontStyle: FontStyle.italic),
          border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Customize the color
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Customize the color
          ),
        ),
        onChanged: (value) {
          // Perform search-related operations here
        },
      ),
    );
  }
}
