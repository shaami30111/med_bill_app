import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicalBillingListScreen extends StatelessWidget {
  final List<String> billingItems = [
    "Billing Item 1",
    "Billing Item 2",
    "Billing Item 3",
    "Billing Item 4",
    "Billing Item 5",
  ];

  final List<String> billingURL = [
    "https://forum.katalon.com/",
    "https://www.google.com/",
    "https://www.facebook.com/",
    "https://www.linkedin.com/",
    "https://www.fast.com/",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Billing List'),
      ),
      body: ListView.builder(
        itemCount: billingItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(billingItems[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicalBillingDetailScreen(
                    url: billingURL[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MedicalBillingDetailScreen extends StatelessWidget {
  final String url;

  const MedicalBillingDetailScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Billing Detail'),
      ),
      body: WebviewScaffold(
        url: url,
        withJavascript: true,
        withLocalStorage: true,
        withZoom: false,
      ),
    );
  }
}
