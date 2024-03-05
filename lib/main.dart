import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;



  Future<void> loadVideoPlayer() async {
    _controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    await _controller.initialize();
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: false,
        looping: false, // Set to true if you want the video to loop
        // Other ChewieController configurations go here
      );
    });
  }


  @override
  void initState() {
    super.initState();
    loadVideoPlayer();
  }


  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Video Widget"),
        centerTitle: true,
      ),

      body: Center(
        child: _chewieController != null
            ? Chewie
          (
          controller: _chewieController!,
          )
            : CircularProgressIndicator(),
      ),
    );
  }
}


