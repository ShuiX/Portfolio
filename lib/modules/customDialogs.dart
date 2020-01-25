import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({Key key, this.title, this.content, this.dialogType})
      : super(key: key);

  final String title;
  final String content;
  final String dialogType;

  dynamic _dialogChooser(BuildContext context) {
    switch (this.dialogType) {
      case 'simple':
        return simpleDialog(context);
        break;
      case 'little':
        return littleDialog(context);
        break;
      case 'redAlert':
        return redAlertDialog(context);
        break;
      case 'blueAlert':
        return blueAlertDialog(context);
        break;
      default:
        return simpleDialog(context);
        break;
    }
  }

  simpleDialog(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        heightFactor: 0.9,
        widthFactor: 0.9,
        child: Card(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  redAlertDialog(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: Card(
          color: Colors.red,
          child: Center(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Icon(
                    Icons.warning,
                    size: 70,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    content,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  blueAlertDialog(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: Card(
          color: Colors.blue,
          child: Center(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Icon(
                    Icons.sentiment_dissatisfied,
                    size: 70,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    content,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  littleDialog(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        child: Card(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      content,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  FlutterLogo(
                    size: 200,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Powered by Flutter',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          highlightElevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          color: Colors.transparent,
          elevation: 0,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(top: 12),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color,
                ),
                iconSize: 50,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
        _dialogChooser(context),
      ],
    );
  }
}
