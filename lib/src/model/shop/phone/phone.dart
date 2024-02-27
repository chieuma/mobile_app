import 'package:flutter/material.dart';

class Phone {
  final String name;
  final String inch;
  final String screen;
  final List<ColorImagePhone> colorimagephone;

  Phone(this.name, this.inch, this.screen, this.colorimagephone);
  static List<Phone> phone = [
    Phone(
      'Iphone 15',
      '6.1',
      'Full HD+',
      [
        ColorImagePhone(
          const Color.fromARGB(255, 90, 80, 79),
          [
            ImagePhone('assets/image/Apple/iphone_15_1.jpg'),
            ImagePhone('assets/image/Apple/iphone_15_3.jpg'),
            ImagePhone('assets/image/Apple/iphone_15_3.jpg'),
          ],
          'Xanh Titian',
          [
            MemoryPrice('128', 22000000),
            MemoryPrice('256', 24000000),
            MemoryPrice('512', 26000000),
          ],
        ),
        ColorImagePhone(
          Color.fromARGB(255, 192, 200, 128),
          [
            ImagePhone('assets/image/Apple/iphone_15_2.jpg'),
            ImagePhone('assets/image/Apple/iphone_15_2.jpg'),
          ],
          'Vàng nhạt',
          [
            MemoryPrice('256', 25000000),
            MemoryPrice('512', 27000000),
          ],
        ),
      ],
    ),
    Phone(
      'Iphone 14',
      '6.0',
      'Full HD+',
      [
        ColorImagePhone(
          Colors.red,
          [
            ImagePhone('assets/image/Apple/iphone_15_2.jpg'),
            ImagePhone('assets/image/Apple/iphone_15_1.jpg'),
          ],
          'Đỏ',
          [
            MemoryPrice('64', 19000000),
            MemoryPrice('256', 24000000),
            MemoryPrice('512', 26000000),
          ],
        ),
        ColorImagePhone(
          Colors.blue,
          [
            ImagePhone('assets/image/Apple/iphone_15_1.jpg'),
            ImagePhone('assets/image/Apple/iphone_15_2.jpg'),
          ],
          'Xanh',
          [
            MemoryPrice('256', 25000000),
            MemoryPrice('512', 27000000),
          ],
        ),
      ],
    ),
    Phone(
      'Iphone 13',
      '6.0',
      'Full HD+',
      [
        ColorImagePhone(
          Colors.red,
          [
            ImagePhone('assets/image/Apple/iphone_15_2.jpg'),
            ImagePhone('assets/image/Apple/iphone_15_1.jpg'),
          ],
          'Đỏ',
          [
            MemoryPrice('64', 19000000),
            MemoryPrice('256', 24000000),
            MemoryPrice('512', 26000000),
          ],
        ),
        ColorImagePhone(
          Colors.blue,
          [
            ImagePhone('assets/image/Apple/iphone_15_1.jpg'),
            ImagePhone('assets/image/Apple/iphone_15_2.jpg'),
          ],
          'Xanh',
          [
            MemoryPrice('256', 25000000),
            MemoryPrice('512', 27000000),
          ],
        ),
      ],
    ),
    Phone(
      'Iphone 13',
      '6.0',
      'Full HD+',
      [
        ColorImagePhone(
          Colors.red,
          [
            ImagePhone('assets/image/Apple/iphone_15_2.jpg'),
            ImagePhone('assets/image/Apple/iphone_15_1.jpg'),
          ],
          'Đỏ',
          [
            MemoryPrice('64', 19000000),
            MemoryPrice('256', 24000000),
            MemoryPrice('512', 26000000),
          ],
        ),
        ColorImagePhone(
          Colors.blue,
          [
            ImagePhone('assets/image/Apple/iphone_15_1.jpg'),
            ImagePhone('assets/image/Apple/iphone_15_2.jpg'),
          ],
          'Xanh',
          [
            MemoryPrice('256', 25000000),
            MemoryPrice('512', 27000000),
          ],
        ),
      ],
    ),
    Phone(
      'Iphone 13',
      '6.0',
      'Full HD+',
      [
        ColorImagePhone(
          Colors.red,
          [
            ImagePhone('assets/image/Apple/iphone_15_2.jpg'),
            ImagePhone('assets/image/Apple/iphone_15_1.jpg'),
          ],
          'Đỏ',
          [
            MemoryPrice('64', 19000000),
            MemoryPrice('256', 24000000),
            MemoryPrice('512', 26000000),
          ],
        ),
        ColorImagePhone(
          Colors.blue,
          [
            ImagePhone('assets/image/Apple/iphone_15_1.jpg'),
            ImagePhone('assets/image/Apple/iphone_15_2.jpg'),
          ],
          'Xanh',
          [
            MemoryPrice('256', 25000000),
            MemoryPrice('512', 27000000),
          ],
        ),
      ],
    ),
  ];
}

class ColorImagePhone {
  final Color color;
  final List<ImagePhone> imagephone;
  final String color2;
  final List<MemoryPrice> memoryprice;

  ColorImagePhone(this.color, this.imagephone, this.color2, this.memoryprice);
}

class MemoryPrice {
  final String memory;
  final double price;

  MemoryPrice(this.memory, this.price);
}

class ImagePhone {
  final String imagephone;
  ImagePhone(this.imagephone);
}
