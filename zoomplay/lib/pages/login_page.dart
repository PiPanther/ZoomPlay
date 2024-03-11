import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zoomplay/components/myButton.dart';
import 'package:zoomplay/components/text_field.dart';
import 'package:zoomplay/controller/auth_controller.dart';
import 'package:zoomplay/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              height: 90,
            ),
            // logo
            LottieBuilder.asset("lib/assets/logo.json"),
            //welcome back message
            Text(
              "Welcome Back \n You have been missed !",
              style: GoogleFonts.pacifico(fontSize: 22),
            ),
            const SizedBox(
              height: 30,
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
                text: 'Login',
                onTap: () {
                  AuthController.instance.login(emailController.text.trim(),
                      passwordController.text.trim());
                }),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a Member?  "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RegistePage();
                      }));
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
