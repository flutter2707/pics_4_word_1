import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  final player1 = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/img_3.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill,),
          const Column(
            children: [
              SizedBox(height: 100,),
              Row(
                children: [
                  SizedBox(width: 25,),
                  Icon(Icons.format_shapes,size: 140,),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 120,),
                  Row(
                    children: [
                      const SizedBox(width: 45),
                      Image.asset('assets/images/imgapp.jpg',width: 100,height: 100),
                    ],
                  ),
                  const SizedBox(height: 400,),
                  Row(
                    children: [
                      SizedBox(width: 40,),
                      const SizedBox(width: 25,),
                      Center(
                        child: Container(
                          height:220,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(blurRadius: 15,
                                blurStyle: BlurStyle.normal,
                                color: Colors.black
                              ),
                            ]
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Text('''
                                   This 4 pics 1 word game is made by Nodirbek Eshboyev in 2023/06/29 this game is so interesting and useful if you play it you will definitely learn a lot'''.replaceAll('  ', ''),
                                style: const TextStyle(color: Colors.pink,fontWeight: FontWeight.w500,fontSize: 24),maxLines: 50,),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),

    ));
  }
}
