import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class Payment1Item extends StatefulWidget {
  const Payment1Item({super.key});

  @override
  State<Payment1Item> createState() => _Payment1ItemState();
}

class _Payment1ItemState extends State<Payment1Item> {
  bool isChecked = false;
  bool isCheckedCS = false;
  String selectedRadioPayment = '';
  // Radio
  String selectedRadio = '';

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
    if (_counter > 0) {
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

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thanh Toán",
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(0.3),
                  1: FlexColumnWidth(0.5),
                  2: FlexColumnWidth(0.5),
                },
                children: [
                  TableRow(
                    children: [
                      const TableCell(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/image/Apple/iphone_15_1.jpg'),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        Color.fromARGB(255, 139, 138, 138),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Xóa"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const TableCell(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Điện thoại Iphone 15 ProMax',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Màu: Xanh Titan',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      TableCell(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              '22000000đ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              '26000000đ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 106, 106, 106),
                                  decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(
                              width: 150,
                              height: 30,
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
                                      color:
                                          const Color.fromARGB(255, 17, 17, 17),
                                      child: const Icon(
                                        Icons.add,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  prefixIcon: GestureDetector(
                                    onTap: removeItem,
                                    child: Container(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      child: const Icon(
                                        Icons.remove,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: Color.fromARGB(255, 133, 133, 133),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'THÔNG TIN KHÁCH HÀNG',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Column(children: [
                  RadioListTile<String>(
                      activeColor: Colors.green,
                      title: const Text('Anh'),
                      value: '1',
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value!;
                        });
                      }),
                  RadioListTile<String>(
                      activeColor: Colors.green,
                      title: const Text('Chị'),
                      value: '2',
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value!;
                        });
                      }),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Họ và tên',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Họ và Tên',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange))),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Số điện thoại',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Số điện thoại',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Địa chỉ nhận hàng",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Hình thức thanh toán",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    RadioListTile<String>(
                      activeColor: Colors.green,
                      title: Text(
                        'Thanh toán khi nhận hàng',
                        style: TextStyle(
                          color: selectedRadioPayment == '1'
                              ? const Color.fromARGB(255, 4, 161, 9)
                              : Colors.black,
                        ),
                      ),
                      value: '1',
                      groupValue: selectedRadioPayment,
                      onChanged: (value) {
                        setState(() {
                          selectedRadioPayment = value!;
                        });
                      },
                      secondary: Image.asset(
                        'assets/icon/money.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    RadioListTile<String>(
                      activeColor: Colors.green,
                      title: Text(
                        'Thanh toán bằng ví MoMo',
                        style: TextStyle(
                          color: selectedRadioPayment == '2'
                              ? const Color.fromARGB(255, 4, 161, 9)
                              : Colors.black,
                        ),
                      ),
                      value: '2',
                      groupValue: selectedRadioPayment,
                      onChanged: (value) {
                        setState(
                          () {
                            selectedRadioPayment = value!;
                          },
                        );
                      },
                      secondary: Image.asset(
                        'assets/icon/momo.png',
                        width: 55,
                        height: 55,
                      ),
                    ),
                    RadioListTile<String>(
                      activeColor: Colors.green,
                      title: Text(
                        'Thanh toán bằng ZaloPay',
                        style: TextStyle(
                          color: selectedRadioPayment == '3'
                              ? const Color.fromARGB(255, 4, 161, 9)
                              : Colors.black,
                        ),
                      ),
                      value: '3',
                      groupValue: selectedRadioPayment,
                      onChanged: (value) {
                        setState(
                          () {
                            selectedRadioPayment = value!;
                          },
                        );
                      },
                      secondary: Image.asset(
                        'assets/icon/zalo_pay.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Tổng tiền: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '22000000đ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isCheckedCS,
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedCS = value!;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              text: 'Tôi đồng ý với ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'chính sách quản lý dữ liệu cá nhân',
                                  style: TextStyle(
                                    color: Colors.blue, // Đổi màu của phần này
                                    fontWeight: FontWeight
                                        .bold, // Các thuộc tính khác nếu cần
                                  ),
                                ),
                                TextSpan(
                                  text: ' của MC - SHOP',
                                  // Các thuộc tính cho phần còn lại của văn bản
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
                child: SizedBox(
                  width: deviceWidth - 20,
                  child: TextButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Quý khách đã đặt hàng thành công",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          backgroundColor: Colors.green);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Đặt độ cong ở đây
                        ),
                      ),
                    ),
                    child: const Text(
                      'ĐẶT HÀNG',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
