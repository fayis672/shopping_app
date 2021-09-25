import 'package:cloud_firestore/cloud_firestore.dart';

class Cloth {
  String? id;
  String? name;
  String? description;
  String? price;
  String? imgUrl;
  String? cat;
  bool? incart;

  Cloth(this.id, this.name, this.description, this.price, this.imgUrl, this.cat,
      this.incart);

  Cloth.fromQuerySnapshot(QueryDocumentSnapshot snapshot) {
    id = snapshot.get('id');
    name = snapshot.get('name');
    description = snapshot.get('description');
    imgUrl = snapshot.get('imgurl');
    price = snapshot.get('price');
    cat = snapshot.get('cat');
    incart = snapshot.get('incart');
  }
}

enum ClothCategery { all, men, women, kid, shirt, pant, shorts }
