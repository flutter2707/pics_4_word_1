import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pics_4_word_1/pages/about_page.dart';
import 'package:pics_4_word_1/pages/play_game_page.dart';
import 'package:pics_4_word_1/pages/options_page.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('4 pics 1 word',style: TextStyle(
          fontSize: 30,
          fontStyle: FontStyle.italic,
        )),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/img.png',height: 900, fit: BoxFit.fill),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(blurRadius: 5,blurStyle: BlurStyle.outer,color: Colors.blue)
                    ],
                    color: Colors.deepPurple
                ),
                child: MaterialButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PlayGamePage(),));
                },
                  child: const Center(
                    child: Text('Play game',style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    )),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(blurRadius: 5,blurStyle: BlurStyle.outer,color: Colors.blue)
                    ],
                    color: Colors.deepPurple
                ),
                child: MaterialButton(onPressed: () {
                  player.pause();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage(),));
                },
                  child: const Center(
                    child: Text('Options',style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    )),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(blurRadius: 5,blurStyle: BlurStyle.outer,color: Colors.blue)
                    ],
                    color: Colors.deepPurple
                ),
                child: MaterialButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AboutPage();
                  },));
                },
                  child: const Center(
                    child: Text('About',style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ]
      ),
    ));
  }
}
