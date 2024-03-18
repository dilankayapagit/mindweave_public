// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../theme/app_style.dart';
import '../utils/color_constant.dart';
import '../utils/size_utils.dart';
import 'app_bar/custom_app_bar.dart';

class WebWidgetCustom extends StatefulWidget {
  const WebWidgetCustom({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  State<WebWidgetCustom> createState() => _WebWidgetCustomState();
}

class _WebWidgetCustomState extends State<WebWidgetCustom> {
  var controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      //..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: getVerticalSize(85),
          leadingWidth: 62,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: GradientText(
            "Mindweave".tr,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.txtMontserratRomanSemiBold24,
            colors: [
              ColorConstant.mainBlueColor,
              ColorConstant.mainPurpleColor
            ],
          ),
        ),
        body: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
