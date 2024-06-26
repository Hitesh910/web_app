import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  InAppWebViewController? checkInAppWebView;

  // String? link = ModalRoute.of(context)!.settings.arguments as String;

  @override
  Widget build(BuildContext context) {
    String? link = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        actions: [
          IconButton(
              onPressed: () {
                checkInAppWebView!.goBack();
              },
              icon: const Icon(Icons.arrow_back)),
          IconButton(
              onPressed: () {
                checkInAppWebView!.goForward();
              },
              icon: const Icon(Icons.arrow_forward)),
          IconButton(
              onPressed: () {
                checkInAppWebView!.reload();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          providerW!.isCheck < 1.0 ? LinearProgressIndicator(
              value: providerW!.isCheck) : Container(),
          Expanded(
            child: InAppWebView(
              onLoadStart: (controller, url) {
                checkInAppWebView = controller;
              },
              onLoadStop: (controller, url) {
              },
              onProgressChanged: (controller, progress) {
                double check = progress / 100;
                providerW!.checkProgress(check);
              },
              initialUrlRequest:
              URLRequest(url: WebUri("${link}")),
            ),
          ),
        ],
      ),
    );
  }
}
