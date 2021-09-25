import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkController extends GetxController {
  @override
  void onInit() {
    initDynamicLinks();
    super.onInit();
  }

  Future<Uri> createDynamicLink(int index) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://shoppingapp1.page.link',
      link: Uri.parse('https://shoppingapp1.page.link/' + index.toString()),
      androidParameters: AndroidParameters(
        packageName: 'com.example.shopping_app',
        minimumVersion: 0,
      ),
    );
    return await parameters.buildUrl();
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;
      if (deepLink != null) {
        Get.toNamed('/details', arguments: int.parse(deepLink.path));
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }

  Future<void> share(String link) async {
    await FlutterShare.share(
        title: 'Share Product',
        text: 'Shopping app',
        linkUrl: link,
        chooserTitle: 'Share Product');
  }
}
