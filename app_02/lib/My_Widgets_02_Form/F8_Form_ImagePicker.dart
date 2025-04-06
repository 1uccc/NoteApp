import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FormBasicDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final List<String> _cities = ['Hà Nội', 'Hồ Chí Minh', 'Đà Nẵng'];
  final _dateOfBirthdayController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  DateTime? _dateOfBirth;
  String? _gender;
  String? _selectedCity;
  String? _name;
  bool _obscurePassword = true;
  bool _isAgree = false;
  File? _profileImage;

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),

                FormField<File>(
                  validator: (value) {
                    if (value == null) {
                      return 'Vui lòng chọn ảnh đại diện';
                    }
                    return null;
                  },
                  builder: (FormFieldState<File> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ảnh đại diện',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              final XFile? image = await showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      title: Text('Chọn nguồn'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.photo_library),
                                            title: Text('Thư viện'),
                                            onTap: () async {
                                              Navigator.pop(
                                                context,
                                                await _picker.pickImage(
                                                  source: ImageSource.gallery,
                                                ),
                                              );
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.camera_alt),
                                            title: Text('Máy ảnh'),
                                            onTap: () async {
                                              Navigator.pop(
                                                context,
                                                await _picker.pickImage(
                                                  source: ImageSource.camera,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                              );

                              if (image != null) {
                                setState(() {
                                  _profileImage = File(image.path);
                                  state.didChange(_profileImage);
                                });
                              }
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color:
                                      state.hasError
                                          ? Colors.red
                                          : Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                              child:
                                  _profileImage != null
                                      ? ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: Image.file(
                                          _profileImage!,
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                      : Icon(
                                        Icons.add_a_photo,
                                        size: 40,
                                        color: Colors.grey.shade400,
                                      ),
                            ),
                          ),
                        ),
                        if (state.hasError)
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                state.errorText!,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                SizedBox(height: 20),
                Text(
                  "Thông tin cá nhân",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),
                TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                    labelText: "Ho va Ten",
                    hintText: "Nhap ho va ten",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSaved: (value) {
                    _name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui long nhap ho va ten";
                    }
                    return null;
                  },
                ),
                Text("Gioi Tinh"),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _gender = 'Nam';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _gender == 'Nam' ? Colors.blue : Colors.grey,
                      ),
                      child: Text('Nam'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _gender = 'Nữ';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _gender == 'Nữ' ? Colors.pink : Colors.grey,
                      ),
                      child: Text('Nữ'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _gender = 'Khác';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _gender == 'Khác' ? Colors.purple : Colors.grey,
                      ),
                      child: Text('Khác'),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                TextFormField(
                  controller: _dateOfBirthdayController,
                  decoration: InputDecoration(
                    labelText: "Ngày Sinh",
                    hintText: "DD/MM/YYYY",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2025),
                    );
                    if (pickedDate != null) {
                      String formattedDate = DateFormat(
                        'dd/MM/yyyy',
                      ).format(pickedDate);
                      setState(() {
                        _dateOfBirthdayController.text = formattedDate;
                        _dateOfBirth = pickedDate;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng chọn ngày sinh';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Exmple@gmail.com",
                    helperText: "Nhap email ca nhan vao",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui long nhap email";
                    }
                    if (!value.contains("@")) {
                      return "Email khong hop le";
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return "Email khong hop le";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _numberController,
                  decoration: InputDecoration(
                    labelText: "So Dien Thoai",
                    hintText: "0123456789",
                    helperText: "Nhap so dien thoai ca nhan vao",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui long nhap so dien thoai";
                    }
                    if (value.length != 10) {
                      return "So dien thoai khong hop le";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Mật Khẩu",
                    hintText: "Nhập mật khẩu của bạn",
                    helperText: "Mật khẩu nên có ít nhất 8 ký tự",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu';
                    }
                    if (value.length < 6) {
                      return 'Mật khẩu phải có ít nhất 6 ký tự';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Xác nhận mật khẩu
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Xác nhận mật khẩu',
                    hintText: 'Nhập lại mật khẩu của bạn',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng xác nhận mật khẩu';
                    }
                    if (value != _passwordController.text) {
                      return 'Mật khẩu không khớp';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Thành phố",
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedCity,
                  items:
                      _cities.map((city) {
                        return DropdownMenuItem(child: Text(city), value: city);
                      }).toList(),
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng chọn thành phố';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),
                CheckboxListTile(
                  title: Text(
                    "Tôi đồng ý với điều khoản và chính sách bảo mật",
                  ),
                  value: _isAgree,
                  onChanged: (value) {
                    setState(() {
                      _isAgree = value!;
                      print("Dong Y : $_isAgree");
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text("Hi $_name")));
                        }
                      },
                      child: Text("Submit"),
                    ),
                    SizedBox(width: 200),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        setState(() {
                          _name = null;
                          _gender = null;
                          _dateOfBirthdayController.text = "";
                          _selectedCity = null;
                          _isAgree = false;
                        });
                      },
                      child: Text("Reset"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
