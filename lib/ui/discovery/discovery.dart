import 'package:flutter/material.dart';

class DiscoveryTab extends StatelessWidget {
  const DiscoveryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text("Username:"),
                    ),

                    Text("To Trung Dung")
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text("Email:"),
                    ),
                    Text("tdung@gmail.com")
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text("Address:"),
                    ),
                    Text("Hoan Kiem, Ha Noi")
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Cancle"),style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                    ),)),
                    SizedBox(width: 20,),
                    Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Submit"),style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                    ),)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
