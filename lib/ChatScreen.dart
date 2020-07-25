import 'package:chat_app/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textController = new TextEditingController();
   final List<ChatMessage> _message =<ChatMessage>[];



  void _handleSubmitted(String text){
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _message.insert(0, message);
    });
    _textController.clear();
  }

  Widget _textComposerWidget(){
    return IconTheme(
      data: new IconThemeData(
        color: Colors.greenAccent
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8.0
        ),
        child: new Row(
          children: <Widget>[
            new Flexible(child: new TextField(
              decoration: new InputDecoration.collapsed(hintText: "Send a Message"),
              controller: _textController,
              onSubmitted: _handleSubmitted,
            ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send), onPressed: () => _handleSubmitted(_textController.text),
            )
            )],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(6.0),
              reverse: true,
              itemBuilder: (_,int index) =>_message[index],
              itemCount: _message.length,
            )),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
