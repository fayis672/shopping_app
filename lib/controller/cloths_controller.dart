import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/bootom_nav_controller.dart';
import 'package:shopping_app/models/cloth.dart';

class ClothController extends GetxController {
  final CollectionReference _clothRef =
      FirebaseFirestore.instance.collection('cloth');

  final BottomNavController _bottomNavController =
      Get.put(BottomNavController());

  var clothLsit = <Cloth>[].obs;
  var cartClothList = <Cloth>[].obs;

  @override
  void onInit() {
    getCloths(ClothCategery.values[_bottomNavController.catIndex.value]);
    clothLsit.bindStream(
        getCloths(ClothCategery.values[_bottomNavController.catIndex.value]));
    super.onInit();
  }

  // Future<void> addCloth(Cloth cloth) async {
  //   await _clothRef.add({
  //     'id': cloth.id,
  //     'name': cloth.name,
  //     'description': cloth.description,
  //     'imgurl': cloth.imgUrl,
  //     'price': cloth.price,
  //     'cat': cloth.cat,
  //     'incart': cloth.incart,
  //   });
  // }

  Stream<List<Cloth>> getCloths(ClothCategery cat) {
    switch (cat) {
      case ClothCategery.all:
        return _clothRef.snapshots().map((snapshot) => snapshot.docs
            .map((snap) => Cloth.fromQuerySnapshot(snap))
            .toList());

      case ClothCategery.men:
        return _clothRef.where('cat', isEqualTo: 'men').snapshots().map(
            (snapshot) => snapshot.docs
                .map((snap) => Cloth.fromQuerySnapshot(snap))
                .toList());

      case ClothCategery.women:
        return _clothRef.where('cat', isEqualTo: 'women').snapshots().map(
            (snapshot) => snapshot.docs
                .map((snap) => Cloth.fromQuerySnapshot(snap))
                .toList());

      case ClothCategery.kid:
        return _clothRef.where('cat', isEqualTo: 'kid').snapshots().map(
            (snapshot) => snapshot.docs
                .map((snap) => Cloth.fromQuerySnapshot(snap))
                .toList());

      case ClothCategery.shirt:
        return _clothRef.where('cat', isEqualTo: 'shirt').snapshots().map(
            (snapshot) => snapshot.docs
                .map((snap) => Cloth.fromQuerySnapshot(snap))
                .toList());

      case ClothCategery.pant:
        return _clothRef.where('cat', isEqualTo: 'pant').snapshots().map(
            (snapshot) => snapshot.docs
                .map((snap) => Cloth.fromQuerySnapshot(snap))
                .toList());

      case ClothCategery.shorts:
        return _clothRef.where('cat', isEqualTo: 'short').snapshots().map(
            (snapshot) => snapshot.docs
                .map((snap) => Cloth.fromQuerySnapshot(snap))
                .toList());
    }
  }

  Stream<List<Cloth>> getCartCLoths(ClothCategery cat) {
    return _clothRef.where('incart', isEqualTo: true).snapshots().map(
        (snapshot) => snapshot.docs
            .map((snap) => Cloth.fromQuerySnapshot(snap))
            .toList());
  }

  // Future<void> addToCart() async{
  //   _clothRef.
  // }
}
