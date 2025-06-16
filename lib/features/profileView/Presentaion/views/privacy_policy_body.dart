import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/theming/color_manager.dart';

class PrivacyPolicyBody extends StatefulWidget {
  const PrivacyPolicyBody({super.key});

  @override
  State<PrivacyPolicyBody> createState() => _PrivacyPolicyBodyState();
}

class _PrivacyPolicyBodyState extends State<PrivacyPolicyBody> {
  late WebViewController webViewController;
  bool isLoaded = false;
  @override
  void initState() {
    webViewController = WebViewController();
    setcontroller();
    super.initState();
  }

  setcontroller() {
    webViewController =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (url) {
                setState(() {
                  isLoaded = true;
                });
              },
              onNavigationRequest: (NavigationRequest request) {
                log(request.url);
                return NavigationDecision.prevent;
              },
            ),
          )
          ..loadRequest(
            Uri.parse(
              'https://www.termsfeed.com/live/8236a528-3ea2-468f-8f69-4d7f50bd8171',
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? WebViewWidget(controller: webViewController)
        : const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: CircularProgressIndicator(color: ColorManager.primary),
          ),
        );
  }
}
