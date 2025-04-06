import "package:flutter/material.dart";

class MyText extends StatelessWidget {
  const MyText({super.key});

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
      backgroundColor: Colors.pink.shade50,
      body: Center(child: Column(
        children: [
          const SizedBox(height: 50,),
          const Text("Nguyen Dinh Luc"),
          const SizedBox(height: 20,),

          const Text(
            "Xin chao!!!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 20,),
          const Text(
            "Toi dang hoc Flutter neee",
            textAlign: TextAlign.center,
            maxLines: 2,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              letterSpacing: 1.5,
            ),
          ),
        ]
      )),
      
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