import 'package:flutter/material.dart';

class ProfilKostPage extends StatefulWidget {
  @override
  _ProfilKostPageState createState() => _ProfilKostPageState();
}

class _ProfilKostPageState extends State<ProfilKostPage> {
  // Variabel untuk menentukan apakah menampilkan foto kamar atau fasilitas
  bool showRoomPhotos = false;

  // Daftar foto kamar
  List<String> roomPhotos = [
    'assets/room1.jpeg',
    'assets/room2.jpeg',
    'assets/room3.jpeg',
    'assets/room1.jpeg',
    'assets/room2.jpeg',
    'assets/room3.jpeg',
    'assets/room1.jpeg',
    'assets/room2.jpeg',
    'assets/room3.jpeg',
    'assets/room1.jpeg',
    'assets/room2.jpeg',
    'assets/room3.jpeg',
  ];

  // Daftar foto fasilitas
  List<String> facilitiesPhotos = [
    'assets/room1.jpeg',
    'assets/room2.jpeg',
    'assets/room3.jpeg',
    'assets/room1.jpeg',
    'assets/room2.jpeg',
    'assets/room3.jpeg',
    'assets/room1.jpeg',
    'assets/room2.jpeg',
    'assets/room3.jpeg',
    'assets/room1.jpeg',
    'assets/room2.jpeg',
    'assets/room3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF27374E), // Warna AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF27374E), // Warna latar belakang bagian atas
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                children: [
                  // Foto Profil Kost
                  Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/logo_living2hf.png'), // Ganti dengan foto profil kost
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              color: Colors.white, // Warna latar belakang bagian bawah
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          'Pondokan H2F',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF27374E), // Warna teks
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xFF27374E),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Lengkong, Kec. Bojongsoang',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF27374E), // Warna teks
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Pondokan H2F menawarkan tempat tinggal yang nyaman dan strategis di area Lengkong, Kec. Bojongsoang. Dilengkapi dengan fasilitas modern dan keamanan yang terjamin.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey, // Warna teks
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Tampilkan foto kamar
                                setState(() {
                                  showRoomPhotos = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.hotel,
                                    size: 40,
                                    color: showRoomPhotos ? const Color(0xFF27374E) : Colors.grey,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Room',
                                    style: TextStyle(
                                      color: showRoomPhotos ? const Color(0xFF27374E) : Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Tampilkan foto fasilitas
                                setState(() {
                                  showRoomPhotos = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.house,
                                    size: 40,
                                    color: !showRoomPhotos ? const Color(0xFF27374E) : Colors.grey,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Facilities',
                                    style: TextStyle(
                                      color: !showRoomPhotos ? const Color(0xFF27374E) : Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Menampilkan foto kamar atau fasilitas
                        GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            for (var photo in showRoomPhotos ? roomPhotos : facilitiesPhotos)
                              Container(
                                margin: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey), // Garis tipis di sekeliling foto
                                ),
                                child: Image.asset(
                                  photo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
