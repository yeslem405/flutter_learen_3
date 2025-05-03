import 'package:flutter/material.dart';

class  Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("إشعارات")),
    body: Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [Icon(Icons.amp_stories_rounded),Text("لاتوجد إشعارات")],),),);
  }
}