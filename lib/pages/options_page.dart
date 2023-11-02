import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pics_4_word_1/pages/ontap.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool switchChange = false;
  bool switchChange2 = false;
  int count = 3;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white10,
            title: const Center(
              child: Text('Settings',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white
              ),),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_circle_right_outlined,size: 35,weight: double.maxFinite,))
            ],
          ),
      body: Stack(
        children: [
          Image.asset('assets/images/img_1.png',height: 890,fit: BoxFit.fill,),
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 5,),
              Container(
                height: 80,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [BoxShadow(
                    blurStyle: BlurStyle.outer,
                    blurRadius: 10,
                    color: Colors.black38
                  )]
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const SizedBox(width: 25,),
                      const Text('Sound',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                      ),),
                      const SizedBox(width: 269,),
                      Switch.adaptive(
                        value: switchChange,
                        activeColor: Colors.cyan,
                        inactiveThumbColor: Colors.cyan.shade900,
                        onChanged: (value) {
                        setState(() {
                          switchChange = value;
                        });
                      },)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 80,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [BoxShadow(
                    blurStyle: BlurStyle.outer,
                    blurRadius: 10,
                    color: Colors.black38
                  )]
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const SizedBox(width: 25,),
                      const Text('Vibration',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                      ),),
                      const SizedBox(width: 241,),
                      Switch.adaptive(
                        trackOutlineWidth: MaterialStateProperty.all(20),
                        value: Ontap.switchChange1,
                        activeColor: Colors.cyan,
                        inactiveThumbColor: Colors.cyan.shade900,
                        onChanged: (value) {
                        setState(() {
                          Ontap.switchChange1 = value;
                          HapticFeedback.vibrate();
                          HapticFeedback.heavyImpact();
                          HapticFeedback.lightImpact();
                        });
                      },)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      color: Colors.black38
                    )
                  ]
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      SizedBox(width: 25,),
                      Text('Notifications',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),),
                      SizedBox(width: 218,),
                      Icon(Icons.chevron_right_sharp,size: 45,)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      color: Colors.black38
                    )
                  ]
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      SizedBox(width: 25,),
                      Text('Manage account',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),),
                      SizedBox(width: 182,),
                      Icon(Icons.chevron_right_sharp,size: 45,)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      color: Colors.black38
                    )
                  ]
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      SizedBox(width: 25,),
                      Text('Restore premium',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),),
                      SizedBox(width: 175,),
                      Icon(Icons.chevron_right_sharp,size: 45,)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      color: Colors.black38
                    )
                  ]
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      SizedBox(width: 25,),
                      Text('Remove ads',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),),
                      SizedBox(width: 225,),
                      Icon(Icons.chevron_right_sharp,size: 45,)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 80,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [BoxShadow(
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10,
                        color: Colors.black38
                    )]
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const SizedBox(width: 25,),
                      const Text('Send usage data',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),),
                      const SizedBox(width: 168,),
                      Switch.adaptive(
                        value: switchChange2,
                        activeColor: Colors.blue.shade900,
                        onChanged: (value) {
                          setState(() {
                            switchChange2 = value;
                          });
                        },)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      color: Colors.black38
                    )
                  ]
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      SizedBox(width: 25,),
                      Text('Terms of service',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),),
                      SizedBox(width: 179,),
                      Icon(Icons.chevron_right_sharp,size: 45,)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      color: Colors.black38
                    )
                  ]
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      SizedBox(width: 25,),
                      Text('Privacy Policy',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),),
                      SizedBox(width: 205,),
                      Icon(Icons.chevron_right_sharp,size: 45,)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      color: Colors.black38
                    )
                  ]
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      SizedBox(width: 25,),
                      Text('Imprint',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),),
                      SizedBox(width: 274,),
                      Icon(Icons.chevron_right_sharp,size: 45,)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 120,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [BoxShadow(
                    blurStyle: BlurStyle.outer,
                    blurRadius: 10,
                    color: Colors.black38
                  )]
                ),
                child: const Center(
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Text('Version 61.64.1',style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Colors.white24
                  ),),
                      SizedBox(height: 10,),
                      Text('Support ID :',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: Colors.white24
                      ),),
                      Text('beeiLPVRtdd9t4qc2v3YPd',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: Colors.white24
                      ),)
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
