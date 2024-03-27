import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'callpage.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Text('Home Page'),
          ElevatedButton(
            onPressed: () {
              if (ZegoUIKitPrebuiltCallMiniOverlayMachine().isMinimizing) {
                /// when the application is minimized (in a minimized state),
                /// disable button clicks to prevent multiple PrebuiltCall components from being created.
                return;
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CallPage(
                            callID: 'seymurCall',
                          )));
            },
            child: Text('Call Page'),
          ),
        ],
      ),
    );
  }
}
