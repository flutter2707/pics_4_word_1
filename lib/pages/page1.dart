import 'package:flutter/material.dart';
import 'package:pics_4_word_1/pages/page2.dart';
import 'package:audioplayers/audioplayers.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final player = AudioPlayer();

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        player.play(AssetSource('audio/hip-hop-rock-beats-118000.mp3'));
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            player.resume();
            return const Page2();
          },
        ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Center(
          child: Column(children: [
            SizedBox(height: 300,),
            Image(
                image: AssetImage('assets/images/img_2.png'),
                height: 300,
                width: 300),
            SizedBox(height: 200,),
            Center(
              child: CircularProgressIndicator(
              ),
            ),
          ]),
        )
      ]),
    ));
  }
}
