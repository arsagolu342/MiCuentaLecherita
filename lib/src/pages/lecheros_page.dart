import 'package:flutter/material.dart';

class LecherosPage extends StatelessWidget {
  const LecherosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("images/j1.jpg"),
          Text("Josselyn", style: Theme.of(context).textTheme.headline3),
          Text("22 años", style: Theme.of(context).textTheme.headline5),
        ],
      ),
    );
  }
}
