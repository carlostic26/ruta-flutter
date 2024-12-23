import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailTopicScreen extends StatefulWidget {
  const DetailTopicScreen({super.key});

  @override
  State<DetailTopicScreen> createState() => _DetailTopicScreenState();
}

class _DetailTopicScreenState extends State<DetailTopicScreen> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 64, 64),
      appBar: AppBar(
        title: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.import_contacts,
                    size: 15,
                  ),
                ),
                Text(
                  'Definición',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(Icons.import_contacts, size: 15),
                    ),
                    Text(
                      'Code',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ))
              ],
            ),

            //line state
            Row(
              children: [
                Container(
                  height: 10,
                  color: Colors.white,
                ),
                Container(
                  height: 10,
                  color: Colors.black,
                )
              ],
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 64, 64, 64),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: heightScreen * 0.05,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SizedBox(
              height: 350,
              child: Placeholder(),
            ),
          )
        ],
      ),
    );
  }
}
