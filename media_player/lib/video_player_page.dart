// create me ..............

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerPage extends StatefulWidget {
//   @override
//   State<VideoPlayerPage> createState() => _VideoPlayerPageState();
// }

// class _VideoPlayerPageState extends State<VideoPlayerPage> {
//   VideoPlayerController? mController;
//   IsVisible = false;

//   var videoSrc =
//       "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

//   @override
//   void initState() {
//     super.initState();
//     mController = VideoPlayerController.networkUrl(Uri.parse(videoSrc));
//     if (mController != null) {
//       mController!.initialize().then((value){
//         setState(() {

//         });
//       });
//       mController!.play();
//     }

//     mController!.addListener(() {
//       print(mController!.value);
//       setState(() {

//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//         backgroundColor: Colors.pink,
//         centerTitle: true,
//       ),
//       body: mController!= null ? Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AspectRatio(
//               aspectRatio: mController!.value.aspectRatio,
//               child: Stack(
//                 children: [

//                   VideoPlayer(mController!),
//                      InkWell(
//                     onTap: () {
//                      if(mController!.value.isPlaying){
//                       mController!.pause();
//                       IsVisible = true;
//                      }
//                      else {
//                       mController!.play();
//                       IsVisible = false;
//                      }
//                     },
//                     child: AnimatedOpacity(
//                       duration: Duration(microseconds: 200),
//                       opacity: IsVisible ? 1 : 0,
//                       child: Container(
//                         height: 200,
//                         width: 200,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle, color: Colors.amber.shade500),
//                         child: Center(
//                           child: Icon(mController!.value.isPlaying ? Icons.pause : Icons.play_arrow ),
//                           ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//              Slider(
//                 value: mController!.value.position.inSeconds.toDouble(),
//                min: 0,
//                 max: mController!.value.duration.inSeconds.toDouble(),
//                 activeColor: Colors.amber,
//                  inactiveColor: Colors.grey,
//                  thumbColor: Colors.amber,
//                  onChanged: (value){
//                   mController!.seekTo(Duration(seconds: value.toInt()));
//                  },)
//           ],
//         ),
//       )
//     );
//   }
// }

//......... from chatgpt .............

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController? mController;
  bool IsVisible = false; // Correctly declare IsVisible as a boolean variable

  var videoSrc =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  @override
  void initState() {
    super.initState();
    mController = VideoPlayerController.networkUrl(Uri.parse(videoSrc))
      ..initialize().then((_) {
        setState(() {});
        mController!.play(); // Start playing once the video is initialized
      });

    mController!.addListener(() {
      setState(() {}); // Update UI whenever the video controller changes state
    });
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed from the widget tree.
    mController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: mController != null && mController!.value.isInitialized
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: mController!.value.aspectRatio,
                        child: VideoPlayer(mController!),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (mController!.value.isPlaying) {
                              mController!.pause();
                              IsVisible = true;
                            } else {
                              mController!.play();
                              IsVisible = false;
                            }
                          });
                        },
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: IsVisible ? 1 : 0,
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black54,
                            ),
                            child: Center(
                              child: Icon(
                                mController!.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: mController!.value.position.inSeconds.toDouble(),
                    min: 0,
                    max: mController!.value.duration.inSeconds.toDouble(),
                    activeColor: Colors.amber,
                    inactiveColor: Colors.grey,
                    thumbColor: Colors.amber,
                    onChanged: (value) {
                      setState(() {
                        mController!.seekTo(Duration(seconds: value.toInt()));
                      });
                    },
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
