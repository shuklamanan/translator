import 'package:flutter/material.dart';
import 'package:translator/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _translatestring = TextEditingController();
  String dropdefaultvalue1 = "English";
  String dropdefaultvalue2 = "Gujarati";
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
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
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 30,
                    child: Text(
                      'From:',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropdefaultvalue1,
                    elevation: 10,
                    dropdownColor: const Color.fromARGB(255, 1, 175, 244),
                    borderRadius: BorderRadius.circular(10),
                    items:
                        language.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        dropdefaultvalue1 = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 55,
                    height: 30,
                    child: Text(
                      'To:',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropdefaultvalue2,
                    elevation: 10,
                    dropdownColor: const Color.fromARGB(255, 1, 175, 244),
                    borderRadius: BorderRadius.circular(10),
                    items:
                        language.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        dropdefaultvalue2 = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: gradientcolor,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'T R A N S L A T E',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: 340,
                      height: 230,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: gradientcolor,
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
      ),
    );
  }
}
