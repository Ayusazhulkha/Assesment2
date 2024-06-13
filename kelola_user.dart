import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:living_in_h2f/homepage.dart';
import 'dart:io'; // Untuk mengakses file lokal
import 'package:living_in_h2f/login.dart';
import 'package:living_in_h2f/order_user.dart';
import 'package:living_in_h2f/passwordsecurity_user.dart';
import 'package:living_in_h2f/personalinformation_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Untuk JSON encoding dan decoding

class KelolaProfilPage extends StatefulWidget {
  @override
  _KelolaProfilPageState createState() => _KelolaProfilPageState();
}

class _KelolaProfilPageState extends State<KelolaProfilPage> {
  File? _image;
  String? full_name;
  String? email;

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data when the widget is initialized
  }

  Future<void> _fetchUserData() async {
    final response = await http.get(Uri.parse('http://10.60.43.221/api/read_user.php'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        full_name = data['full_name'] as String;
        email = data['email'] as String;
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<void> _updateUserData() async {
    String avatarPath = ""; // Inisialisasi path foto avatar

    if (_image != null) {
      // Jika ada foto yang diunggah, kirim foto ke server
      var uri = Uri.parse('10.60.43.221/api/update_user.php');
      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('avatar', _image!.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        // Jika berhasil mengunggah foto, dapatkan path dari respons server
        avatarPath = await response.stream.bytesToString();
      } else {
        throw Exception('Failed to upload image');
      }
    }

    // Kirim data pengguna (termasuk path foto) ke server
    final response = await http.put(
      Uri.parse('http://10.60.43.221/api/update_user.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'full_name': full_name!,
        'email': email!,
        'avatar': avatarPath, // Masukkan path foto ke dalam body request
      }),
    );

    if (response.statusCode == 200) {
      // Successfully updated user data
    } else {
      throw Exception('Failed to update user data');
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF27374E), // Warna AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              // Navigasi ke halaman home
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF27374E), // Warna latar belakang bagian atas
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Bagian Profil
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _image == null
                              ? const AssetImage('assets/fotoprofil.jpg')
                              : FileImage(_image!) as ImageProvider,
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'upload',
                            child: Text('Upload Foto'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete Foto'),
                          ),
                        ],
                        onSelected: (String value) {
                          if (value == 'upload') {
                            _pickImage();
                          } else if (value == 'delete') {
                            setState(() {
                              _image = null;
                            });
                          }
                        },
                      ),
                    ),
                    // Nama dan Email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          full_name ?? 'Dimas Rizky', // Ganti dengan nama pengguna
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Warna teks
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          email ?? 'dimas@gmail.com', // Ganti dengan email pengguna
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70, // Warna teks
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white, // Warna latar belakang bagian bawah
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey, // Warna border
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Account Settings',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  // ListView untuk Pengaturan
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person, color: Color(0xFF27374E)),
                          title: const Text('Personal Information'),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF27374E)),
                          onTap: () {
                            // Navigasi ke halaman Personal Information
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PersonalInformationUserPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.security, color: Color(0xFF27374E)),
                          title: const Text('Password & Security'),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF27374E)),
                          onTap: () {
                            // Navigasi ke halaman Password & Security
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PasswordSecurityPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.shopping_cart, color: Color(0xFF27374E)),
                          title: const Text('Order'),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF27374E)),
                          onTap: () {
                            // Navigasi ke halaman Order
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // Tombol Logout
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Tampilkan dialog konfirmasi logout
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.red[50], // Background color of the AlertDialog
                      title: const Text(
                        'Konfirmasi Logout',
                        style: TextStyle(color: Color.fromARGB(255, 255, 61, 47)), // Title color
                      ),
                      content: const Text(
                        'Apakah yakin keluar dari akun?',
                        style: TextStyle(color: Color.fromARGB(255, 255, 61, 47)), // Content color
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Tutup dialog
                          },
                          child: const Text(
                            'Tidak',
                            style: TextStyle(color: Color.fromARGB(255, 255, 61, 47)), // Button text color
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Logika logout di sini
                            Navigator.of(context).pop(); // Tutup dialog
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text(
                            'Ya',
                            style: TextStyle(color: Colors.red), // Button text color
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna tombol
                foregroundColor: Colors.white, // Warna teks
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10), // Padding yang dikurangi
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
