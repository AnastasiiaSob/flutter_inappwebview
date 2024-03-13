import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(url: Uri.parse("https://zuckerjagdwurst.com")),
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                  ),
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    webViewController.goBack();
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                ElevatedButton(
                  onPressed: () {
                    webViewController.goForward();
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
                ElevatedButton(
                  onPressed: () {
                    webViewController.reload();
                  },
                  child: const Icon(Icons.refresh),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
