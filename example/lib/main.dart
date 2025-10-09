import 'package:flutter/material.dart';
import 'package:customer_io/customer_io.dart';
import 'package:customer_io/customer_io_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CustomerIO.initialize(
    config: CustomerIOConfig(
      cdpApiKey: "your_cdp_api_key_here",
      jsKey: "your_js_key_here",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Customer.io Example')),
        body: Center(
          child: Wrap(
            spacing: 16,
            children: [
              ElevatedButton(
                onPressed: () => CustomerIO.instance.identify(
                  userId: 'user_123',
                  traits: {'plan': 'pro'},
                ),
                child: const Text('Identify'),
              ),
              ElevatedButton(
                onPressed: () => CustomerIO.instance.track(
                  name: 'clicked_buy',
                  properties: {'price': 19.99},
                ),
                child: const Text('Track'),
              ),
              ElevatedButton(
                onPressed: () => CustomerIO.instance.screen(
                  title: 'Home',
                  properties: {'from': 'example'},
                ),
                child: const Text('Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
