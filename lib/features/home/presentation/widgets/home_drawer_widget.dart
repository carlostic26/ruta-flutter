import 'package:flutter/material.dart';
import 'package:ruta_flutter/core/app_config.dart';
import 'package:ruta_flutter/features/progress/presentation/screens/progres_score_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatelessWidget {
  final BuildContext? context;
  HomeDrawer({super.key, required this.context});

  final AppConfig infoApp = AppConfig();

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF2962FF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/logo.jpg',
                  height: heightScreen * 0.08,
                  width: widthScreen * 0.18,
                ),
                const SizedBox(height: 2),
                Text(
                  infoApp.nameApp,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  infoApp.versionApp,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Módulos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.emoji_events),
            title: const Text('Mis puntajes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProgressScoreWidget()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.volunteer_activism),
            title: const Text('Apoya la app'),
            onTap: () {
              // Navegar a otra pantalla
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist_rtl),
            title: const Text('Examen Flutter Jr'),
            onTap: () {
              // Navegar a otra pantalla
            },
          ),
          //TODO: segun el caso de uso que determine cuando el usuario haya terminado el modulo jr, se habilita el modulo mid
          ListTile(
            leading: const Icon(Icons.checklist_rtl),
            title: const Text('Examen Flutter Mid'),
            onTap: () {
              // Navegar a otra pantalla
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist_rtl),
            title: const Text('Examen Flutter Sr'),
            onTap: () {
              // Navegar a otra pantalla
            },
          ),
          SizedBox(
            height: heightScreen * 0.02,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Información',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.psychology_alt),
            title: const Text('Usabilidad'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Info de la app'),
            onTap: () {
              dialogVersion(context, 'Información',
                  '${infoApp.nameApp} es una app desarrollada por TICnoticos para mostrar y evidenciar datos interesantes sobre el amplio mundo de la informática y la Programación. \n\nVersión: ${infoApp.versionApp}');
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Política de Privacidad'),
            onTap: () {
              _launchUrlPolicyPrivacy();
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> dialogVersion(BuildContext context, title, description) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.black87,
          title: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
                  child: Text(textAlign: TextAlign.center, description),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.black12),
                      ),
                      child: const Text(
                        'Ok',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _launchUrlPolicyPrivacy() async {
    final Uri url = Uri.parse(
        'https://www.privacypolicies.com/live/4417a2dc-ecb0-4001-98eb-87e74ecb3e23');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'No se pudo lanzar la URL $url';
    }
  }
}
