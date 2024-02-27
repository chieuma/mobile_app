import 'package:flutter/material.dart';
import 'package:mobile_app/src/model/login_signup/code_login.dart';
import 'signup.dart';
// ignore: unused_import
import '../client/general/general.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthLogin _authLogin = AuthLogin();

  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;

  void _login() async {
    String email = _emailControler.text.trim();
    String password = _passwordController.text.trim();

    String? err = await _authLogin.signInWithEmaiAndPassword(email, password);

    setState(() {});
    if (err == null) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(children: [
              const Text(
                'Thông báo',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Đăng nhập thành công',
                style: TextStyle(fontSize: 20),
              ),
              ClipOval(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    radius: 50,
                    child: Icon(
                      Icons.done,
                      color: Color.fromARGB(255, 4, 254, 0),
                      size: 40,
                    ),
                  ),
                ),
              )
            ]),
            // title: Text('Thông báo'),
            // content: Text('Đăng nhập thành công!'),
            // icon: Icon(Icons.done),
            actions: [
              TextButton(
                onPressed: () {
                  // Đóng hộp thoại
                  Navigator.of(context).pop();
                  // Chuyển hướng đến màn hình BottomNavigation
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavigation()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                const Text(
                  'Thông báo',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Đăng nhập không thành công',
                  style: TextStyle(fontSize: 20),
                ),
                ClipOval(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )),
                    child: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      radius: 50,
                      child: Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 255, 0, 0),
                        size: 40,
                      ),
                    ),
                  ),
                )
              ],
            ),
            // title: Text('Thông báo'),
            // content: Text('Đăng nhập thành công!'),
            // icon: Icon(Icons.done),
            actions: [
              TextButton(
                onPressed: () {
                  // Đóng hộp thoại
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Colors.black, Colors.purple]),
          )),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              // Quay lại trang trước đó khi nhấp vào biểu tượng
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'LOGIN',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'MC-SHOP',
                style: TextStyle(fontFamily: 'RubikMaps', fontSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _emailControler,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Email',
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 16),
                          hintText: 'Email',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 132, 248, 0),
                            ),
                          ),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        labelText: 'Password',
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        hintText: 'Password',
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 132, 248, 0)),
                        ),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: _passwordController.text.isEmpty
                                ? Colors.grey
                                : Colors.blue,
                          ),
                        ),
                      ),
                      obscureText: !_showPassword,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: null,
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ))),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  color: Colors.black, width: 2),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/image/logo_google.png'),
                                  width: 60,
                                ),
                                Text(
                                  'Sign-in with Google',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                )
                              ],
                            ))),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Do you have an Account?',
                          style: TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()),
                              );
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic),
                            )),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
