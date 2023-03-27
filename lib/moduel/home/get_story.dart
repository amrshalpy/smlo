import 'package:elhamdania/moduel/home/story_view.dart';
import 'package:flutter/material.dart';

getStory(context) {
  showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            height: 900,
            width: double.infinity,
            child: MoreStories(),
          ));
}
