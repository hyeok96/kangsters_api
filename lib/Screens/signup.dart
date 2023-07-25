import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kangsters_api/Api/api.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(children: [
          const Text("username"),
          TextField(
            controller: usernameController,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("email"),
          TextField(
            controller: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("phone"),
          TextField(
            controller: phoneController,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("firstname"),
          TextField(
            controller: firstnameController,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("lastname"),
          TextField(
            controller: lastnameController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () => Api().createUser(
                  context,
                  usernameController,
                  emailController,
                  phoneController,
                  firstnameController,
                  lastnameController),
              child: const Text("수정"))
        ]),
      ),
    );
  }
}
