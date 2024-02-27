import 'package:flutter/material.dart';
import 'package:mobile_app/src/model/shop/phone/phone.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  bool isSelectedItem = false;
  bool isSearchActivated = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 240.81,
            child: ListView.builder(
              itemCount: Phone.phone.length,
              itemBuilder: (context, index) {
                final phone = Phone.phone[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 200.0,
                    margin: const EdgeInsets.all(8.0),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      height: 300,
                                      child: Center(
                                        child: Image.asset(
                                          phone.colorimagephone.first.imagephone
                                              .first.imagephone,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      height: 100,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 90,
                                              child: TextButton(
                                                onPressed: () {},
                                                style: ButtonStyle(
                                                  side: MaterialStateProperty
                                                      .all<BorderSide>(
                                                    const BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0)),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255)),
                                                ),
                                                child: const Text(
                                                  'Xóa',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 90,
                                              child: TextButton(
                                                onPressed: () {},
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                ),
                                                child: const Text(
                                                  'Cập nhật',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TableCell(
                                child: Column(
                                  children: [
                                    Container(
                                      color: const Color.fromARGB(
                                          255, 0, 255, 251),
                                      height: 100,
                                      child: Center(
                                        child: Text(
                                          phone.name,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (var color
                                              in phone.colorimagephone)
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 10, 0),
                                              height: 20,
                                              width: 20,
                                              color: color.color,
                                            ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (var memory in phone
                                              .colorimagephone
                                              .first
                                              .memoryprice)
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                '${memory.memory}GB',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('${phone.inch}"',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(phone.screen,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Giá từ\n${phone.colorimagephone.first.memoryprice.first.price.toString().replaceAll(RegExp(r'\.0*$'), '')} VND',
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
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
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
