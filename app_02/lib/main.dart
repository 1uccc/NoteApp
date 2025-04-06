import 'package:flutter/material.dart';
import 'My_Widgets_01/MyScaffold.dart';
import 'My_Widgets_01/MyAppBar.dart';
import 'My_Widgets_01/MyText.dart';
import 'My_Widgets_01/MyContainer.dart';
import 'My_Widgets_01/MyColumnAndRow.dart';
import 'My_Widgets_01/MyButton.dart';
import 'My_Widgets_01/MyButton_2.dart';
import 'My_Widgets_01/MyButton_3.dart';
import 'My_Widgets_01/MyGestures.dart';
import 'My_Widgets_01/MyTextField.dart';
import 'My_Widgets_01/MyTextField2.dart';
//import 'My_Widgets_02_Form/F2_Form_TextFormField_Validate.dart';
//import 'My_Widgets_02_Form/F3_Form_Dropdown.dart';
//import 'My_Widgets_02_Form/F4_Form_Selections.dart';
//import 'My_Widgets_02_Form/F5_Form_CheckBoxListTile.dart';
//import 'My_Widgets_02_Form/F6_Form_DatePicker.dart';
//import 'My_Widgets_02_Form/F7_Form_ScrollView.dart';
//import 'My_Widgets_02_Form/F8_Form_ImagePicker.dart';
//import 'UserMS/view/UserListScreen.dart';
//import 'NoteApp/view/NoteListScreen.dart';
import 'UserMS_API/view/UserListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: UserListScreen(),
    );
  }
}

