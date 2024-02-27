import 'package:flutter/material.dart';

class AccountManager extends StatefulWidget {
  const AccountManager({super.key});

  @override
  State<AccountManager> createState() => _AccountManagerState();
}

class _AccountManagerState extends State<AccountManager> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quản Lý Tài Khoản",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      backgroundColor:
                          !isSelected ? Colors.black : Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text(
                      'Tài Khoản Quản Lý',
                      style: TextStyle(
                          color: !isSelected
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      backgroundColor: isSelected ? Colors.black : Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text('Tài Khoản Khách Hàng',
                        style: TextStyle(
                            color: isSelected
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : const Color.fromARGB(255, 0, 0, 0))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: !isSelected
                  ? const AccountManagerAdmin()
                  : const AccountManagerClient(),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountManagerAdmin extends StatelessWidget {
  const AccountManagerAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text('data')],
    );
  }
}

class AccountManagerClient extends StatelessWidget {
  const AccountManagerClient({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text('hihi')],
    );
  }
}
