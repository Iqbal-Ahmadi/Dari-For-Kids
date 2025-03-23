// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:preschool_flutter/cards_screens/lessons/lessons.dart';
import 'package:preschool_flutter/cards_screens/lessons/listen.dart';
import 'package:preschool_flutter/cards_screens/lessons/look.dart';
import 'package:preschool_flutter/widgets/appbar.dart';

class Subcategory extends StatelessWidget {
  const Subcategory({super.key, this.condition, this.title});

  final int? condition;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: title, onpress: () => Navigator.pop(context)),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background/bg_main.png'),
                fit: BoxFit.cover)),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/jsonfile/subcategory.json'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                var newData = jsonDecode(snapshot.data.toString());
                return ListView.builder(
                  padding: EdgeInsets.all(0),
                  // itemExtent: 200,
                  itemCount: newData == null ? 0 : (newData.length / 2).ceil(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 8.0, right: 8.0),
                      title: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (condition == 1) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Lessons(
                                              jsonfile: newData[index * 2]
                                                  ['name'])));
                                } else if (condition == 2) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Look(
                                              Jsonfile: newData[index * 2]
                                                  ['name'])));
                                } else if (condition == 3) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Listen(
                                              Jsonfile: newData[index * 2]
                                                  ['name'])));
                                }
                              },
                              child: Card(
                                color: Colors.transparent,
                                elevation: 0,
                                child: Image.asset(
                                  height: 190,
                                  width: 150,
                                  '${newData[index * 2]['img']}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: (index * 2 + 1) < newData.length
                                ? GestureDetector(
                                    onTap: () {
                                      if (condition == 1) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Lessons(
                                                    jsonfile:
                                                        newData[index * 2 + 1]
                                                            ['name'])));
                                      } else if (condition == 2) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Look(
                                                    Jsonfile:
                                                        newData[index * 2 + 1]
                                                            ['name'])));
                                      } else if (condition == 3) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Listen(
                                                    Jsonfile:
                                                        newData[index * 2 + 1]
                                                            ['name'])));
                                      }
                                    },
                                    child: Card(
                                      color: Colors.transparent,
                                      elevation: 0,
                                      child: Image.asset(
                                        '${newData[index * 2 + 1]['img']}',
                                        height: 190,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
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
      ),
    );
  }
}
