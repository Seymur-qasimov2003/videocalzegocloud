import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterzegoxloudtestvideocall/callmodel.dart';
import 'package:flutterzegoxloudtestvideocall/management.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends ConsumerWidget {
  CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;
  final ZegoUIKitPrebuiltCallController controller =
      ZegoUIKitPrebuiltCallController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ZegoUIKitPrebuiltCall(
        appID: CallModel.appId,
        // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: CallModel.appSign,
        // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: ref.watch(Signinriverpodprovider).userId,
        userName: ref.watch(Signinriverpodprovider).username,
        callID: callID,
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall()
          ..turnOnCameraWhenJoining = true
          ..turnOnMicrophoneWhenJoining = true
         );
  }
}
