import "package:flutter/material.dart";

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

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
            onPressed: (){print("b1");
          },
          icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: (){print("b2");
            },
            icon: Icon(Icons.abc),
          ),
          IconButton(
            onPressed: (){print("b3");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      backgroundColor: Colors.pink.shade100,
      body: Center(child: Text("Noi dung chinh"),),
      
      floatingActionButton: FloatingActionButton(
          onPressed: (){print("pressed");},
          child: const Icon(Icons.add_ic_call),
          ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Trang Chủ"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "Tìm Kiếm"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Cá Nhân"),
      ]),
    );
  }
}