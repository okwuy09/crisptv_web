// import 'package:crisptv_media/component/color.dart';
// import 'package:crisptv_media/component/style.dart';
// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:video_player/video_player.dart';

// class StreamVideo extends StatefulWidget {
//   final String videoURL;
//   const StreamVideo({super.key, required this.videoURL});

//   @override
//   State<StreamVideo> createState() => _StreamVideoState();
// }

// class _StreamVideoState extends State<StreamVideo> {
//   late VideoPlayerController _controller;
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoURL)
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Container(
//       height: screenSize.width < 800 ? 270 : 500,
//       width: screenSize.width < 800 ? screenSize.width : screenSize.width,
//       //padding: EdgeInsets.all(screenSize.width / 40),
//       margin: EdgeInsets.symmetric(
//         horizontal: screenSize.width < 800 ? 0 : screenSize.width / 50,
//         //vertical: screenSize.height / 6,
//       ),
//       decoration: BoxDecoration(
//         color: AppColor.primaryColor,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Stack(
//         children: [
//           VideoPlayer(_controller),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: screenSize.width < 800 ? 30 : 50,
//               color: AppColor.primaryColor.withOpacity(0.5),
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   /// Play and pause video
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         _controller.value.isPlaying
//                             ? _controller.pause()
//                             : _controller.play();
//                       });
//                     },
//                     child: Icon(
//                       _controller.value.isPlaying
//                           ? Icons.pause
//                           : Icons.play_arrow,
//                       color: AppColor.white.withOpacity(0.6),
//                       size: 26,
//                     ),
//                   ),

//                   /// Set repeat video
//                   const SizedBox(width: 15),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         _controller.value.isLooping
//                             ? _controller.setLooping(false)
//                             : _controller.setLooping(true);
//                       });
//                     },
//                     child: Icon(
//                       _controller.value.isLooping
//                           ? Icons.repeat_on_outlined
//                           : Icons.repeat,
//                       color: AppColor.white.withOpacity(0.6),
//                       size: 22,
//                     ),
//                   ),

//                   const SizedBox(width: 30),
//                   Expanded(
//                     child: VideoProgressIndicator(
//                       _controller,
//                       allowScrubbing: true,
//                       colors: VideoProgressColors(
//                         backgroundColor: Colors.white,
//                         // bufferedColor: Colors.yellow,
//                         playedColor: AppColor.red.withOpacity(0.5),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 15),
//                   Text(
//                     _controller.value.duration.toString(),
//                     style: style.copyWith(
//                       fontSize: 11,
//                       color: AppColor.white.withOpacity(0.7),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
