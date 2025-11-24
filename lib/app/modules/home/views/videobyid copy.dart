// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// void main() {
//   runApp(const VideoPlayerApp());
// }

// class VideoPlayerApp extends StatelessWidget {
//   const VideoPlayerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Video Player',
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Colors.black,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.black,
//           elevation: 0,
//         ),
//       ),
//       home: const VideoPlayerScreen(),
//     );
//   }
// }

// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({super.key});

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     initializePlayer();
//   }

//   Future<void> initializePlayer() async {
//     _videoPlayerController = VideoPlayerController.networkUrl(
//       Uri.parse('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
//     );
    
//     await _videoPlayerController.initialize();
    
//     setState(() {
//       _chewieController = ChewieController(
//         videoPlayerController: _videoPlayerController,
//         autoPlay: false,
//         looping: false,
//         allowFullScreen: true,
//         showControls: false,
//         customControls: const CustomVideoControls(),
//       );
//       _isLoading = false;
//     });
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Video Player'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Container(
//           constraints: const BoxConstraints(maxWidth: 1120),
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               const Text(
//                 'Fixed Height Video Player (490px)',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 height: 490,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.4),
//                       blurRadius: 15,
//                       offset: const Offset(0, 5),
//                     )
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: _isLoading
//                       ? const Center(child: CircularProgressIndicator())
//                       : Chewie(controller: _chewieController!),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Text(
//                 'Try these features:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//               ),
//               const SizedBox(height: 15),
//               Wrap(
//                 spacing: 15,
//                 runSpacing: 15,
//                 children: [
//                   FeatureChip(icon: Icons.play_arrow, text: 'Play/Pause'),
//                   FeatureChip(icon: Icons.forward_10, text: 'Skip 10s'),
//                   FeatureChip(icon: Icons.replay_10, text: 'Back 10s'),
//                   FeatureChip(icon: Icons.volume_up, text: 'Volume Control'),
//                   FeatureChip(icon: Icons.timer, text: 'Progress Bar'),
//                   FeatureChip(icon: Icons.fullscreen, text: 'Fullscreen'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomVideoControls extends StatelessWidget {
//   const CustomVideoControls({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChewieControls(
//       backgroundColor: Colors.black.withOpacity(0.5),
//       iconColor: Colors.white,
//     );
//   }
// }

// class FeatureChip extends StatelessWidget {
//   final IconData icon;
//   final String text;
  
//   const FeatureChip({
//     super.key,
//     required this.icon,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       decoration: BoxDecoration(
//         color: Colors.blue.shade800,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: 18),
//           const SizedBox(width: 6),
//           Text(text, style: const TextStyle(fontSize: 14)),
//         ],
//       ),
//     );
//   }
// }