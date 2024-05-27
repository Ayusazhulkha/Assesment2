import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LivingInH2F',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, Jonathan!'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Type A'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Type B'),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Featured Rooms',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  RoomCard(
                    assetPath: 'tipea.jpg',
                    title: 'Tipe A',
                    price: 20000000,
                    imageUrl: 'tipea.jpg',
                  ),
                  RoomCard(
                    assetPath: 'tipeb.jpg',
                    title: 'Tipe B',
                    price: 20000000,
                    imageUrl: 'tipeb.jpg',
                  ),
                  RoomCard(
                    assetPath: 'tipeec.jpg',
                    title: 'Tipe C',
                    price: 20000000,
                    imageUrl: 'tipeec.jpg',
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Recommendation Rooms',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Cari Kamar',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      _searchRooms(context, _searchController.text);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _searchRooms(BuildContext context, String query) {
  }
}

class RoomCard extends StatelessWidget {
  final String assetPath;
  final String title;
  final int price;
  final String imageUrl; 

  const RoomCard({
    Key? key,
    required this.assetPath,
    required this.title,
    required this.price,
    required this.imageUrl, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (title == 'Tipe A') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailKamar(),
            ),
          );
        } else {
          
        }
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl, 
              height: 150.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Rp. ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
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

class DetailKamar extends StatelessWidget {
  final String title;
  final int bedrooms;
  final int price;
  final String type;
  final String assetPath; 

  const DetailKamar({
    Key? key,
    required this.title,
    required this.bedrooms,
    required this.price,
    required this.type,
    required this.assetPath, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamar Tipe A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              assetPath: 'assets/images/tipea.jpg',
              height: 150.0,
              width: 150.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '$bedrooms Bedrooms',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Rp. ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}/Year',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              type,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

