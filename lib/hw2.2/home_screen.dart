import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> homeworks = {
    "Homework #1": '/HW1/',
    "Homework #2": '/HW2/',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 500.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                child: ListView.builder(
                    itemCount: homeworks.keys.length,
                    itemBuilder: (BuildContext context, int index) {
                      final homeWork = homeworks.keys.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed(homeworks[homeWork]!);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 16.0, right: 16.0, left: 16.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                homeWork,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
