import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/cloths_controller.dart';
import 'package:shopping_app/utils/colors.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  // final ClothController _clothController = Get.put(ClothController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Your Cart",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: MyColors.green,
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 1,
                    childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  return Neumorphic(
                    margin: const EdgeInsets.all(20),
                    style: const NeumorphicStyle(
                        intensity: 0.99, depth: 5, color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/shopping-app-f7878.appspot.com/o/chritha%201.jpg?alt=media&token=7aaf0b4e-a345-422b-b656-7d55e54e208f',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              "Chirthar black",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              "600",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.green),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
