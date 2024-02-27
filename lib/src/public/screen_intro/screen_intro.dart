import 'package:flutter/material.dart';
import 'package:mobile_app/src/public/login.dart';
import 'package:mobile_app/src/public/signup.dart';

class ScreenIntro extends StatefulWidget {
  const ScreenIntro({super.key});

  @override
  State<ScreenIntro> createState() => _ScreenIntroState();
}

class _ScreenIntroState extends State<ScreenIntro> {
  // final Banner banner;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // logo intro screen
              const Row(
                children: [
                  Expanded(
                    child: Image(
                        image:
                            AssetImage('assets/image/logo_intro_screen.jpg')),
                  )
                ],
              ),
              // Text title
              const Column(
                children: [
                  Text(
                    'Welcome to MC-SHOP',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RubikMaps'),
                  ),
                  Text(
                    'MC-SHOP nơi mua sắm uy tín hàng đầu',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 0, 0, 0), // Màu nền của nút
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 0, 0, 0), // Màu nền của nút
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: const Text(
                          'SignUp',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
