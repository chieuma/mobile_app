import 'package:firebase_database/firebase_database.dart';

class Product {
  late String? id;
  late String? name;
  late int? price;

  Product(this.id, this.name, this.price);

  // Chuyển đổi dữ liệu từ Snapshot
  Product.fromSnapshot(DataSnapshot snapshot) {
    if (snapshot.value is Map<String, dynamic>) {
      final data = snapshot.value as Map<String, dynamic>;
      id = data['id'] as String?;
      name = data['name'] as String?;
      price = data['price'] as int?;
    }
  }
}

Future<Product?> fetchProduct(String productId) async {
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('products').child(productId);
  DataSnapshot dataSnapshot = (await databaseReference.once()) as DataSnapshot;

  if (dataSnapshot.value != null) {
    return Product.fromSnapshot(dataSnapshot);
  } else {
    return null;
  }
}
