import 'package:flutter/material.dart';

class Rule extends StatelessWidget {
  const Rule({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _listRules = [
      'Điều khoản dịch vụ',
      'Chính sách bảo mật',
      'Quy chế hoạt động',
      'Quy trình đăng bán sản phẩm',
      'Chính sách cấm/hạn chế sản phẩm',
      'Chính sách vận chuyển',
      'Chính sách trao đổi/trả hàng'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Điều Khoản MC - SHOP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _listRules.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '- ${_listRules[index]}',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 98, 179),
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
