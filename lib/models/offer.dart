import 'package:cloud_firestore/cloud_firestore.dart';

class Offer {
  String? id;
  String? title;
  String? percentage;
  String? clothId;

  Offer(this.id, this.title, this.percentage, this.clothId);

  Offer.fromQuerySnapshot(QueryDocumentSnapshot snapshot) {
    id = snapshot.get('id');
    title = snapshot.get('title');
    percentage = snapshot.get('percentage');
    clothId = snapshot.get('cloth_id');
  }
}
