import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            Color.fromARGB(255, 255, 255, 255), // Dark blue background
        appBar: AppBar(
          backgroundColor: Color(0xFF0E2D47),
          title: Text(
            'Upload File',
            style: TextStyle(
              color: Colors.white, // Set title color to white
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50), // Add space at the top
              Image.asset(
                'images/kartu.png', // path to your local image
                width: 250, // adjust size as needed
                height: 250, // adjust size as needed
              ),
              SizedBox(height: 1), // Add space between image and dotted border
              GestureDetector(
                onTap: () {
                  // Add your file picker logic here
                },
                child: DottedBorder(
                  color: Colors.grey,
                  strokeWidth: 1, // Adjust the width of the dotted border
                  dashPattern: [4, 4], // Adjust the dash pattern as needed
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  child: Container(
                    width: 250, // adjust width as needed
                    height: 150,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Choose a file here',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'JPEG, PNG',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ), // Add space between dotted border and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your upload logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 20, 42, 60),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Upload',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20), // Add space between buttons
                  ElevatedButton(
                    onPressed: () {
                      // Add your file picker logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 144, 155, 164),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Browse File',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
