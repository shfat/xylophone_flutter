import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded keySound({required Color color, required int soundNumber}) {
    return Expanded(
      child: Card(

        color: color,
        child: IconButton(
          onPressed: () async {
            playSound(soundNumber);
          },

          icon: Icon(
            CupertinoIcons.music_note_2,
            color: Colors.black,
            size: 28,
            blendMode: BlendMode.softLight,
          ),
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text('XYLOPHONE'),
          titleTextStyle: TextStyle(
              color: Colors.pinkAccent,
              fontSize: 28,
              fontFamily: 'Source Sans 3',
              letterSpacing: 2.5
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              keySound(color: Colors.red.shade700, soundNumber: 1),
              keySound(color: Colors.orange.shade400, soundNumber: 2),
              keySound(color: Colors.yellow.shade400, soundNumber: 3),
              keySound(color: Colors.teal, soundNumber: 4),
              keySound(color: Colors.green, soundNumber: 5),
              keySound(color: Colors.blue, soundNumber: 6),
              keySound(color: Colors.purple.shade700, soundNumber: 7),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
