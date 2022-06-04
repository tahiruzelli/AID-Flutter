import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Views/LiveSupportPage/Widgets/my_message_row.dart';
import 'package:AID/Views/LiveSupportPage/Widgets/receiver_message_row.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class MessageDetailPage extends StatefulWidget {
  late String userId;
  MessageDetailPage(this.userId);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessageDetailPage> {
  late DatabaseReference messagesRef;
  late DatabaseReference ref = FirebaseDatabase.instance.ref();
  List messageList = [];
  List list = [];
  String roomID = "fakeID";

  @override
  void initState() {
    super.initState();
  }

  TextEditingController textEditingController = TextEditingController();

  void _toggleSendChannelMessage(String text) async {
    String text = textEditingController.text;
    if (text.isEmpty) {
      return;
    }
    try {
      DateTime now = DateTime.now();
      messagesRef.child(roomID).push().set({
        'message': textEditingController.text,
        'sender_date': now.toString().split('.')[0],
        'sender_nickname': "fake name",
        'sender_id': widget.userId,
      });
      textEditingController.clear();
    } catch (errorCode) {
      print(errorCode);
    }
  }

  Widget _messageList() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 1,
        child: SizedBox(
          child: ListView.builder(
            reverse: true,
            itemCount: messageList.length,
            itemBuilder: (BuildContext context, int index) {
              if (messageList.isEmpty) {
                return Container();
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: messageList[index]['sender_id'] == widget.userId
                      ? MyMessageRow(messageList[index])
                      : ReceiverMessageRow(messageList[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    messagesRef = FirebaseDatabase.instance.ref();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorPurple,
        title: const Text("Canlı Destek"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          )
        ],
      ),
      backgroundColor: colorScaffoldColor,
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height * 0.9,
        width: Get.width,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: StreamBuilder(
                  stream: ref.child(roomID).onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData) {
                      list.clear();
                      messageList.clear();
                      list.add(snapshot.requireData.snapshot);
                      if (list[0].value != null) {
                        Map<dynamic, dynamic> values = list[0].value;
                        values.forEach((key, values) {
                          messageList.add(values);
                        });

                        messageList.sort((a, b) =>
                            b['sender_date'].compareTo(a['sender_date']));
                      } else {
                        messageList = [];
                      }
                      return _messageList();
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
            _textFieldBox(),
          ],
        ),
      ),
    );
  }

  Widget _textFieldBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: colorPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                cursorHeight: 14,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: colorPurple, width: 1),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _toggleSendChannelMessage(textEditingController.text);
              },
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
