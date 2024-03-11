import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zoomplay/components/myButton.dart';
import 'package:zoomplay/components/text_field.dart';
import 'package:zoomplay/controller/auth_controller.dart';


class RegistePage extends StatefulWidget {
  const RegistePage({super.key});

  @override
  State<RegistePage> createState() => _RegistePageState();
}

class _RegistePageState extends State<RegistePage> {
  AuthController authController = AuthController();
  // final img = AuthController.instance.upl;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  // void register() {
  //   final auth = AuthService();

  //   try {
  //     auth
  //         .signUpUserWithEmailandPassword(
  //             emailController.text, passwordController.text)
  //         .then((value) {
  //       Navigator.pushReplacement(context, MaterialPageRoute(
  //         builder: (context) {
  //           return const HomePage();
  //         },
  //       ));
  //     });
  //   } catch (e) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(title: Text(e.toString()));
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LottieBuilder.asset(
          "lib/assets/logo.json",
        ),
        title: Text(
          "Zoom Play",
          style: GoogleFonts.roboto(),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            // logo
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    AuthController.instance.pickImage();
                  },
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://i.pngimg.me/thumb/f/720/c3f2c592f9.jpg"),
                    radius: 50,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 16,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            //welcome back message
            Text(
              "Register & scroll through boredom !",
              style: GoogleFonts.pacifico(fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            MyTextField(
              text: "Username",
              controller: usernameController,
              obscureText: false,
            ),
            // email textfield
            MyTextField(
              text: "Enter Email",
              controller: emailController,
              obscureText: false,
            ),
            // password textfield
            MyTextField(
              text: "Enter Password",
              controller: passwordController,
              obscureText: true,
            ),

            const SizedBox(
              height: 24,
            ),

            // register now
            MyButton(
                text: 'Register',
                onTap: () {
                  AuthController.instance.signUp(
                      usernameController.text.trim(),
                      passwordController.text.trim(),
                      emailController.text.trim(),
                      AuthController.instance.profileImage);
                }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already a Member?  "),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
