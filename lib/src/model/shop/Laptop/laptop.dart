import 'package:flutter/material.dart';

class Laptop {
  final String name;
  final String inch;
  final String screen;
  final List<Memory> memory;
  final double price;
  final String urlImage;
  final Color color;

  Laptop(this.name, this.inch, this.screen, this.memory, this.price,
      this.urlImage, this.color);
  static List<Laptop> laptop = [
    Laptop(
        'MacBook Air 13',
        '6.1',
        'Full HD+',
        [
          Memory('128'),
          Memory('256'),
          Memory('512'),
        ],
        15000000,
        'assets/image/Laptop/Macbook/macbook_air_13.jpg',
        Colors.red),
    Laptop(
        'MacBook Air 13',
        '6.1',
        'Full HD+',
        [
          Memory('128'),
          Memory('256'),
          Memory('512'),
        ],
        15000000,
        'assets/image/Laptop/Macbook/macbook_air_13.jpg',
        Colors.red),
  ];
}

class Memory {
  final String gb;
  Memory(this.gb);
}
