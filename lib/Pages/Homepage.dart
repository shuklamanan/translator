import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _translatestring = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'T R A N S L A T E',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        )),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 310,
                  child: TextField(
                    controller: _translatestring,
                    decoration: InputDecoration(
                      label: const Text(
                        'E N T E R    T E X T',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mic),
                  iconSize: 40,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Stack(
              children: [
                Positioned(
                  child: Container(
                    width: 340,
                    height: 230,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.purple,
                          Color.fromARGB(255, 2, 36, 255),
                          Colors.lightBlue,
                          Colors.orange,
                          // Colors.red,
                          // Colors.yellow,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    width: 330,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          'Hi, Translated Text',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 85,
                  bottom: 5,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 13, 255, 0),
                        // color: Color.fromARGB(255, 18, 248, 233),
                      ),
                      child: const Icon(
                        Icons.copy_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 205,
                  bottom: 5,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 13, 255, 0),
                      ),
                      child: const Icon(
                        Icons.share,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 20,
                    width: 340,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
