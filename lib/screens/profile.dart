import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget profileTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
  }) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black12,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(.12),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff2D2D2D),
          ),
        ),

        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: Color(0xff6C63FF),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme: const IconThemeData(
          color: Color(0xff6C63FF),
        ),

        title: const Text(
          "Profile",
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

                  const CircleAvatar(
                    radius: 48,
                    backgroundColor: Color(0xff6C63FF),

                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    "Prachi Chandra",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4B3FBD),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "CSE (AI & ML)",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

            profileTile(
              icon: Icons.email_outlined,
              title: "Email",
              subtitle: user?.email ?? "No Email",              
              iconColor: Colors.deepPurple,
            ),

            profileTile(
              icon: Icons.school_outlined,
              title: "Department",
              subtitle: "Computer Science (AI & ML)",
              iconColor: Colors.blue,
            ),

            profileTile(
              icon: Icons.account_balance_outlined,
              title: "College",
              subtitle: "MS Ramaiah Institute of Technology",
              iconColor: Colors.green,
            ),

            profileTile(
              icon: Icons.lock_outline,
              title: "Change Password",
              subtitle: "Update your account password",
              iconColor: Colors.orange,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                onPressed: () async {
  await FirebaseAuth.instance.signOut();

  if (context.mounted) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }
},

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6C63FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                icon: const Icon(Icons.logout),

                label: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}