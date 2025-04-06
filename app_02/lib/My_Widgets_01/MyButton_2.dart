import "package:flutter/material.dart";

class MyButton_2 extends StatelessWidget {
  const MyButton_2({super.key});

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
            //ElevatedButton
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                print("ElevatedButton");
              },
              child: Text("ElevateButton", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.yellowAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 15,
              ),
            ),
            //FloatingActionButton
            SizedBox(height: 50),
            FloatingActionButton(
              onPressed: () {
                print("FloatingActionButton");
              },
              child: Icon(Icons.home),
              backgroundColor: Colors.pinkAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            //InWell
            SizedBox(height: 50),
            InkWell(
              onTap: (){
                print("InWell duoc nhan neee");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal),
                ),
                child: Text("Button tuy chinh InWell"),
              ),
            )
          ],
        ),
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
