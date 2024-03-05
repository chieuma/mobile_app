import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/src/client/model/phone/phone.dart';
import 'package:mobile_app/src/client/ui/cart/cart_screen.dart';
import 'package:mobile_app/src/client/ui/general/general.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/src/client/ui/order/payment/payment_1item.dart';
// import 'package:mobile_app/src/client/shop/shop.dart';


import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PhoneDetailScreen extends StatefulWidget {
  final Phone phone;
  const PhoneDetailScreen(this.phone, {super.key});

  @override
  State<PhoneDetailScreen> createState() => _PhoneDetailScreenState();
}

class _PhoneDetailScreenState extends State<PhoneDetailScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  // Chuyển về trang home
  void _navigateToCart() {
    _navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => const CartScreen(),
      ),
    );
  }

  final TextEditingController _quantity = TextEditingController();
  late int _counter = 1;
  void addItem() {
    _updateQuantity();
    setState(() {
      _counter++;
      _quantity.text = '$_counter';
    });
  }

  void removeItem() {
    _updateQuantity();
    if (_counter > 1) {
      setState(() {
        _counter--;
        _quantity.text = '$_counter';
      });
    }
  }

  @override
  void initState() {
    setState(() {
      super.initState();
      _quantity.text = '$_counter';
    });
  }

  void _updateQuantity() {
    if (_quantity.text == '') {
      setState(() {
        _counter = 0;
      });
    } else {
      setState(() {
        _counter = int.parse(_quantity.text);
      });
    }
  }

  bool isSelectedFav = false;

  int selectedImage = 0;
  PageController pageController = PageController(initialPage: 0);

  int selectedGb = 0;

  bool isselectedImage = false;
  bool isselectedGb = false;

  bool isExpanded1 = false;

  String _formatPrice(double price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(price.toInt()); //
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavigationModel = Provider.of<BottomNavigationModel>(context);
    // return Navigator(
    //   key: _navigatorKey,
    //   onGenerateRoute: (settings) {
    //     return MaterialPageRoute(
    //       builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.phone.name,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        shadowColor: Colors.black,
        elevation: 4,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // _navigatePop();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSelectedFav = !isSelectedFav;
              });
            },
            icon: Icon(
              Icons.favorite,
              color: isSelectedFav ? Colors.red : Colors.black,
            ),
          ),
          PopupMenuButton(
            iconColor: Colors.black,
            onSelected: (value) => (),
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: GestureDetector(
                    onTap: () {
                      bottomNavigationModel.setSelectedIndex(3);
                    },
                    child: const Text('Xem giỏ hàng')),
              ),
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          //ảnh
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: SizedBox(
              height: 250,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget
                        .phone.colorimagephone[selectedImage].imagephone.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image(
                          image: AssetImage(widget
                              .phone
                              .colorimagephone[selectedImage]
                              .imagephone[index]
                              .imagephone),
                          fit: BoxFit.contain,
                          width: 250, // Adjust the width as needed
                          height: 200, // Adjust the height as needed
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 20,
                    top: 100,
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 67, 67, 67),
                      child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Navigate to the previous image
                          if (pageController.page != null &&
                              pageController.page! > 0) {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 100,
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 67, 67, 67),
                      child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        onPressed: () {
                          // Navigate to the next image
                          if (pageController.page != null &&
                              pageController.page! <
                                  widget.phone.colorimagephone[selectedImage]
                                          .imagephone.length -
                                      1) {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // hien thi anh
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.phone.colorimagephone.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: index == selectedImage
                                    ? const Color.fromARGB(255, 159, 0, 0)
                                    : const Color.fromARGB(255, 53, 50, 50),
                                width: 1.4,
                              )),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedImage = index;
                                selectedGb = 0;
                                // isselectedImage = !isselectedImage;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image(
                                image: AssetImage(widget
                                    .phone
                                    .colorimagephone[index]
                                    .imagephone
                                    .first
                                    .imagephone),
                                fit: BoxFit.fill,
                              ),
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

          // Hiển thị tên sản phẩm
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    ' ${widget.phone.name} ${widget.phone.colorimagephone[selectedImage].memoryprice[selectedGb].memory}GB (${widget.phone.colorimagephone[selectedImage].color2})',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Hiển thị GB
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget
                    .phone.colorimagephone[selectedImage].memoryprice.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: index == selectedGb
                                ? Colors.blue
                                : Colors.black,
                            width: 1.4,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGb = index;
                          });
                        },
                        child: Text(
                          '${widget.phone.colorimagephone[selectedImage].memoryprice[index].memory}GB',
                          style: TextStyle(
                            color: index == selectedGb
                                ? Colors.blue
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // giá tiền
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '  ${_formatPrice(widget.phone.colorimagephone[selectedImage].memoryprice[selectedGb].price)}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(2, 0, 0, 6),
                      child: Text(
                        '₫',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Kho:',
                      style: TextStyle(
                          color: Color.fromARGB(255, 44, 44, 44), fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Text(
                        ' ${(widget.phone.colorimagephone[selectedImage].memoryprice[selectedGb].quantity)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 10, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 140,
                      height: 50,
                      child: TextFormField(
                        controller: _quantity,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: addItem,
                            child: Container(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: const Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          prefixIcon: GestureDetector(
                            onTap: removeItem,
                            child: Container(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: const Icon(
                                Icons.remove,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 237, 217, 217),
                          border: InputBorder.none,
                        ),
                        //Chi cho nhap so
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        //  onEditingComplete: _updateQuantity,
                      ),
                    ),

                    //Thêm vào giỏ hàng
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Đã thêm sản phẩm vào giỏ hàng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Thêm vào giỏ hàng',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Button mua ngay
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Payment1Item(),
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange)),
              child: const Text(
                'Mua Ngay',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
          ),

          // Gọi đặt mua
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gọi đặt mua ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '0369 951 760 ',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '(7:30 - 23:00)',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            color: const Color.fromARGB(255, 190, 190, 190),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Column(
              children: [
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(0.2), // Cột thứ nhất chiếm 1 phần
                    1: FlexColumnWidth(1.8), // Cột thứ hai chiếm 2 phần
                  },
                  children: const [
                    TableRow(
                      children: [
                        TableCell(
                          child: Icon(
                            Icons.settings_backup_restore,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                        TableCell(
                          child: Text(
                            'Hư gì đổi nấy trong vòng 12 tháng tại các trung tâm siêu thị toàn quốc',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Icon(
                            Icons.security,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                        TableCell(
                          child: Text(
                            'Bảo hành chính hãng điện thoại 1 năm tại trung tâm bảo hành chính hãng',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            color: const Color.fromARGB(255, 190, 190, 190),
          ),
          // Thông tin chi tiết sản phẩm
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
            child: Text(
              'Thông tin chi tiết sản phẩm',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded1 = !isExpanded1;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Cấu hình chung',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Icon(isExpanded1
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
                if (isExpanded1)
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(0.5), // Cột thứ nhất chiếm 1 phần
                      1: FlexColumnWidth(1), // Cột thứ hai chiếm 2 phần
                    },
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                              child: Text(
                            'Màn hình:',
                            style: TextStyle(fontSize: 16),
                          )),
                          TableCell(
                            child: Text(
                              'OLED, 6.1", Super Retina XDR',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Text(
                            'Chip:',
                            style: TextStyle(fontSize: 16),
                          )),
                          TableCell(
                            child: Text(
                              'Apple A14 Bionic',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Text(
                            'RAM:',
                            style: TextStyle(fontSize: 16),
                          )),
                          TableCell(
                            child: Text(
                              '4 GB',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Text(
                            'Dung lượng;',
                            style: TextStyle(fontSize: 16),
                          )),
                          TableCell(
                            child: Text(
                              '128 GB',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Text(
                            'Camera sau:',
                            style: TextStyle(fontSize: 16),
                          )),
                          TableCell(
                            child: Text(
                              '2 camera 12 MP',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Text(
                            'Pin, Sạc:',
                            style: TextStyle(fontSize: 16),
                          )),
                          TableCell(
                            child: Text(
                              '2815mAh, 20W',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Text(
                            'Hãng',
                            style: TextStyle(fontSize: 16),
                          )),
                          TableCell(
                            child: Row(
                              children: [
                                Text(
                                  'Apple',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  ' Xem thông tin hãng',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 44, 38, 225)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5), // Đặt bán kính là zero để tắt radius
                        side: const BorderSide(
                          color: Colors.blue, // Màu đường viền
                          width: 1.0, // Độ dày của đường viền
                        ),
                      ),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Xem thêm cấu hình chi tiết',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.play_arrow,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            color: const Color.fromARGB(255, 190, 190, 190),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Đánh giá sản phẩm',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mã Văn Chiều',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber.shade900,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber.shade900,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber.shade900,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber.shade900,
                        ),
                      ],
                    ),
                    const Text('Sản phẩm chất lượng'),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 165, 167, 169),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Đặt bán kính là zero để tắt radius
                            side: const BorderSide(
                              color: Color.fromARGB(
                                  255, 0, 0, 0), // Màu đường viền
                              width: 1.0, // Độ dày của đường viền
                            ),
                          ),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Xem 200 đánh giá',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Viết đánh giá',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
    //       },
    //     );
    //   },
    // );
  }
}
