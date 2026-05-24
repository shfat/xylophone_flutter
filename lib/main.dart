import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  // Ensures Flutter bindings are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  // Plays the audio file corresponding to the selected note
  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  // Reusable widget for building each musical key on the xylophone
  Widget keySound({
    required List<Color>
    gradientColors, // Gradient colors for the key background
    required int soundNumber, // Sound file number (e.g., note1.wav)
    required String label, // Label displayed on the key (Do, Re, Mi...)
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),

            // Play sound when the key is tapped
            onTap: () => playSound(soundNumber),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Stack(
                children: [
                  // Centered label for the note (e.g., Do, Re, Mi)
                  Center(
                    child: Text(
                      label,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ),

                  // Decorative music note icon on the top-right corner
                  const Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(
                      Icons.music_note,
                      color: Colors.white70,
                      size: 26,
                      blendMode: BlendMode.softLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('XYLOPHONE'),
          titleTextStyle: const TextStyle(
            color: Color(0xFFFA739E),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Source Sans 3',
            letterSpacing: 2.5,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // Each key represents a musical note from Do → Si
            children: [
              keySound(
                gradientColors: [Colors.red.shade400, Colors.red.shade900],
                soundNumber: 1,
                label: 'Do',
              ),
              keySound(
                gradientColors: [
                  Colors.orange.shade300,
                  Colors.orange.shade800,
                ],
                soundNumber: 2,
                label: 'Re',
              ),
              keySound(
                gradientColors: [
                  Colors.yellow.shade200,
                  Colors.yellow.shade800,
                ],
                soundNumber: 3,
                label: 'Mi',
              ),
              keySound(
                gradientColors: [Colors.teal.shade300, Colors.teal.shade800],
                soundNumber: 4,
                label: 'Fa',
              ),
              keySound(
                gradientColors: [Colors.green.shade300, Colors.green.shade900],
                soundNumber: 5,
                label: 'Sol',
              ),
              keySound(
                gradientColors: [Colors.blue.shade300, Colors.blue.shade800],
                soundNumber: 6,
                label: 'La',
              ),
              keySound(
                gradientColors: [
                  Colors.purple.shade300,
                  Colors.purple.shade900,
                ],
                soundNumber: 7,
                label: 'Si',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
