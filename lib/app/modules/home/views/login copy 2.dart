// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// import '../controllers/home_controller.dart';

// class _ButterFlyAssetVideo extends StatefulWidget {
//   const _ButterFlyAssetVideo(this.viewType);

//   final VideoViewType viewType;

//   @override
//   _ButterFlyAssetVideoState createState() => _ButterFlyAssetVideoState();
// }
// class _ButterFlyAssetVideoState extends State<_ButterFlyAssetVideo> {
//   late VideoPlayerController cont.controller.controllervideo!;
// HomeController cont =HomeController();

//   @override
//   void initState() {
//     super.initState();
//     cont.controller.controllervideo! = VideoPlayerController.asset(
//       'assets/Butterfly-209.mp4',
//       viewType: widget.viewType,
//     );

//     cont.controller.controllervideo!.addListener(() {
//       setState(() {});
//     });
//     cont.controller.controllervideo!.setLooping(true);
//     cont.controller.controllervideo!.initialize().then((_) => setState(() {}));
//     cont.controller.controllervideo!.play();
//   }

//   @override
//   void dispose() {
//     cont.controller.controllervideo!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.only(top: 20.0),
//           ),
//           const Text('With assets mp4'),
//           Container(
//             padding: const EdgeInsets.all(20),
//             child: AspectRatio(
//               aspectRatio: cont.controller.controllervideo!.value.aspectRatio,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: <Widget>[
//                   VideoPlayer(cont.controller.controllervideo!),
//                   _ControlsOverlay(controller: cont.controller.controllervideo!),
//                   VideoProgressIndicator(cont.controller.controllervideo!, allowScrubbing: true),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _BumbleBeeRemoteVideo extends StatefulWidget {
//   const _BumbleBeeRemoteVideo(this.viewType);

//   final VideoViewType viewType;

//   @override
//   _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
// }

// class _BumbleBeeRemoteVideoState extends State<_BumbleBeeRemoteVideo> {
//   late VideoPlayerController cont.controller.controllervideo!;

//   Future<ClosedCaptionFile> _loadCaptions() async {
//     final String fileContents = await DefaultAssetBundle.of(context)
//         .loadString('assets/bumble_bee_captions.vtt');
//     return WebVTTCaptionFile(
//         fileContents); // For vtt files, use WebVTTCaptionFile
//   }

//   @override
//   void initState() {
//     super.initState();
//     cont.controller.controllervideo! = VideoPlayerController.networkUrl(
//       Uri.parse(
//           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
//       closedCaptionFile: _loadCaptions(),
//       videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
//       viewType: widget.viewType,
//     );

//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.setLooping(true);
//     _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Container(padding: const EdgeInsets.only(top: 20.0)),
//           const Text('With remote mp4'),
//           Container(
//             padding: const EdgeInsets.all(20),
//             child: AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: <Widget>[
//                   VideoPlayer(_controller),
//                   ClosedCaption(text: _controller.value.caption.text),
//                   _ControlsOverlay(controller: _controller),
//                   VideoProgressIndicator(_controller, allowScrubbing: true),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
