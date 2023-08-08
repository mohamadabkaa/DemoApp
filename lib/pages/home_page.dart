//ignore_for_file: unused_local_variable

import 'package:demo_app/Widgets/app_text.dart';
import 'package:demo_app/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/Widgets/app_large_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  var images ={
    "balloning.png":"Balloning",
    "hiking.png":"Hiking",
    "kayaking.png":"kayaking",
    "snorkling.png":"Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child : Row(
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black54,
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  )
                ],
              )),
          const SizedBox(height: 30,),
          //discover text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child:  const AppLargeText(
              text: "Discover",
            ),
          ),
          SizedBox(height: 20,),
          //tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                  const CircleTabIndicator(color: Colors.black26, redius: 4),
                  tabs: [
                    Tab(text: "Places"),
                    Tab(text: "Insoiration"),
                    Tab(text: "Emotion"),
                  ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 15, top: 10),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal, 
                  itemBuilder: (BuildContext context, int index) {
                    return
                      Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("img/mountain.jpeg"),
                              fit: BoxFit.cover)),
                    );
                  },
                ),
                const Text("Bye"),
                const Text("There")
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Container(
            margin:const EdgeInsets.only(left: 20,right: 20) ,
           child:Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLargeText(text: "Explore more",size: 22,),
              AppText(text:"See all",color: AppColors.textColor1,)
            ],
          ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount:4,
                 scrollDirection: Axis.horizontal,
                 itemBuilder:    (_,index ){
              return Container(
                margin:const EdgeInsets.only(right: 30) ,
                  child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
              //margin: const EdgeInsets.only(right: 50),
                   width: 80,
                   height: 80,
                   decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.white,
                   image: DecorationImage(
                   image: AssetImage("img/"+images.keys.elementAt(index)),
                   fit: BoxFit.cover)),
                   ),
                  SizedBox(height: 10,),
                Container(
                  child: AppText(
                    text: images.values.elementAt(index),
                    color: AppColors.textColor2,
                  ),
                )

                 ],
                ));
               }),
           )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double redius;

  const CircleTabIndicator({required this.color, required this.redius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, redius: redius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double redius;

  _CirclePainter({required this.color, required this.redius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - redius / 2,
        configuration.size!.height - redius);
    canvas.drawCircle(offset + circleOffset, redius, paint);
  }
}
