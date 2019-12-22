import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PortfolioApp extends StatefulWidget {
  PortfolioApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/videos/bgfade.mp4')
      ..initialize();
  }

  void _playVideo() {
    _videoPlayerController = VideoPlayerController.asset('assets/videos/bgfade.mp4')
      ..initialize().then((_) {
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  _desktopView(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Thats Me',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Eins",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text(
                        "Zwei",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text(
                        "Drei",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _mobileView(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Thats Me',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text("Sample Text"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _videoPlayerController.value.size?.width ?? 0,
                height: _videoPlayerController.value.size?.height ?? 0,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playVideo,
        tooltip: '',
        child: Icon(Icons.add),
      ),
    );
  }
}
