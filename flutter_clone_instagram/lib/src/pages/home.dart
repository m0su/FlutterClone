import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.TYPE3,
          thumbPath:
              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstock.adobe.com%2F&psig=AOvVaw0qYzXss9IunjLNwh4LGWim&ust=1676547236468000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCPjAufG4l_0CFQAAAAAdAAAAABAI',
          size: 70,
        ),
        Positioned(
          right: 5,
          bottom: 0,
          child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(color: Colors.white, width: 2)),
              child: const Center(
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              )),
        ),
      ],
    );
  }

  Widget _stroyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 20),
        _myStory(),
        const SizedBox(width: 5),
        ...List.generate(
            100,
            (index) => AvatarWidget(
                  type: AvatarType.STORY,
                  thumbPath:
                      'https://slp-statics.astockcdn.net/static_assets/staging/22spring/free/browse-vector-categories-collections/Card4_399895799.jpg?width=580',
                )),
      ]),
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: ImageData(
              IconsPath.logo,
              width: 270,
            ),
            actions: [
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ImageData(IconsPath.directMessage, width: 50),
                  )),
            ]),
        body: ListView(
          children: [
            _stroyBoardList(),
            _postList(),
          ],
        ));
  }
}
