import 'package:flutter/material.dart';

class GetHorizontalPixels extends StatefulWidget{
      @override
      _HorizontalPixelState createState() => _HorizontalPixelState();
}

class _HorizontalPixelState extends State<GetHorizontalPixels>{
      double horizontalPixels = 0.0;
      double verticalPixels = 0.0;
      bool circle = true;

      @override
      Widget build(BuildContext context){
            return GestureDetector(
                  onHorizontalDragUpdate: (update) => setState(() => horizontalPixels = update.globalPosition.dx),
                  onVerticalDragUpdate: (update) => setState(() => verticalPixels = update.globalPosition.dy),
                  onDoubleTap: () => setState(() => horizontalPixels = 0),
                  onLongPress: () => setState(() => circle = !circle),
                  child: Transform(
                        child: Container(
                              child: Center(
                                    child: Text('$horizontalPixels px'),
                              ),
                              decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                          begin: Alignment(0.0, -1.0),
                                          end: Alignment(horizontalPixels * 0.005, 0.6),
                                          colors: [
                                                Color.fromRGBO(66, 86, 244, 0.9),
                                                Color.fromRGBO(229, 66, 244, 0.9),
                                          ],
                                    ),
                                    boxShadow: [
                                          BoxShadow(
                                                blurRadius: 3,
                                                offset: Offset(0, 0.5),
                                          )
                                    ],
                                    shape: circle ? BoxShape.circle : BoxShape.rectangle,
                                    borderRadius: circle ? null : BorderRadius.all(Radius.circular(verticalPixels * 0.2)),
                              ),
                              width: 300,
                              height: 400,
                        ),
                        transform: Matrix4.identity()..rotateZ(-horizontalPixels * 0.005 * 3.14 / 180),
                        alignment: FractionalOffset.center,
                  ),
            );
      }
}