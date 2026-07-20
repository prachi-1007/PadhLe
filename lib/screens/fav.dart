import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

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
          "Favorites",
          style: TextStyle(
            color: Color(0xff4B3FBD),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
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

                  Container(
                    height: 90,
                    width: 90,

                    decoration: const BoxDecoration(
                      color: Color(0xff6C63FF),
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "No Favorites Yet",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4B3FBD),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Bookmark notes and question papers to access them quickly anytime.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xffF6F3FF),
                  child: Icon(
                    Icons.bookmark_border,
                    color: Color(0xff6C63FF),
                  ),
                ),

                title: Text(
                  "Your saved resources will appear here",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                subtitle: Text(
                  "Favorites are stored after login.",
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}