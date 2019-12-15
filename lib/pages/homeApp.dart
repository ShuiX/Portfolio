import 'package:flutter/material.dart';

class PortfolioApp extends StatefulWidget {
  PortfolioApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          heightFactor: 0.6,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text('Thats Me'),
              ),
              Card(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: '',
        child: Icon(Icons.add),
      ),
    );
  }
}
