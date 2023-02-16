import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AvatarType { NICKNAME, STORY, TYPE3 }

class AvatarWidget extends StatelessWidget {
  bool? hasStroy;
  String thumbPath;
  String? nickname;
  AvatarType type;
  double? size;

  AvatarWidget({
    Key? key,
    required this.type,
    required this.thumbPath,
    this.hasStroy,
    this.nickname,
    this.size = 65,
  }) : super(key: key);

  Widget storyWidget() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.purple,
                Colors.orange,
              ]),
          shape: BoxShape.circle,
        ),
        child: myWidget());
  }

  Widget myWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(2),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size!),
          child: SizedBox(
            width: size,
            height: size,
            child: CachedNetworkImage(
              imageUrl: thumbPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget nickNameWidget() {
    return Row(
      children: [
        storyWidget(),
        Text(
          nickname ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.NICKNAME:
        return nickNameWidget();
      case AvatarType.STORY:
        // TODO: Handle this case.
        return storyWidget();
      case AvatarType.TYPE3:
        return myWidget();
    }
    return Container();
  }
}
