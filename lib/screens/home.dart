import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/semcard.dart';
import 'about.dart';
import 'fav.dart';
import 'profile.dart';
import 'recent.dart';
import 'semscreen.dart';
import 'login.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> semesters = [
    "Semester 1",
    "Semester 2",
    "Semester 3",
    "Semester 4",
    "Semester 5",
    "Semester 6",
    "Semester 7",
    "Semester 8",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,

        iconTheme: const IconThemeData(
          color: Color(0xff6C63FF),
        ),

        title: Row(
          children: [
            SvgPicture.asset(
              "assets/octagon.svg",
              height: 28,
            ),
            const SizedBox(width: 10),
            const Text(
              "PadhLe",
              style: TextStyle(
                color: Color(0xff4B3FBD),
                fontWeight: FontWeight.w800,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),

      drawer: Drawer(
  backgroundColor: Colors.white,

  child: SafeArea(
    child: Column(
      children: [

        const SizedBox(height: 20),

        SvgPicture.asset(
          "assets/octagon.svg",
          height: 80,
        ),

        const SizedBox(height: 15),

        const Text(
          "PadhLe",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xff4B3FBD),
          ),
        ),

        const SizedBox(height: 5),

        const Text(
          "College Resource Repository",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),

        const SizedBox(height: 30),

        const Divider(),

        ListTile(
          leading: const Icon(
            Icons.home_rounded,
            color: Color(0xff6C63FF),
          ),

          title: const Text(
            "Home",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          onTap: () {
            Navigator.pop(context);
          },
        ),

        ListTile(
          leading: const Icon(
            Icons.favorite_rounded,
            color: Colors.red,
          ),

          title: const Text(
            "Favorites",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          onTap: () {
            Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const FavoritesScreen(),
              ),
            );
          },
        ),

        ListTile(
          leading: const Icon(
            Icons.history_rounded,
            color: Colors.blue,
          ),

          title: const Text(
            "Recently Viewed",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          onTap: () {
            Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const RecentScreen(),
              ),
            );
          },
        ),

        ListTile(
          leading: const Icon(
            Icons.person_rounded,
            color: Color(0xff6C63FF),
          ),

          title: const Text(
            "Profile",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          onTap: () {
            Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfileScreen(),
              ),
            );
          },
        ),

        ListTile(
          leading: const Icon(
            Icons.info_outline_rounded,
            color: Colors.green,
          ),

          title: const Text(
            "About",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          onTap: () {
            Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AboutScreen(),
              ),
            );
          },
        ),

        const Spacer(),

        const Divider(),

        ListTile(
          leading: const Icon(
            Icons.logout_rounded,
            color: Colors.red,
          ),

          title: const Text(
            "Logout",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),

       onTap: () async {
  await FirebaseAuth.instance.signOut();

  if (context.mounted) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/',
      (route) => false,
    );
  }
},
        ),

        

        const SizedBox(height: 20),

      ],
    ),
  ),
),


    body: SafeArea(
  child: SingleChildScrollView(
    padding: const EdgeInsets.symmetric(
      horizontal: 22,
      vertical: 20,
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        const SizedBox(height: 10),

        const Text(
          "Hello, Prachi 👋",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xff2D2D2D),
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          "CSE AI & ML",
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 41, 33, 37),
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 35),

        const Text(
          "Semesters",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff4B3FBD),
          ),
        ),

        const SizedBox(height: 18),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: semesters.length,

          itemBuilder: (context, index) {

            return SemesterCard(
              semester: semesters[index],
              
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SemScreen(
                      semester: semesters[index],
                    ),
                  ),
                );
              },
            );
          },
        ),

        const SizedBox(height: 30),

      ],
    ),
  ),
),);
  }}