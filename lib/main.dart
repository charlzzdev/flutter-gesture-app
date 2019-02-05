import 'package:flutter/material.dart';
import './SideNav.dart';
import './HorizontalPixels.dart';

void main() => runApp(GestureApp());

class GestureApp extends StatefulWidget {
      @override
      _GestureAppState createState() => _GestureAppState();
}

class _GestureAppState extends State<GestureApp> {
      String colorState = 'Blue-Purple';

      void _setColorState(color){
            setState(() {
                  print('set color works ' + color);
                  colorState = color;
            });
      }

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
                                                TextSpan(text: colorState.split('-')[0]),
                                                TextSpan(text: colorState.split('-')[1], style: TextStyle(fontWeight: FontWeight.w900)),
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
                        drawer: SideNav(colorState: colorState, setColorState: _setColorState),
                        body: Center(
                              child: GetHorizontalPixels(colorState: colorState),
                        ),
                  ),
            );
      }
}