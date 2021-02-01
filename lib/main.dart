import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(DrumMachineApp());

class DrumMachineApp extends StatelessWidget {
  void playSound(int number, double volume) {
    var player = AudioPlayer().setVolume(volume);
    var cache = AudioCache(fixedPlayer: AudioPlayer());
    cache.play('$number.wav');
  }

  void stopSound() {
    AudioPlayer().stop();
  }

  Expanded buildKey({Color color, int number, double volume, String name}) {
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.all(10),
        onPressed: () => playSound(number, volume),
        onLongPress: () => stopSound(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ],
          ),
          width: 200,
          height: 200,
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildKey(
                          color: Colors.red,
                          number: 1,
                          volume: 1,
                          name: 'KICK'),
                      buildKey(
                          color: Colors.orange,
                          number: 2,
                          volume: 0.7,
                          name: 'SNARE'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildKey(
                          color: Colors.yellow,
                          number: 3,
                          volume: 0.4,
                          name: 'HI HAT'),
                      buildKey(
                          color: Colors.green,
                          number: 4,
                          volume: 1,
                          name: 'CLAP'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildKey(
                          color: Colors.teal,
                          number: 5,
                          volume: 0.6,
                          name: 'MELODY 1'),
                      buildKey(
                          color: Colors.blue,
                          number: 6,
                          volume: 0.6,
                          name: 'MELODY 2'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildKey(
                          color: Colors.white,
                          number: 7,
                          volume: 0.6,
                          name: 'MELODY 3'),
                      buildKey(
                          color: Colors.brown,
                          number: 8,
                          volume: 0.6,
                          name: 'MELODY 4'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
