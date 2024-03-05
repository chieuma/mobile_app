import 'dart:async';

// import 'package:mobile_app/src/client/general/general.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app/src/client/ui/products/laptop.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/src/client/ui/shop/phone/phone_screen.dart';
// import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now = DateTime.now();

  //Danh sách tháng bằng tiếng anh
  final List<String> englishMonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

// GlobalKey
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  final List<String> firstContainerImagePaths = [
    'assets/image/logo_iphone.jpg',
    'assets/image/logo_samsung.jpg',
    'assets/image/logo_headphone.jpg',
  ];

  //Tự động chuyển ảnh
  final PageController _pageController = PageController();
  int currentPage = 0;
  bool forward = true;

  //Chuyển thứ sang tiếng anh
  String _getDayOfWeek(int dayIndex) {
    switch (dayIndex) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }

  @override
  void initState() {
    super.initState();
    // Gọi hàm tự động chuyển trang sau mỗi giây
    startTimer();
  }

  // Hàm để tự động chuyển trang sau mỗi giây
  void startTimer() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (forward) {
        // Chuyển tới trang tiếp theo
        if (currentPage < firstContainerImagePaths.length - 1) {
          currentPage++;
        } else {
          // Nếu đã đến hình ảnh cuối cùng, chuyển hướng ngược lại
          currentPage--;
          forward = false;
        }
      } else {
        // Chuyển về trang trước đó
        if (currentPage > 0) {
          currentPage--;
        } else {
          // Nếu đã đến trang đầu tiên, chuyển hướng tiếp
          currentPage++;
          forward = true;
        }
      }
      // Chuyển trang của PageView
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Lấy thứ tiếng anh
    String dayName = _getDayOfWeek(now.weekday);

    //Lấy tháng tiếng anh
    String monthName = englishMonths[now.month - 1];

    final double width = MediaQuery.of(context).size.width;
    //  final bottomNavigationModel = Provider.of<BottomNavigationModel>(context);
    return Navigator(
      key: _navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "DISCOVERY",
                  style: TextStyle(fontFamily: 'BebasNeue', fontSize: 27),
                ),
                shadowColor: Colors.black,
                elevation: 4,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        Text(
                          '$dayName, ${now.day} $monthName',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 96, 92, 92)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              body: ListView.builder(
                itemCount: 5, // Số lượng mục trong danh sách
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Mục đầu tiên với PageView
                    return Container(
                      width: width,
                      height: 300,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _pageController,
                            itemCount: firstContainerImagePaths.length,
                            onPageChanged: (pageIndex) {
                              setState(() {
                                currentPage = pageIndex;
                              });
                            },
                            itemBuilder: (context, pageIndex) {
                              return Image.asset(
                                firstContainerImagePaths[pageIndex],
                                width: width,
                                height: 300,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                          Positioned(
                            bottom: 40,
                            left: 70,
                            child: SizedBox(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PhoneScreen(
                                        name: 'Điện thoại',
                                      ),
                                    ),
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Text(
                                      'BUY NOW',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (index == 1) {
                    // Mục thứ hai với ảnh laptop
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        width: width,
                        height: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/logo_laptop.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 40,
                                    left: 70,
                                    child: SizedBox(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Laptop(),
                                            ),
                                          );
                                        },
                                        child: const Row(
                                          children: [
                                            Text(
                                              'BUY NOW',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 12,
                                    right: 10,
                                    child: SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hiệu Năng',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            ' Mạnh mẽ',
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.red),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Đồ họa',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            ' Tuyệt đẹp',
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else if (index == 2) {
                    // Mục thứ ba với ảnh headphone
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        width: width,
                        height: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/image/logo_headphone.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 40,
                                    left: 70,
                                    child: SizedBox(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                        ),
                                        onPressed: () {},
                                        child: const Row(
                                          children: [
                                            Text(
                                              'BUY NOW',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else if (index == 3) {
                    // Mục thứ tư với ảnh ipad
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        width: width,
                        height: 250,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/logo_ipad.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 40,
                                    left: 70,
                                    child: SizedBox(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                        ),
                                        onPressed: () {},
                                        child: const Row(
                                          children: [
                                            Text(
                                              'BUY NOW',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox(height: 40);
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
