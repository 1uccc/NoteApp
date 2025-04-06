import "package:flutter/material.dart";

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

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
          child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.teal.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]
          ),
          child: Align(
            alignment: Alignment.center,
            child: const Text(
              "Nguyen Dinh Luc",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
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
