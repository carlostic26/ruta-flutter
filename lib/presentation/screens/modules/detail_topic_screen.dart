import 'package:flutter/material.dart';

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
      body: Stack(children: [
        Column(
          children: [
            SizedBox(height: heightScreen * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: widthScreen * 0.15,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.import_contacts,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Definición',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                    const Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.import_contacts,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Code',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ],
                    ))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: widthScreen * 0.15,
                      ),
                      child: Container(
                        height: 3,
                        width: widthScreen * 0.35,
                        color: Colors.grey,
                      ),
                    ),

                    //if code section is touched:
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: widthScreen * 0.06),
                          child: Container(
                            height: 3,
                            width: widthScreen * 0.35,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: heightScreen * 0.03,
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(
              height: heightScreen * 0.03,
            ),
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
      ]),
    );
  }
}
