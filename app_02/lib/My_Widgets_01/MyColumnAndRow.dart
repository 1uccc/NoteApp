import "package:flutter/material.dart";

class MyColumnAndRow extends StatelessWidget {
  const MyColumnAndRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Tieu de cua ung dung
      appBar: AppBar(
        title: Text("LUK"),
        backgroundColor: Colors.teal,
        // Do nang/ Do bong cua AppBar
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              print("b1");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("b2");
            },
            icon: Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {
              print("b3");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      backgroundColor: Colors.pink.shade50,
      body: Center(
          child: Column(
            children: [
            Row(
              children: [
                const SizedBox(height: 50,),
                const Icon(Icons.access_alarm_outlined),
                const Icon(Icons.ac_unit),
                const Icon(Icons.accessibility_new_rounded),
              ],
            ),
            Row(
              children: [
                Text("Text1............"),
                Text("Text2............"),
                Text("Text3............"),
                Text("Text4............"),
              ],
            )
            ],
          )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("pressed");
        },
        child: const Icon(Icons.add_ic_call),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang Chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm Kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá Nhân"),
        ],
      ),
    );
  }
}
