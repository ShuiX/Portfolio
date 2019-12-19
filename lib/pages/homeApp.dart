import 'package:flutter/material.dart';

class PortfolioApp extends StatefulWidget {
  PortfolioApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  _desktopView(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Thats Me',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Eins",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text(
                        "Zwei",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text(
                        "Drei",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _mobileView(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Thats Me',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text("Sample Text"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 650) {
            return _mobileView(context);
          } else {
            return _desktopView(context);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: '',
        child: Icon(Icons.add),
      ),
    );
  }
}
