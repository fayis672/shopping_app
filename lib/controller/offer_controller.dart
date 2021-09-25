import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/offer.dart';

class OfferController extends GetxController {
  final CollectionReference _offerRef =
      FirebaseFirestore.instance.collection('offer');

  var offersList = <Offer>[].obs;

  @override
  void onInit() {
    getOffers();
    offersList.bindStream(getOffers());
    super.onInit();
  }

  // Future<void> addOffer(Offer offer) async {
  //   await _offerRef.add({
  //     'id': offer.id,
  //     'title': offer.title,
  //     'percentage': offer.percentage,
  //     'cloth_id': offer.clothId,
  //   });
  // }

  Stream<List<Offer>> getOffers() {
    return _offerRef.snapshots().map((snapshot) =>
        snapshot.docs.map((snap) => Offer.fromQuerySnapshot(snap)).toList());
  }
}
