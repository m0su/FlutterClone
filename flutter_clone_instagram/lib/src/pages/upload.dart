import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:get/get.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  Widget _imagePreview() {
    return Container(
      width: Get.width,
      height: Get.width,
      color: Colors.grey,
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: const [
                Text(
                  '갤러리',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Color(0xff808080),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(children: [
                  ImageData(IconsPath.imageSelectIcon),
                  const SizedBox(width: 7),
                  const Text(
                    '여러 항목 선택',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ]),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff808080),
                ),
                child: ImageData(IconsPath.cameraIcon),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _imageSelectList() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1, // 정사각형 ~ 1.5 직사각형
        ),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.red,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageData(
              IconsPath.closeImage,
              // width: 20,
            ),
          ),
        ),
        title: const Text(
          'New Post',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: ImageData(IconsPath.nextImage, width: 50)),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          _imagePreview(),
          _header(),
          _imageSelectList(),
        ],
      )),
    );
  }
}
