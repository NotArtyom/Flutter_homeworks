import 'package:flut_homework/hw2/message_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

const MY_NAME = "Artem I";

class HW2 extends StatefulWidget {
  const HW2({Key? key}) : super(key: key);

  final String title = "Homework 2";

  @override
  _HW2State createState() => _HW2State();
}

class _HW2State extends State<HW2> {
  final MessageStore _messageStore = Modular.get<MessageStore>();

  @override
  void initState() {
    super.initState();
    _messageStore.fetchNewMessage();
  }


  final TextEditingController _textEditingController = TextEditingController();

  void _addToList(String text) {
    if (text.isNotEmpty) {
      _messageStore.sendMessage(text);
    }
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _messageStore.fetchNewMessage();
              },
              icon: Icon(CupertinoIcons.arrow_counterclockwise))
        ],
        title: new Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Observer(builder: (context) {
                    return ListView(
                        children: _messageStore.messages.map((item) {
                      return Container(
                        margin: const EdgeInsets.only(
                            top: 5.0, bottom: 5.0, right: 15.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: item.author == MY_NAME ? MainAxisAlignment.end : MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: item.author == MY_NAME
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.author,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(item.message,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black54)),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList());
                  }),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                      ),
                    ),
                    GestureDetector(
                      child: Icon(Icons.add),
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
