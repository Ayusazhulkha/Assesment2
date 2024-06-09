import 'package:flutter/material.dart';
import 'package:living_in_h2f/login.dart';
import 'package:living_in_h2f/personalinformation_kost.dart';

class KelolaKostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan tombol kembali
        backgroundColor: const Color(0xFF27374E), // Warna AppBar
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF27374E), // Warna latar belakang bagian atas
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              children: [
                // Bagian Profil Kost
                Row(
                  children: [
                    // Foto Profil Kost
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/logo_living2hf.png'), // Ganti dengan foto profil kost
                    ),
                    SizedBox(width: 20),
                    // Nama dan Lokasi Kost
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pondokan H2F', // Ganti dengan nama kost
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Warna teks
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Lengkong, Kec. Bojongsoang', // Ganti dengan lokasi kost
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70, // Warna teks
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white, // Warna latar belakang bagian bawah
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: const Text(
                      'Admin Settings',
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
                                    builder: (context) => PersonalInformationKostPage()));
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                          child: const Text(
                            'Manage',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.add, color: Color(0xFF27374E)),
                          title: const Text('Add Room'),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF27374E)),
                          onTap: () {
                            // Navigasi ke halaman Add Room
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.edit, color: Color(0xFF27374E)),
                          title: const Text('Manage Room'),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF27374E)),
                          onTap: () {
                            // Navigasi ke halaman Manage Room
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
                      title: const Text('Konfirmasi Logout'),
                      content: const Text('Apakah yakin keluar dari akun?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Tutup dialog
                          },
                          child: const Text('Tidak'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Logika logout di sini
                            Navigator.of(context).pop(); // Tutup dialog
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text('Ya'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF27374E), // Warna tombol
                foregroundColor: Colors.white, // Warna teks
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10), // Padding yang dikurangi
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: KelolaKostPage(),
));
