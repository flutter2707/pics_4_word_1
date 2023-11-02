import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../malumotlar/malumotlar.dart';
import '../models/game_model.dart';
import '../models/hive_repo.dart';

class PlayGamePage extends StatefulWidget {
  const PlayGamePage({super.key});

  @override
  State<PlayGamePage> createState() => _PlayGamePageState();
}

class _PlayGamePageState extends State<PlayGamePage> {
  HiveRepo hiveRepo = HiveRepo();
  int time = 0;
  String cuntroller = "00:00:00";
  int rang = 1;
  int currentindex = 0;
  int coins = 25;
  List<String> words = [];
  List<int> index2 = [];
  List<String> answerlist = [];
  late GameModel gameModel;
  AudioPlayer player = AudioPlayer();
  AudioPlayer player1 = AudioPlayer();
  bool t = true;

  @override
  void initState() {
    t = hiveRepo.getVoise();
    if(t) {
      player.play(AssetSource("audio/dota2.mp3"));
      player.setReleaseMode(ReleaseMode.loop);
    }
    time = hiveRepo.getTime();
    Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {
        time++;
        hiveRepo.saveTime(time);
        int hour  =  (time~/3600)%24;
        int minut = (time~/60)%60;
        int secund = time%60;
        List<String> timelist = ["$hour", "$minut", "$secund"];
        cuntroller = "";
        for(int i=0; i<timelist.length; i++){
          if(timelist[i].length<"10".length)timelist[i] = ("0${timelist[i]}");
          cuntroller += "${timelist[i]}:";
        }
        cuntroller = cuntroller.substring(0,cuntroller.length-1);


      });
    });
    rang = hiveRepo.getRang();
    currentindex = hiveRepo.getLevel();
    coins = hiveRepo.getCoins();
    index2 = hiveRepo.getIndex2();
    answerlist = hiveRepo.getAnswerList();
    words = isCheak();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    gameModel = games[currentindex];
    return SafeArea(child: Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: Text("Level ${currentindex+1}",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w500)),
        actions: [
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
            ),
            child: MaterialButton(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8)),
              color: Colors.amber,
              onPressed: (){
                setState(() {
                  rang = 1;
                  hiveRepo.saveRang(1);
                  currentindex = 0;
                  coins = 25;
                  answerlist = [];
                  index2 = [];
                  words = isCheak();
                  hiveRepo.saveTime(0);
                  time = 0;
                  saveAll();
                });
              },
              child: const Text("Restart Game",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),),
            ),
          ),
          const SizedBox(width: 25,),
          Container(
              height: 50,
              width: 45,
              child: Center(child: Text("$coins",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w500),))),
          Image.asset("assets/images/dollar.png",height: 35,width: 35,),
          const SizedBox(width: 10,)
        ],
      ),

      body: Stack(
        children: [
          Image.asset('assets/images/img_6.png',fit: BoxFit.fill,height: 900,),
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.teal
                  ),
                  child: Center(child: Text(cuntroller,style: const TextStyle(color: Colors.black,fontSize: 35),))),
              const SizedBox(height: 80,),
              Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(gameModel.image,fit: BoxFit.fill,)),
              const SizedBox(height: 15,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0; i<gameModel.answer.length; i++)Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [
                          BoxShadow(blurRadius: 15,
                          blurStyle: BlurStyle.normal,
                          color: Colors.black)
                        ],
                        color: rang==1 ? Colors.teal : rang==2 ? Colors.grey :  Colors.red,
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          setState(() {
                            player1.play(AssetSource(Music.music));
                            player.pause();
                            rang = 1;
                            answerlist[i] = "";
                            index2[i] = -1;

                          });
                        },
                        child: Text(answerlist[i]),
                      ),

                    ),
                  )
                ],
              ),
              const SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      itemCount: 12,
                      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6
                      ),
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: const [BoxShadow(blurStyle: BlurStyle.normal,color: Colors.black,blurRadius: 15)],
                              color: index2.contains(index)? Colors.yellowAccent : Colors.teal,
                            ),
                            child: index2.contains(index) ?const Center(child: Text(""),) : MaterialButton(
                              shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(100),),
                              onPressed: ()async{
                                setState(() {
                                  player.pause();
                                  player1.play(AssetSource(Music.music));
                                  HapticFeedback.vibrate();
                                  if(answerlist.contains("")){
                                    int first = answerlist.indexOf("");
                                    answerlist[first] = words[index];
                                    index2[first] = index;
                                  }
                                });
                                saveAll();
                                isAnswer();
                              },
                              child: index2.contains(index) ? const Text(""): Text(words[index],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                            ),

                          ),
                        );
                      }
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100)
                ),
                child: MaterialButton(
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(100)),
                    color: Colors.teal,
                    onPressed: (){
                      setState(() {
                        if(answerlist.contains("")){

                          if(coins>=5) {
                            coins-=5;
                            int first = answerlist.indexOf("");
                            answerlist[first] = games[currentindex].answer[first];
                            index2[first] = words.indexOf(answerlist[first]);
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("coins not enough")));
                          }
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("all boxs are full")));
                        }
                        saveAll();
                        isAnswer();
                        setState(() {

                        });
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("help - 5",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 22),),
                        Image.asset("assets/images/dollar.png",height: 28,width: 28,)
                      ],
                    )),
              )
            ],
          ),
        ),
      ]
      ),

    ));
  }


  isCheak(){

    if(answerlist.isNotEmpty){
      return hiveRepo.getWords();
    }
    answerlist = List.generate(games[currentindex].answer.length, (index) => "");
    index2 = List.generate(games[currentindex].answer.length, (index) => -1);
    List<String> text = games[currentindex].answer.split("");
    for(int i=0; i<12-games[currentindex].answer.length; i++){
      int random = Random().nextInt(26)+65;
      text.add(String.fromCharCode(random));
    }
    text.shuffle();
    return text;
  }

  isAnswer()async{
    if(answerlist.join()==gameModel.answer){
      rang = 2;
      await Future.delayed(const Duration(milliseconds: 300), (){
        showDialog(
            context: context, builder: (context){
          return Dialog(
            backgroundColor: Colors.teal,
            shadowColor: Colors.black,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black)
            ),
            child: Container(
              height: 200,
              width: 300,

              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("You Win",style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w800,
                        fontSize: 35
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              if(currentindex==games.length-1){
                                hiveRepo.saveTime(0);
                                HapticFeedback.vibrate();
                                time = 0;
                                hiveRepo.saveCoins(25);
                                hiveRepo.saveLevel(0);
                                hiveRepo.saveWords([]);
                                hiveRepo.saveIndex2([]);
                                hiveRepo.saveAnswerList([]);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                return ;
                              }
                              coins += 10;
                              answerlist = [];
                              index2 = [];
                              currentindex++;
                              words = isCheak();
                              saveAll();
                              Navigator.pop(context);
                            });
                            rang = 1;
                            hiveRepo.saveRang(1);
                          },
                          style: const ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(Size(300, 60)),
                            backgroundColor: MaterialStatePropertyAll(Colors.brown),
                            shape: MaterialStatePropertyAll(BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))))
                          ),
                          child: Text(currentindex==games.length-1?"Game over":"Next",style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w800,
                              fontSize: 35
                          ),)),
                    ),
                  )
                ],
              ),
            ),
          );
        });
      });
    }else if(!answerlist.contains("")){
      rang=3;
      setState(() {

      });
    }else {
      rang = 1;
      setState(() {
      });
    }
    hiveRepo.saveRang(rang);
  }
  saveAll(){
    hiveRepo.saveAnswerList(answerlist);
    hiveRepo.saveCoins(coins);
    hiveRepo.saveIndex2(index2);
    hiveRepo.saveWords(words);
    hiveRepo.saveLevel(currentindex);
  }
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
