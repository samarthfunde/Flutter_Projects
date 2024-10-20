import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_player/video_player_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(),
      home: VideoPlayerPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AudioPlayer audioPlayer;
  Duration TotalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;
  Duration bufferedPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    SetUpMyAudioPlayer();
  }

  void SetUpMyAudioPlayer() async {
    String audioSrc =
        "https://raag.fm/files/mp3/128/Hindi-Singles/23303/Kesariya%20(Brahmastra)%20-%20(Raag.Fm).mp3";
    audioPlayer = AudioPlayer();
    TotalDuration = await audioPlayer.setUrl(audioSrc) ?? Duration.zero;
    audioPlayer.play();

    audioPlayer.positionStream.listen((event) {
      setState(() {
        currentPosition = event;
      });
    });

    audioPlayer.bufferedPositionStream.listen((event) {
      setState(() {
        bufferedPosition = event;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Audio Player'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Progress bar with reduced width
          SizedBox(
            width: 300, // Adjust the width of the progress bar here
            child: ProgressBar(
              progress: currentPosition,
              buffered: bufferedPosition,
              total: TotalDuration,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  if (audioPlayer.playing) {
                    audioPlayer.pause();
                  } else {
                    audioPlayer.play();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amber.shade500),
                  child: Center(child: Icon(Icons.skip_previous)),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (audioPlayer.playing) {
                      audioPlayer.pause();
                    } else {
                      audioPlayer.play();
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amber.shade500),
                  child: Center(
                      child: Icon(audioPlayer.playing
                          ? Icons.pause
                          : Icons.play_arrow)),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amber.shade500),
                  child: Center(child: Icon(Icons.skip_next)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
