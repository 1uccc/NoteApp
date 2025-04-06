import "package:flutter/material.dart";

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

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
              print("b3");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      backgroundColor: Colors.pink.shade50,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: "Ho va Ten",
                  hintText: "Nhap ho va ten",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.clear),
                ),
              ),


              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Exmple@gmail.com",
                  helperText: "Nhap email ca nhan vao",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.clear),
                  fillColor: Colors.lightGreen,
                  filled: true,
                ),
                keyboardType: TextInputType.emailAddress,
              ),


              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "So Dien Thoai",
                  hintText: "0123456789",
                  helperText: "Nhap so dien thoai ca nhan vao",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.call),
                ),
                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Ngay Sinh",
                  hintText: "01/01/2001",
                  helperText: "Nhap ngay sinh ca nhan vao",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.date_range),
                ),
                keyboardType: TextInputType.datetime,
              ),

              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Mật Khẩu",
                  hintText: "Nhập mật khẩu của bạn",
                  helperText: "Mật khẩu nên có ít nhất 8 ký tự",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                obscuringCharacter: "*",
              ),

              SizedBox(height: 30),
              TextField(
                onChanged: (Value){
                  print("Dang Nhap: $Value");
                },
                onSubmitted: ((Value){
                  print("Da nhap xong: $Value");
                }),
                decoration: InputDecoration(
                  labelText: "Cau Hoi Bi Mat",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
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
