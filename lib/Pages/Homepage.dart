import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/constants/constants.dart';
import 'package:translator/service/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _translatestring = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String dropdefaultvalue1 = "English";
  String dropdefaultvalue2 = "Gujarati";
  late Future<String> output;
  String temp = "";
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
                    child: Form(
                      key: _formkey,
                      child: TextFormField(
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Fill';
                          }
                          return null;
                        },
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
                onTap: () {
                  if (_translatestring.text.trim() == '' ||
                      !_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: const Color.fromARGB(255, 1, 175, 244),
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        elevation: 20,
                        content: const Text(
                          'Please enter valid Texts',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                    _translatestring.text = '';
                  } else {
                    output = translate(_translatestring.text, dropdefaultvalue1,
                        dropdefaultvalue2);
                    print("------------------------");
                    print(output);
                  }
                },
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          //   child: translate(_translatestring.text, dropdefaultvalue1,
                          // dropdefaultvalue2);,
                          child: FutureBuilder<String>(
                            future: translate(_translatestring.text,
                                dropdefaultvalue1, dropdefaultvalue2),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                temp = snapshot.data.toString();
                                // output = snapshot.data.toString();
                                print(snapshot);
                                return Text(
                                  snapshot.data.toString(),
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.black),
                                );
                              }
                              return const Text("hi");
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 85,
                    bottom: 5,
                    child: GestureDetector(
                      onTap: () {
                        if (temp.trim().isNotEmpty) {
                          print("copied");
                          Clipboard.setData(
                              new ClipboardData(text: temp.trim()));
                        }
                      },
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
