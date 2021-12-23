import 'package:flutter/material.dart';

class HW1 extends StatefulWidget {
  HW1({Key? key}) : super(key: key);

  final String title = "Homework №1";

  @override
  _HW1State createState() => _HW1State();
}

class _HW1State extends State<HW1> {
  final List<String> _items = ['Hello'];

  final TextEditingController _textEditingController = TextEditingController();

  void _addToList(String text) {
    setState(() {
      if (text.isNotEmpty) {
        _items.add(text);
      }
    });
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Align(
                          alignment: (Alignment.topLeft),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.blue),
                            padding: EdgeInsets.all(13),
                            child: Text(
                              _items[index],
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                      ),
                    ),
                    GestureDetector(
                      child: const Icon(Icons.add),
                      onTap: () {
                        _addToList(_textEditingController.text);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
