import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_service.dart';
import 'home.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}


class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();


  final AuthService authService = AuthService();

  bool isLoading = false;



  Future<void> createAccount() async {


    if(passwordController.text.trim() != 
       confirmPasswordController.text.trim()){

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
        ),
      );

      return;
    }



    setState(() {
      isLoading = true;
    });



    try {


      final user = await authService.signUp(

        email: emailController.text.trim(),

        password: passwordController.text.trim(),

      );



      if(user != null && mounted){


        Navigator.pushReplacement(

          context,

          MaterialPageRoute(

            builder: (context)=>HomeScreen(),

          ),

        );


      }

} on FirebaseAuthException catch(e){

      print("Firebase Error Code: ${e.code}");
      print("Firebase Error Message: ${e.message}");


      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(

          content: Text(
            "${e.code}: ${e.message}",
          ),

        ),

      );


}

    finally {


      setState(() {

        isLoading = false;

      });


    }

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,

        centerTitle: true,


        iconTheme: const IconThemeData(

          color: Color(0xff6C63FF),

        ),


        title: const Text(

          "Create Account",

          style: TextStyle(

            color: Color(0xff4B3FBD),

            fontWeight: FontWeight.bold,

          ),

        ),

      ),



      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.symmetric(
            horizontal:24,
            vertical:10,
          ),


          child: Column(

            children: [


              const SizedBox(height:10),



              SvgPicture.asset(

                "assets/octagon.svg",

                height:95,

              ),



              const SizedBox(height:18),



              const Text(

                "Join PadhLe",

                style:TextStyle(

                  fontSize:36,

                  fontWeight:FontWeight.w800,

                  color:Color(0xff4B3FBD),

                ),

              ),



              const SizedBox(height:8),



              const Text(

                "Create your account",

                style:TextStyle(

                  color:Colors.black54,

                  fontSize:16,

                ),

              ),



              const SizedBox(height:35),



              buildField(
                controller:nameController,
                label:"Full Name",
                icon:Icons.person_outline,
              ),


              const SizedBox(height:18),



              buildField(
                controller:emailController,
                label:"Email",
                icon:Icons.email_outlined,
              ),



              const SizedBox(height:18),



              buildField(
                controller:passwordController,
                label:"Password",
                icon:Icons.lock_outline,
                password:true,
              ),



              const SizedBox(height:18),



              buildField(
                controller:confirmPasswordController,
                label:"Confirm Password",
                icon:Icons.lock_outline,
                password:true,
              ),



              const SizedBox(height:30),



              SizedBox(

                width:double.infinity,

                height:55,


                child:ElevatedButton(


                  style:ElevatedButton.styleFrom(

                    backgroundColor:const Color(0xff6C63FF),

                    foregroundColor:Colors.white,

                    elevation:0,


                    shape:RoundedRectangleBorder(

                      borderRadius:BorderRadius.circular(18),

                    ),

                  ),



                  onPressed:isLoading ? null : createAccount,



                  child:isLoading

                  ? const CircularProgressIndicator(
                      color:Colors.white,
                    )

                  : const Text(

                    "Create Account",

                    style:TextStyle(

                      fontSize:18,

                      fontWeight:FontWeight.bold,

                    ),

                  ),

                ),

              ),



              const SizedBox(height:20),



              Row(

                mainAxisAlignment:MainAxisAlignment.center,


                children:[


                  const Text(
                    "Already have an account?",
                    style:TextStyle(
                      color:Colors.black87,
                    ),
                  ),



                  TextButton(

                    onPressed:(){

                      Navigator.pop(context);

                    },


                    child:const Text(

                      "Login",

                      style:TextStyle(

                        color:Color(0xff6C63FF),

                        fontWeight:FontWeight.bold,

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



  Widget buildField({

    required TextEditingController controller,

    required String label,

    required IconData icon,

    bool password=false,

  }){


    return TextField(

      controller:controller,

      obscureText:password,


      style:const TextStyle(

        color:Colors.black87,

      ),



      decoration:InputDecoration(

        labelText:label,


        prefixIcon:Icon(

          icon,

          color:Color(0xff6C63FF),

        ),



        suffixIcon:password

        ? const Icon(
            Icons.visibility_off_outlined,
          )

        : null,



        filled:true,


        fillColor:const Color(0xffF6F3FF),



        border:OutlineInputBorder(

          borderRadius:BorderRadius.circular(18),

          borderSide:BorderSide.none,

        ),


        enabledBorder:OutlineInputBorder(

          borderRadius:BorderRadius.circular(18),

          borderSide:BorderSide.none,

        ),



        focusedBorder:OutlineInputBorder(

          borderRadius:BorderRadius.circular(18),

          borderSide:const BorderSide(

            color:Color(0xff6C63FF),

            width:2,

          ),

        ),

      ),

    );

  }





  @override
  void dispose(){

    nameController.dispose();

    emailController.dispose();

    passwordController.dispose();

    confirmPasswordController.dispose();


    super.dispose();

  }


}