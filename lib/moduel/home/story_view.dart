import 'package:elhamdania/componant/componant.dart';
import 'package:elhamdania/cubit/Home_state.dart';
import 'package:elhamdania/cubit/home_cubit.dart';
import 'package:elhamdania/model/details.dart';
import 'package:elhamdania/moduel/details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';

// class StoryViews extends StatelessWidget {
//   final StoryController controller = StoryController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Delicious Ghanaian Meals"),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(
//           8,
//         ),
//         child: ListView(
//           children: <Widget>[
//             Container(
//               height: 300,
//               child: StoryView(
//                 controller: controller,
//                 storyItems: [
//                   StoryItem.text(
//                     title:
//                         "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
//                     backgroundColor: Colors.orange,
//                     roundedTop: true,
//                   ),
//                   // StoryItem.inlineImage(
//                   //   NetworkImage(
//                   //       "https://image.ibb.co/gCZFbx/Banku-and-tilapia.jpg"),
//                   //   caption: Text(
//                   //     "Banku & Tilapia. The food to keep you charged whole day.\n#1 Local food.",
//                   //     style: TextStyle(
//                   //       color: Colors.white,
//                   //       backgroundColor: Colors.black54,
//                   //       fontSize: 17,
//                   //     ),
//                   //   ),
//                   // ),
//                   StoryItem.inlineImage(
//                     url:
//                         "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
//                     controller: controller,
//                     caption: Text(
//                       "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
//                       style: TextStyle(
//                         color: Colors.white,
//                         backgroundColor: Colors.black54,
//                         fontSize: 17,
//                       ),
//                     ),
//                   ),
//                   StoryItem.inlineImage(
//                     url:
//                         "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
//                     controller: controller,
//                     caption: Text(
//                       "Hektas, sektas and skatad",
//                       style: TextStyle(
//                         color: Colors.white,
//                         backgroundColor: Colors.black54,
//                         fontSize: 17,
//                       ),
//                     ),
//                   )
//                 ],
//                 onStoryShow: (s) {
//                   print("Showing a story");
//                 },
//                 onComplete: () {
//                   print("Completed a cycle");
//                 },
//                 progressPosition: ProgressPosition.bottom,
//                 repeat: false,
//                 inline: true,
//               ),
//             ),
//             Material(
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => MoreStories()));
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.black54,
//                       borderRadius:
//                           BorderRadius.vertical(bottom: Radius.circular(8))),
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(
//                         Icons.arrow_forward,
//                         color: Colors.white,
//                       ),
//                       SizedBox(
//                         width: 16,
//                       ),
//                       Text(
//                         "View more stories",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MoreStories extends StatefulWidget {
  List<String>? images;
  List<String>? storyImages;
  List<Videos>? video;
  String? name;
  MoreStories({this.images, this.storyImages, this.video, this.name});
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> backScreen() async {
      setState(() {
        storyController == null;
        // storyController.playbackNotifier.onPause;
        // storyController.
      });
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Home()));
      return true;
    }

    return WillPopScope(
      onWillPop: backScreen,
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                body: StoryView(
                  // inline: true,
                  storyItems: [
                    for (var image in widget.storyImages!)
                      StoryItem.pageImage(
                          url: image,
                          caption: widget.name,
                          controller: storyController,
                          shown: true),
                    for (var video in widget.video!)
                      StoryItem.pageVideo(
                        video.file!,
                        shown: true,
                        // duration: Duration(milliseconds: 100),
                        caption: widget.name,
                        controller: storyController,
                        
                      ),
                  ],
                  onStoryShow: (s) {
                    print(s);
                  },
                  inline: true,
                  onComplete: () {
                    Navigator.pop(context);
                  },
                  onVerticalSwipeComplete: (direction) {
                    if (direction == Direction.down) {
                      Navigator.pop(context);
                       storyController == null;
                    }
                  },
                  progressPosition: ProgressPosition.top,
                  repeat: false,
                  controller: storyController,
                ),
              );
            }),
      ),
    );
  }
}
// List<StoryItem> storylist = [];
// onTap: () {
                  
//                       storylist.add(StoryItem.pageVideo(
//                         item['video'],
//                         controller: controller,
//                       ));

//                       setState(() {});

//                       showDialog(
//                         barrierDismissible: true,
//                         context: context,
//                         builder: (BuildContext context) {
//                           //     storylist = storylist.toSet().toList();

//                           return StoryView(
//                             storyItems: storylist,
//                             onComplete: () {
//                               Navigator.pop(context);
//                               setState(() {});
                             
//                             },
//                             repeat: false,
//                             onVerticalSwipeComplete: (direction) {
//                               if (direction == Direction.down) {
//                                 setState(() {});
//                                 Navigator.pop(context);
//                                 setState(() {});
//                               }
//                             },
//                             controller: controller,
//                           );
//                         },
//                       );
//                     },
