import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/bootom_nav_controller.dart';
import 'package:shopping_app/controller/cloths_controller.dart';
import 'package:shopping_app/controller/dynamic_link_controller.dart';
import 'package:shopping_app/utils/colors.dart';

class ClothDetails extends StatelessWidget {
  ClothDetails({Key? key}) : super(key: key);

  final List<Color> _colors = <Color>[Colors.blue, Colors.red, Colors.yellow];
  final List<String> _size = <String>["S", "M", "L"];
  final BottomNavController _bottomNavController =
      Get.put(BottomNavController());

  final DynamicLinkController _dynamicLinkController =
      Get.put(DynamicLinkController());

  final ClothController _clothController = Get.put(ClothController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Hero(
            tag: "img" + Get.arguments.toString(),
            child: Image.network(
              _clothController.clothLsit[Get.arguments].imgUrl ?? "",
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: MyColors.green,
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: MyColors.green,
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  icon: const Icon(Icons.share),
                  color: Colors.white,
                  onPressed: () async {
                    var link = await _dynamicLinkController
                        .createDynamicLink(Get.arguments);
                    await _dynamicLinkController.share(link.toString());
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 280),
            child: Container(
                padding: const EdgeInsets.all(20),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Color:",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Obx(() => GestureDetector(
                                        onTap: () {
                                          _bottomNavController
                                              .colorIndex.value = index;
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: _colors[index],
                                              border: _bottomNavController
                                                          .colorIndex.value ==
                                                      index
                                                  ? Border.all(
                                                      color: Colors.black,
                                                      width: 3)
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(200)),
                                        ),
                                      )),
                                );
                              }),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Size:",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Obx(() => GestureDetector(
                                        onTap: () {
                                          _bottomNavController.sizeIndex.value =
                                              index;
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: MyColors.green
                                                  .withOpacity(0.4),
                                              border: _bottomNavController
                                                          .sizeIndex.value ==
                                                      index
                                                  ? Border.all(
                                                      color: Colors.black,
                                                      width: 3)
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(200)),
                                          child: Center(
                                            child: Text(
                                              _size[index],
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              }),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Price:",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _clothController.clothLsit[Get.arguments].price ?? '',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    child: OutlinedButton(
                        style: const ButtonStyle(),
                        onPressed: () {},
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Buy"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
