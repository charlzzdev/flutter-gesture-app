import 'package:flutter/material.dart';
import './SideNav.dart';
import './HorizontalPixels.dart';

void main() => runApp(GestureApp());

class GestureApp extends StatelessWidget{
      @override

      Widget build(BuildContext context){
            TextStyle customTextStyle = TextStyle(
                  color: Colors.grey[850],
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300,
            );
            return MaterialApp(
                  title: 'Gesture App',
                  home: Scaffold(
                        appBar: AppBar(
                              title: RichText(
                                    text: TextSpan(
                                          style: customTextStyle,
                                          children: [
                                                TextSpan(text: 'Lorem'),
                                                TextSpan(text: 'Ipsum', style: TextStyle(fontWeight: FontWeight.w900)),
                                          ]
                                    ),
                              ),
                              centerTitle: true,
                              leading: Builder(builder: (context) => IconButton(
                                    icon: new Icon(Icons.menu),
                                    onPressed: () => Scaffold.of(context).openDrawer(),
                                    tooltip: 'Press to open the menu'
                              )),
                        ),
                        drawer: SideNav(),
                        body: Center(
                              child: GetHorizontalPixels(),
                        ),
                  ),
            );
      }
}