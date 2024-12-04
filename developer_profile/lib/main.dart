import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var jsonData;
  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Profile Layout')),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xffFDCF09),
                    child: CircleAvatar(
                      radius: 52,
                      backgroundImage: AssetImage('assets/winona.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text('Gerald Calotes',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),
              const Center(
                child: Text('Mobile Developer',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w200)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.github,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Link to Github Profile');
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Link to Facebook');
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.youtube,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Link to youtube channel');
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.linkedin,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Link to Linkedin Profile');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text('About Me:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.925)),
                ),
                padding: const EdgeInsets.all(12),
                child: Text(
                  jsonData['about'],
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.925)),
                    ),
                    padding: const EdgeInsets.all(12),
                    height: 170,
                    child: Column(
                      children: [
                        const Text(
                          'Skills',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(
                          jsonData['skills'].length,
                          (index) => Text(
                            '- ${jsonData['skills'][index]}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 170,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.925)),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: ListView(
                      children: [
                        const Text('Projects',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        ...List.generate(
                          jsonData['projects'].length,
                          (index) => Text(
                            '- ${jsonData['projects'][index]}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.925)),
                ),
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: 400,
                  child: Column(
                    children: [
                      const Text('Hobbies:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: jsonData != null
                            ? List<Widget>.from(jsonData['hobbies']
                                .map((hobby) => Text('- $hobby')))
                            : [const Text('Loading...')],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
