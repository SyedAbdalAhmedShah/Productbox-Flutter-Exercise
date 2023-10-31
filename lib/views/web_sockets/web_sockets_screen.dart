import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebsocketPage extends StatefulWidget {
  const WebsocketPage({Key? key}) : super(key: key);

  @override
  State<WebsocketPage> createState() => _WebsocketDemoState();
}

class _WebsocketDemoState extends State<WebsocketPage> {
  String btcUsdtPrice = "0";
  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/btcusdt@trade');
  @override
  void initState() {
    super.initState();
    streamListener();
  }

  streamListener() {
    channel.stream.listen((message) {
      Map getData = jsonDecode(message);
      setState(() {
        btcUsdtPrice = getData['p'];
      });
      // print(getData['p']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BTC/USDT Price",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                btcUsdtPrice,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 250, 194, 25),
                    fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
