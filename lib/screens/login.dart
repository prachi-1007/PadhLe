import 'package:flutter/material.dart';
import 'signup.dart';
import 'home.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              const SizedBox(height: 10),

              SvgPicture.asset(
                "assets/octagon.svg",
                height: 130,
              ),

              const SizedBox(height: 15),

              const Text(
                "PadhLe",
                style: TextStyle(
                color: Color(0xff4B3FBD),
                fontSize: 40,
                fontWeight: FontWeight.w800,
                letterSpacing: -1,
              ),
              ),

              const SizedBox(height: 8),

              const Text(
                "College Resource Repository",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 50),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome :)",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to continue",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              TextField(
              controller: emailController,
              style: const TextStyle(color: Colors.black87),

              decoration: InputDecoration(
                labelText: "Email",

                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Color(0xff6C63FF),
                ),

                filled: true,
                fillColor: const Color(0xffF6F3FF),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Color(0xff6C63FF),
                    width: 2,
                  ),
                ),
              ),
            ),            
            const SizedBox(height: 20),

          TextField(
            controller: passwordController,
            obscureText: true,
            style: const TextStyle(color: Colors.black87),
          
            decoration: InputDecoration(
              labelText: "Password",
          
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Color(0xff6C63FF),
              ),
          
              suffixIcon: const Icon(
                Icons.visibility_off_outlined,
                color: Colors.grey,
              ),
          
              filled: true,
              fillColor: const Color(0xffF6F3FF),
          
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
          
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                  color: Color(0xff6C63FF),
                  width: 2,
                ),
              ),
            ),
          ),           

              const SizedBox(height: 30),

              SizedBox(

                width: double.infinity,

                height: 55,

                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6C63FF),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18),
                ),
              ),

              ),

              const SizedBox(height: 20),

              Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black87),
                  ),

                  TextButton(

                    onPressed: () {
                       Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                      );

  
                    },

                    child: const Text("Sign Up"),

                  )

                ],

              )

            ],

          ),

        ),
      ),

    );

  }
}