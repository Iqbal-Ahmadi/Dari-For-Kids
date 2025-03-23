// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:preschool_flutter/widgets/appbar.dart';

// bool isselected = false;
// Color selectedColor = Colors.white;

// class painting extends StatefulWidget {
//   @override
//   State<painting> createState() => _DrawingState();
// }

// class _DrawingState extends State<painting> {
//   Image image = Image.asset('assets/item/1.webp');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//           Appbar(title: 'Kids Drawing', onpress: () => Navigator.pop(context)),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   'assets/background/bg_paint.webp',
//                 ))),
//         child: Stack(
//           // mainAxisAlignment: MainAxisAlignment.end,
//           alignment: Alignment.bottomCenter,
//           children: [
//             ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                   selectedColor,
//                   BlendMode.modulate,
//                 ),
//                 child: Image.asset('assets/item/1.webp')),
//             isselected == true
//                 ? Container(
//                     width: double.infinity,
//                     height: 70,
//                     decoration: BoxDecoration(
//                         color: Color(0xFFED9901),
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(15),
//                             topRight: Radius.circular(15))),
//                     // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
//                     child: //ImageList()
//                         Padding(
//                       padding: const EdgeInsets.all(2.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             children: <Widget>[
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   RoundedButton(color: Colors.red),
//                                   RoundedButton(color: Colors.blue),
//                                   RoundedButton(color: Colors.green),
//                                   RoundedButton(color: Colors.yellow),
//                                   RoundedButton(color: Colors.orange),
//                                   RoundedButton(color: Colors.purple),
//                                   RoundedButton(color: Colors.pink),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   RoundedButton(color: Colors.cyan),
//                                   RoundedButton(color: Colors.black),
//                                   RoundedButton(color: Colors.brown),
//                                   RoundedButton(color: Colors.grey),
//                                   RoundedButton(color: Colors.teal),
//                                   RoundedButton(color: Colors.indigo),
//                                   RoundedButton(color: Colors.brown),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           GestureDetector(
//                             onTap: () {},
//                             child: Image.asset(
//                               'assets/icons/ic_color_picker.webp',
//                               height: 60,
//                               width: 60,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 : SizedBox(),
//             // paintImage(canvas: canvas, rect: rect, image: image)
//           ],
//         ),
//       ),
//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//           canvasColor: Colors.amber,
//         ),
//         child: SizedBox(
//           height: 80,
//           child: BottomNavigationBar(
//             selectedFontSize: 0,
//             unselectedFontSize: 0,
//             type: BottomNavigationBarType.fixed,
//             items: <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Image.asset(
//                   'assets/icons/ic_paint_dish.webp',
//                   width: 60,
//                   height: 60,
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Image.asset(
//                   'assets/icons/ic_eraser.webp',
//                   width: 60,
//                   height: 60,
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Image.asset(
//                   'assets/icons/ic_save.webp',
//                   height: 60,
//                   width: 60,
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Image.asset(
//                   'assets/icons/ic_images.webp',
//                   height: 60,
//                   width: 60,
//                 ),
//                 label: '',
//               ),
//             ],
//             // selectedItemColor: Colors.amber[800],
//             onTap: (index) {
//               if (index == 0) {
//                 // print('first item clicked');
//                 setState(() {
//                   isselected = true;
//                 });
//               } else if (index == 1) {
//                 print('second item clicked');
//               } else if (index == 2) {
//                 print('third item clicked');
//               } else if (index == 3) {
//                 print('fourth item clicked');
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RoundedButton extends StatefulWidget {
//   final Color color;
//   final Function()? onpress;

//   RoundedButton({required this.color, this.onpress});

//   @override
//   State<RoundedButton> createState() => _RoundedButtonState();
// }

// class _RoundedButtonState extends State<RoundedButton> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => setState(() {
//         isselected = false;
//         selectedColor = widget.color;
//       }),
//       child: Container(
//         width: 30,
//         height: 30,
//         margin: EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white, width: 2),
//           shape: BoxShape.circle,
//           color: widget.color,
//         ),
//       ),
//     );
//   }
// }

// // class ImageList extends StatelessWidget {
// //   const ImageList({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GridView.count(
// //       crossAxisCount: 10, // Number of columns
// //       crossAxisSpacing: 5.0, // Spacing between columns
// //       mainAxisSpacing: 5.0, // Spacing between rows
// //       children: List.generate(20, (index) {
// //         // Use 'index + 1' to get image numbers from 1 to 20
// //         return Images(
// //           index: index + 1,
// //         );
// //         //   Column(children: [
// //         //   Row(
// //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         //     children: [
// //         //       Images(index: 3,),
// //         //
// //         //     ],
// //         //   ),
// //         // ],);
// //       }),
// //     );
// //   }
// // }

// // class Images extends StatelessWidget {
// //   Images({required this.index});
// //   final int index;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: Image.asset(
// //         'assets/item/$index.webp',
// //         height: 30,
// //         width: 30,
// //       ),
// //     );
// //   }
// // }

class Drawing extends StatefulWidget {
  const Drawing({super.key});

  @override
  State<Drawing> createState() => _DrawingState();
}

class _DrawingState extends State<Drawing> {
  List<DrawingArea> points = [];
  late Color selectedColor;
  late double strokeWidth;

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black;
    strokeWidth = 2.0;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;
    void selectColor() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Color Chooser'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                setState(() {
                  selectedColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"))
          ],
        ),
      );
    }

    return Scaffold(
      appBar:
          Appbar(title: 'Kids drawing', onpress: () => Navigator.pop(context)),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      width: width,
                      child: GestureDetector(
                        onPanDown: (details) {
                          setState(() {
                            points.add(DrawingArea(
                                point: details.localPosition,
                                areaPaint: Paint()
                                  ..strokeCap = StrokeCap.round
                                  ..isAntiAlias = true
                                  ..color = selectedColor
                                  ..strokeWidth = strokeWidth));
                          });
                        },
                        onPanUpdate: (details) {
                          setState(() {
                            points.add(DrawingArea(
                                point: details.localPosition,
                                areaPaint: Paint()
                                  ..strokeCap = StrokeCap.round
                                  ..isAntiAlias = true
                                  ..color = selectedColor
                                  ..strokeWidth = strokeWidth));
                          });
                        },
                        onPanEnd: (details) {
                          setState(() {
                            // points.add();
                          });
                        },
                        child: SizedBox.expand(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: CustomPaint(
                              painter: MyCustomPainter(points: points),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    color: Colors.amber,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Image.asset(
                              'assets/icons/ic_paint_dish.webp',
                              width: 50,
                              height: 50,
                            ),
                            onPressed: () {
                              selectColor();
                            }),
                        Expanded(
                          child: Slider(
                            min: 1.0,
                            max: 5.0,
                            label: "Stroke $strokeWidth",
                            activeColor: selectedColor,
                            value: strokeWidth,
                            onChanged: (double value) {
                              setState(() {
                                strokeWidth = value;
                              });
                            },
                          ),
                        ),
                        IconButton(
                            icon: Image.asset(
                              'assets/icons/ic_eraser.webp',
                              width: 50,
                              height: 50,
                            ),
                            onPressed: () {
                              setState(() {
                                points.clear();
                              });
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawingArea {
  Offset? point;
  Paint? areaPaint;

  DrawingArea({this.point, this.areaPaint});
}

class MyCustomPainter extends CustomPainter {
  List<DrawingArea>? points;

  MyCustomPainter({@required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);
    canvas.clipRect(rect);

    for (int x = 0; x < points!.length - 1; x++) {
      if (points![x] != null && points![x + 1] != null) {
        canvas.drawLine(
            points![x].point!, points![x + 1].point!, points![x].areaPaint!);
      } else if (points![x] != null && points![x + 1] == null) {
        canvas.drawPoints(
            PointMode.points, [points![x].point!], points![x].areaPaint!);
      }
    }
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    // return oldDelegate.points != points;
    return true;
  }
}
