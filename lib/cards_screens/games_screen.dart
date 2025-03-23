// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:preschool_flutter/widgets/appbar.dart';

final List<Color> colorList = [
  Color(0xFFA53EFF),
  Color(0xFF03E82E),
  Color(0xFFD300FF),
  // Color(0xFFFE3D3C),
  Color(0xFFFED801),
  // Color(0xFFFEA900),
  // Color(0xFFFD56EF),
  // Color(0xFFFE3D3C)
];

class Games extends StatelessWidget {
  Games({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar(
            title: 'Kids Preschool Games',
            onpress: () => Navigator.pop(context)),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background/bg_home.webp'),
                  fit: BoxFit.cover)),
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/jsonfile/category.json'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  var newData = jsonDecode(snapshot.data.toString());
                  return ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount:
                        newData == null ? 0 : (newData.length / 2).ceil(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(left: 4.0, right: 4.0),
                        title: Row(
                          children: [
                            Expanded(
                              child: ListViewCard(
                                onPress: () {
                                  Navigator.pushNamed(
                                      context, newData[index * 2]['route']);
                                },
                                image: '${newData[index * 2]['img']}',
                                name: newData[index * 2]['name'],
                                colorIndex: index * 2,
                              ),
                            ),
                            Expanded(
                              child: (index * 2 + 1) < newData.length
                                  ? ListViewCard(
                                      onPress: () {
                                        Navigator.pushNamed(context,
                                            newData[index * 2 + 1]['route']);
                                      },
                                      image: '${newData[index * 2 + 1]['img']}',
                                      name: newData[index * 2 + 1]['name'],
                                      colorIndex: index * 2 + 1,
                                    )
                                  : SizedBox(),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error loading data');
                }
                return CircularProgressIndicator();
              }),
        ));
  }
}

class ListViewCard extends StatelessWidget {
  const ListViewCard(
      {super.key,
      required this.image,
      required this.name,
      this.onPress,
      this.colorIndex});

  final String? image;
  final String? name;
  final Function()? onPress;
  final int? colorIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                offset: Offset(1.0, 1.0), //(x,y)
                blurRadius: 4.0,
              ),
            ],
            border: Border.all(color: Colors.white, width: 2),
            color: colorList[colorIndex!],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(30))),
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            Image.asset(
              height: 170,
              width: double.infinity,
              '$image',
            ),
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Text(
                '$name',
                style: TextStyle(
                    color: colorList[0],
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
