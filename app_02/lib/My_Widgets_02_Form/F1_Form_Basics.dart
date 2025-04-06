import 'package:flutter/material.dart';

class FormBasicDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  final _formKey = GlobalKey<FormState>();
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LUK"),
        backgroundColor: Colors.lightGreen,
        elevation: 4,
      ),

      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Ho va Ten",
                        hintText: "Nhap ho va ten",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onSaved: (value){_name = value;},
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        ElevatedButton(onPressed: (){
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Hi $_name")));
                          }
                        },child: Text("Submit"),),
                        SizedBox(width: 200),
                        ElevatedButton(onPressed: (){
                          _formKey.currentState!.reset();
                          setState(() {
                            _name = null;
                          });
                        }, child: Text("Reset"))

                      ],
                    )
                  ],
              )
          )
      ),
    );
  }
}
