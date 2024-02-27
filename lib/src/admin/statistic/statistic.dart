import 'package:flutter/material.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDateBegin(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null &&
        picked != selectedDate &&
        picked.isBefore(selectedDateEnd.add(const Duration(days: 1)))) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  DateTime selectedDateEnd = DateTime.now();

  Future<void> _selectDateEnd(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateEnd,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null &&
        picked != selectedDateEnd &&
        picked.isAfter(selectedDate.subtract(const Duration(days: 1)))) {
      setState(() {
        selectedDateEnd = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thống Kê",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Ngày bắt đầu:',
                      ),
                      Text(
                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => _selectDateBegin(context),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        child: const Text(
                          'Chọn',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Ngày kết thúc:',
                      ),
                      Text(
                        '${selectedDateEnd.day}/${selectedDateEnd.month}/${selectedDateEnd.year}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => _selectDateEnd(context),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        child: const Text(
                          'Chọn',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),

                  // thống kê
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 235, 189, 20),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            side: const BorderSide(color: Colors.black)),
                        child: const Text(
                          'Thống kê',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'Ngày thống kê:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${selectedDate.day}/${selectedDate.month}/${selectedDate.year} -  ${selectedDateEnd.day}/${selectedDateEnd.month}/${selectedDateEnd.year}',
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                height: 5,
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/icon/access.png'),
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "  Số lượng truy cập: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '30',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/icon/statistic.png'),
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "  Doanh thu: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '30.000.000 VND',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/icon/products.png'),
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "  Số lượng sản phẩm: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '30',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/icon/user_client.png'),
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "  Số lượng tài khoản khách hàng: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '20',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/icon/user_admin.png'),
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "  Số lượng tài khoản quản lý: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/icon/order_yes.png'),
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "  Đơn hàng đã xác nhận: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/icon/order_no.png'),
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "  Đơn hàng chưa xác nhận: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/icon/order_cancel.png'),
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "  Đơn hàng đã hủy: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
