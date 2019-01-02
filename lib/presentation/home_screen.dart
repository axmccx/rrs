import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final int priority;

  HomeScreen(this.priority);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            DrawerHeader(
              child: new Text("DRAWER HEADER.."),
              decoration: new BoxDecoration(
                color: Colors.orange
              ),
            ),
            RaisedButton(
              child: new Text('New project'),
              onPressed: () {},
            )
          ],
        )
      ),
      appBar: AppBar(
        title: Text("Tasks"),
      ),
      body: Container(
        child: Text(
          "The current priority is: $priority",
          style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}