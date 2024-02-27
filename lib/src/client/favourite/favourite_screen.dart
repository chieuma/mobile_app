import 'package:flutter/material.dart';
import 'package:mobile_app/src/client/cart/cart_screen.dart';
import 'package:mobile_app/src/client/general/general.dart';
import 'package:mobile_app/src/client/productdetailscreen/phone_detail_screen.dart';
import 'package:mobile_app/src/client/shared/top_right_favorite.dart';
import 'package:mobile_app/src/model/shop/phone/phone.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  // Chuyển về trang home
  void _navigateToCart() {
    _navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const CartScreen(),
      ),
      (route) => false,
    );
  }

  void _navigateToPhoneDetail(Phone phone) {
    _navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => PhoneDetailScreen(phone),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavigationModel = Provider.of<BottomNavigationModel>(context);
    return Navigator(
      key: _navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Yêu Thích',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                shadowColor: Colors.black,
                elevation: 4,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: TopRightFavorite(
                      data: 1,
                      child: IconButton(
                        onPressed: () {
                          // bottomNavigationModel.setSelectedIndex(3);
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.pink,
                        ),
                      ),
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
                  Column(
                    children: [
                      SizedBox(
                        height: 400,
                        width: 600,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Phone.phone.length,
                          itemBuilder: (context, index) {
                            final phone = Phone.phone[index];

                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width:
                                    200.0, // Adjust the width of each item as needed
                                margin: const EdgeInsets.all(8.0),
                                color: const Color.fromARGB(255, 255, 255, 255),

                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _navigateToPhoneDetail(
                                              Phone.phone[index]);

                                          // print('Navigator stack:');
                                          // _navigatorKey.currentState
                                          //     ?.popUntil((route) {
                                          //   print(route.settings.name);
                                          //   return true;
                                          // });
                                        },
                                        child: Image.asset(
                                          phone
                                              .colorimagephone
                                              .first
                                              .imagephone
                                              .first
                                              .imagephone, // Replace with your fallback image path
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              phone.name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Text('${phone.inch}"',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(phone.screen,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            for (var color
                                                in phone.colorimagephone)
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                height: 20,
                                                width: 20,
                                                color: color.color,
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 0, 0),
                                        child: Wrap(
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
                                            // Padding(
                                            //   padding: const EdgeInsets.fromLTRB(
                                            //       16, 0, 0, 0),
                                            Row(
                                              children: [
                                                Text(
                                                  '${phone.colorimagephone.first.memoryprice.first.price.toString().replaceAll(RegExp(r'\.0*$'), '')} VND',
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // body: ListView(
                      //   children: [
                      //     Column(
                      //       children: [
                      //         const SizedBox(height: 240),
                      //         const Column(
                      //           children: [
                      //             CircleAvatar(
                      //               radius: 40,
                      //               backgroundColor: Colors.black,
                      //               child: Icon(
                      //                 Icons.favorite_border_outlined,
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //             SizedBox(
                      //               height: 10,
                      //             ),
                      //             Text(
                      //               'Hãy thêm sản phẩm yêu thích của bạn',
                      //               style: TextStyle(fontWeight: FontWeight.w600),
                      //             )
                      //           ],
                      //         ),
                      //         const SizedBox(
                      //           height: 260,
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(20.0),
                      //           child: Column(
                      //             children: [
                      //               SizedBox(
                      //                 height: 50,
                      //                 width: double.infinity,
                      //                 child: ElevatedButton(
                      //                   onPressed: _navigateToHome,
                      //                   style: ElevatedButton.styleFrom(
                      //                     backgroundColor: Colors.black,
                      //                   ),
                      //                   child: const Row(
                      //                     mainAxisAlignment: MainAxisAlignment.center,
                      //                     children: [
                      //                       Text(
                      //                         'Shop Now',
                      //                         style: TextStyle(
                      //                           color: Colors.white,
                      //                           fontSize: 20,
                      //                         ),
                      //                       )
                      //                     ],
                      //                   ),
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
