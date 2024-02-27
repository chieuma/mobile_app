import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword1 = false;
  bool _showPassword2 = false;
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
            'SIGN UP',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/image/logo_signup.png'),
                    width: 100,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Username',
                        hintStyle: TextStyle(fontWeight: FontWeight.w600),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          hintStyle: TextStyle(fontWeight: FontWeight.w600),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        hintText: 'Password',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword1 = !_showPassword1;
                            });
                          },
                          icon: Icon(
                            _showPassword1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: (_passwordController.text.isEmpty)
                                ? Colors.grey
                                : Colors.blue,
                          ),
                        ),
                      ),
                      obscureText: !_showPassword1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        hintText: 'Repeat Password',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword2 = !_showPassword2;
                            });
                          },
                          icon: Icon(
                            _showPassword2
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: (_passwordController.text.isEmpty)
                                ? Colors.grey
                                : Colors.blue,
                          ),
                        ),
                      ),
                      obscureText: !_showPassword2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text(
                              'SIGN UP',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ))),
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
                                    builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
                              'Login',
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
