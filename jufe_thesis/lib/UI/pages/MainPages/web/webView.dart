import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String url;
  String name;
  WebViewPage(this.url, this.name, {Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

JavascriptChannel snackBarJavascripChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'SnackbarJSChannel',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message.message),
        ));
      });
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController _webViewController;
  bool isloading = true;
  String filePath = 'https://www.baidu.com/'; //'http://oice.jxufe.edu.cn/';
  @override
  void initState() {
    // _webViewController = WebViewController
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: isloading ? const Text("Loading ...") : Text(widget.name),
        centerTitle: true,
        actions: <Widget>[NavigationContols(_controller.future)],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) {
              setState(() {
                isloading = false;
              });
            },
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
              _webViewController = webViewController;
              // _loadHtmlFromAssets();
            },
            javascriptChannels: <JavascriptChannel>{
              snackBarJavascripChannel(context),
            },
          )
        ],
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}

class NavigationContols extends StatelessWidget {
  const NavigationContols(this._webViewControllerFuture);
  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController? controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        if (await controller!.canGoBack()) {
                          controller.goBack();
                        } else {
                          Scaffold.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Sorry It's main page You can't go back ")));
                        }
                      }),
            //------------------------------------>buttom------------------------->

            IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        if (await controller!.canGoForward()) {
                          controller.goForward();
                        } else {
                          Scaffold.of(context).showSnackBar(const SnackBar(
                              content: Text("Sorry No Forward Item ")));
                        }
                      }),

            //----------------------------------------------refresh----------------------------

            IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        controller!.reload();
                      }),

            //----------------------------------------------refresh----------------------------

            /*    IconButton(
                icon: const Icon(Icons.info),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        showUserAgent(controller, context);
                      }),*/
          ],
        );
      },
    );
  }

  showUserAgent(WebViewController controller, BuildContext context) {
    controller.evaluateJavascript(
        'SnackbarJSChannel.postMessage("User Agent: " + navigator.userAgent);');
  }
}
