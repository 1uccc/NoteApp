import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  const MyButton({super.key});

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
            //ElevatedButton
            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: (){print("ElevatedButton");},
                child: Text("ElevateButton", style: TextStyle(fontSize: 24),)),
            //TextButton
            SizedBox(height: 20,),
            TextButton(
                onPressed: (){print("TextButton");},
                child: Text("TextButton",style: TextStyle(fontSize: 24),)),
            //OutlinedButton
            SizedBox(height: 20,),
            OutlinedButton(
                onPressed: (){print("OutlinedButton");},
                child: Text("OutlinedButton",style: TextStyle(fontSize: 24),)),
            //IconButton
            SizedBox(height: 20,),
            IconButton(
                onPressed: (){print("IconButton");},
                icon: Icon(Icons.favorite)),
            //FloatingActionButton
            SizedBox(height: 20,),
            FloatingActionButton(
                onPressed: (){print("FloatingActionButton");},
                child: Icon(Icons.add)),
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