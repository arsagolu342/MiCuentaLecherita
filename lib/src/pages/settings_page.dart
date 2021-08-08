import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_cuenta_lecherita/src/providers/app_providers.dart';
import 'package:tu_cuenta_lecherita/src/utils/app_shared_preferences.dart'; 

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? darkModePrefs ;

  @override
  void initState() {
    super.initState();
    _loadDarkModePrefs();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          darkModePrefs == null
              ? Container()
              : Card(
                  elevation: 5.0,
                  child: ListTile(
                    title: Text("Modo oscuro",
                        style: Theme.of(context).textTheme.bodyText1),
                    subtitle: Text(
                        "Al activar el modo oscuro el tradicional fondo blanco se reemplaza por una interfaz de color oscuro, que varía entre negro y gris.",
                        style: Theme.of(context).textTheme.caption),
                    leading: Checkbox(
                        value: darkModePrefs,
                        onChanged: (value) {
                          appProvider.darkMode = value ?? false;
                          setDarkMode(value ?? false);
                          if (value == true) {
                            print("Modo oscuro activado");
                          } else {
                            print("Modo oscuro desactivado");
                          }
                          Navigator.pop(context);
                        }),
                  ),
                )
        ],
      ),
    );
  }

  _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {});
  }
}