import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/bootom_nav_controller.dart';
import 'package:shopping_app/controller/cloths_controller.dart';
import 'package:shopping_app/utils/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ClothController _clothController = Get.put(ClothController());

  final List<String> _catIcon = <String>[
    'assets/icons/home.png',
    'assets/icons/men.png',
    'assets/icons/woman.png',
    'assets/icons/kid.png',
    'assets/icons/shirt.png',
    'assets/icons/yoga-pants.png',
    'assets/icons/short.png',
  ];
  final List<String> _catLabel = <String>[
    'All',
    'Men',
    'Women',
    'Kids',
    'Shirt',
    'Pant',
    'Short',
  ];

  final BottomNavController _bottomNavController =
      Get.put(BottomNavController());

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
                  "Shopping App",
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
          const Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SizedBox(
                    width: 70,
                    child: Neumorphic(
                      style:
                          const NeumorphicStyle(depth: 5, color: Colors.white),
                      margin: const EdgeInsets.all(5),
                      child: Obx(() => GestureDetector(
                            onTap: () {
                              _bottomNavController.catIndex.value = index;
                              _clothController.onInit();
                            },
                            child: Container(
                                color:
                                    _bottomNavController.catIndex.value == index
                                        ? Colors.green
                                        : null,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      _catIcon[index],
                                      width: 30,
                                      height: 30,
                                    ),
                                    Text(
                                      _catLabel[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                          )),
                    ),
                  ),
                );
              },
              itemCount: 7,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(() => GridView.builder(
                itemCount: _clothController.clothLsit.length,
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
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/details', arguments: index);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Hero(
                                tag: "img" + index.toString(),
                                child: Image.network(
                                  _clothController.clothLsit[index].imgUrl ??
                                      "",
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "${_clothController.clothLsit[index].name}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Rs:"
                                "${_clothController.clothLsit[index].price}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.green),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }
}
