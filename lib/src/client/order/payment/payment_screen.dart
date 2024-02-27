import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  bool isCheckedCS = false;
  bool isSelectExpanded = false;
  String selectedRadio = '';
  String selectedRadioPayment = '';

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thanh Toán',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 4,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(
                  () {
                    isSelectExpanded = !isSelectExpanded;
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sản phẩm đã chọn',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Icon(isSelectExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
            if (isSelectExpanded)
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'IPhone 15 promax 1T mau xanh',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '2 x 11000000đ',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                                color: Color.fromARGB(255, 187, 4, 4)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'THÔNG TIN KHÁCH HÀNG',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Column(
                children: [
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
                      setState(
                        () {
                          selectedRadio = value!;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
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
              padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
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
                        '22.000.000đ',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
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
                            style: TextStyle(color: Colors.black, fontSize: 16),
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
                      msg: "This is a top snackbar",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                    );
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
    );
  }
}
