import 'package:flutter/material.dart';

class MyTextField2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTextField2State();
}

class _MyTextField2State extends State<MyTextField2> {
  final _textController = TextEditingController();
  String _inputText = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("LUK"),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),

              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "Nhap Thong Tin",
                  hintText: "Thong Tin Cua Ban",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _inputText = value;
                  });
                },
              ),
              SizedBox(height: 30),
              Text("Ban da nhap: $_inputText"),
            ],
          ),
        ),
      ),
    );
  }
}
