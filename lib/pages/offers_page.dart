import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/offer_controller.dart';

class OfferPage extends StatelessWidget {
  OfferPage({Key? key}) : super(key: key);

  final OfferController _offerController = Get.put(OfferController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/bg/bg.jpg',
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                "Offers",
                style: TextStyle(
                    fontSize: 40,
                    letterSpacing: 10,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _offerController.offersList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Neumorphic(
                        style: const NeumorphicStyle(depth: 5),
                        child: Container(
                          height: 170,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Obx(() => Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "${_offerController.offersList[index].title}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "${_offerController.offersList[index].percentage}"
                                        "%",
                                        style: const TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: const Text("Claim"))
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ),
                    );
                  }),
            )
          ],
        )
      ],
    );
  }
}
