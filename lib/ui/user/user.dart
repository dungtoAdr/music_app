import 'package:flutter/material.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 80),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
              image: AssetImage('assets/abc.jpg'),
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30, top: 30),
                child: Row(
                  children: [
                    Icon(Icons.person_2, size: 50),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.blue,
                            height: 1,
                          ),
                        ),
                        Text(
                          "Dung To1",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue.shade100,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30, top: 30),
                child: Row(
                  children: [
                    Icon(Icons.departure_board, size: 50),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Department",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.blue,
                            height: 1,
                          ),
                        ),
                        Text(
                          "Technology",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue.shade100,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30, top: 30),
                child: Row(
                  children: [
                    Icon(Icons.phone, size: 50),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.blue,
                            height: 1,
                          ),
                        ),
                        Text(
                          "090503203",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue.shade100,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30, top: 30),
                child: Row(
                  children: [
                    Icon(Icons.email, size: 50),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.blue,
                            height: 1,
                          ),
                        ),
                        Text(
                          "tdung@gmail.com",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue.shade100,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
