import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:tu_cuenta_lecherita/src/models/user_model.dart';
import 'package:tu_cuenta_lecherita/src/providers/app_providers.dart';
import 'package:tu_cuenta_lecherita/src/utils/user_shared_preferences.dart'; 

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late User user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    final prefs = new Preferences();
    final appProvider = Provider.of<AppProvider>(context, listen: true);

    return Scaffold(
      
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 5.0,
              child: ListTile(
                title: Text("Modo obscuro",
                    style: Theme.of(context).textTheme.bodyText1),
                subtitle: Text(
                    "El modo obscuro tiene un fondo opaco con un constrate de letras claro.",
                    style: Theme.of(context).textTheme.caption),
                leading: Checkbox(
                    value: appProvider.darkMode,
                    onChanged: (value) {
                      appProvider.darkMode = value ?? false;
                      prefs.mode = value ?? false;
                      setState(() {});
                      if (value == true) {
                        print("Modo nocturno activado");
                      } else {
                        print("Modo nocturno desactivado");
                      }
                    }),
              ),
            ),
            appProvider.token == ""
                ? Container()
                : Card(
                    elevation: 5.0,
                    child: ListTile(
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          prefs.token = "";
                          appProvider.token = "";
                          Navigator.pop(context);
                        },
                      ),
                      title: Text(user.name ?? "",
                          style: Theme.of(context).textTheme.bodyText1),
                      subtitle: Text(user.email ?? "",
                          style: Theme.of(context).textTheme.caption),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  _loadUser() async {
    final prefs = new Preferences();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(prefs.token);
    user = User.fromJson(decodedToken);
    setState(() {});
  }
}