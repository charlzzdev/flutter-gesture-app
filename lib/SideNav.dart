import 'package:flutter/material.dart';

class SideNav extends StatefulWidget {
      final String colorState;
      final ValueChanged<void> setColorState;
      
      SideNav({
            Key key,
            this.colorState,
            this.setColorState,
      }) : super(key: key);

      @override
      _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
      TextStyle drawerSubtitle = new TextStyle(fontWeight: FontWeight.w600);

      @override
      Widget build(BuildContext context) {
            return Drawer(
                  child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                              DrawerHeader(
                                    child: null,
                                    decoration: BoxDecoration(
                                          image: DecorationImage(
                                                image: NetworkImage('https://media.giphy.com/media/nNxT5qXR02FOM/giphy.gif'),
                                                fit: BoxFit.cover
                                          )
                                    ),
                              ),
                              ListTile(
                                    leading: Icon(Icons.home),
                                    title: Text('Home'),
                                    onTap: () => Navigator.pop(context),
                              ),
                              ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('Customize'),
                                    onTap: () => Navigator.pop(context),
                              ),
                              Divider(),
                              Padding(child: Text('Quick Access', style: drawerSubtitle), padding: EdgeInsets.only(left: 20.0, top: 10.0)),
                              Padding(
                                    child: Row(
                                          children: [
                                                Padding(child: Icon(Icons.color_lens), padding: EdgeInsets.only(right: 10.0),),
                                                DropdownButton(
                                                      value: widget.colorState,
                                                      items: ['Blue-Purple', 'Green-Yellow', 'Red-Orange'].map((String value) {
                                                            return new DropdownMenuItem(value: value, child: new Text(value));
                                                      }).toList(),
                                                      onChanged: (value) => setState(() => widget.setColorState(value)),
                                                )
                                          ]
                                    ),
                                    padding: EdgeInsets.all(20.0)
                              ),
                        ],
                  ),
            );
      }
}