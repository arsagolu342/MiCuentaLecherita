import 'package:flutter/material.dart';
class Standard {
  static AppBar appBar(BuildContext context, String title) {
    return AppBar(title: Text(title));
  }

  static Widget titleToForm(BuildContext context, String title) {
    Color _color = Theme.of(context).cardColor;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14.0),
      child: Text(title,
          style: Theme.of(context).textTheme.headline6!.apply(color: _color)),
    );
  }

  static ButtonStyle buttonStandardStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
        elevation: 5.0,
        shadowColor: Theme.of(context).dividerColor,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20));
  }

 
  static Widget getBoard(BuildContext context, String message, IconData icon) {
    return Container(
      margin: EdgeInsets.all(14.0),
      child: Center(
        child: Card(
            margin: EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(icon, size: 100.0),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Text(message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                icon == Icons.download
                    ? Container(
                        margin: EdgeInsets.all(14.0),
                        height: 35.0,
                        width: 35.0,
                        child: CircularProgressIndicator(),
                      )
                    : Container()
              ],
            )),
      ),
    );
  }

 

  static Widget getInfoLine(
      BuildContext context, String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: Theme.of(context).textTheme.bodyText2),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.headline6),
    );
  }
}