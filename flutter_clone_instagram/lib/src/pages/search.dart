import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      var gridIndex = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if (gridIndex != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gridIndex].add(size);
      groupIndex[gridIndex] += size;
    }
    print(groupBox);
  }

  Widget _appbar() {
    return Row(children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xffefefef),
          ),
          child: Row(children: const [
            Icon(Icons.search),
            Text(
              '검색',
              style: TextStyle(fontSize: 15, color: Color(0xff838383)),
            )
          ]),
        ),
      ),
      const Padding(
        padding: const EdgeInsets.all(15.0),
        child: const Icon(Icons.location_pin),
      ),
    ]);
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jndex) => Container(
                  height: Get.width * 0.33 * groupBox[index][jndex],
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'data:image/jpeg;base64,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',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          _appbar(),
          Expanded(
            child: _body(),
          )
          // _body(),
        ],
      ),
    ));
  }
}
