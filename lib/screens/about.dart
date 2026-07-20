import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xff6C63FF),
        ),
        title: const Text(
          "About",
          style: TextStyle(
            color: Color(0xff4B3FBD),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),

        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: const Color(0xffF6F3FF),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: const Color(0xffE7E2FF),
                ),
              ),

              child: Column(
                children: [

                  SvgPicture.asset(
                    "assets/octagon.svg",
                    height: 90,
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    "PadhLe",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4B3FBD),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "College Resource Repository",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 3,
              shadowColor: Colors.black12,
              color: Colors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: const Padding(
                padding: EdgeInsets.all(20),

                child: Text(
                  "PadhLe is a Flutter-based college resource repository that helps students access semester-wise notes, previous year question papers, presentations, and study materials in one organized place.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff2D2D2D),
                    height: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 2,
              color: Colors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xffF6F3FF),
                  child: Icon(
                    Icons.code,
                    color: Color(0xff6C63FF),
                  ),
                ),

                title: Text(
                  "Developed By",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text("Prachi Chandra\nNandini Trivedi"),
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 2,
              color: Colors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xffF6F3FF),
                  child: Icon(
                    Icons.school,
                    color: Color(0xff6C63FF),
                  ),
                ),

                title: Text(
                  "Institution",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text("Ramaiah Institute of Technology"),
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 2,
              color: Colors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),


            ),
          ],
        ),
      ),
    );
  }
}