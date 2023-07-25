import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kangsters_api/Api/api.dart';

class DetailSreen extends StatelessWidget {
  DetailSreen({super.key, required this.id});
  final int id;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () => Api().deletUserById(context, id),
          child: const Text("탈퇴하기"),
        ),
      ]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder(
              future: Api().getUserById(id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var item = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("username: ${item["username"]}"),
                      Text("email: ${item["email"]}"),
                      Text("phone: ${item["phone"]}"),
                      Text("firstname: ${item["name"]["firstname"]}"),
                      Text("lastname: ${item["name"]["lastname"]}"),
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 50),
            const Text("username"),
            TextField(
              controller: _usernameController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("email"),
            TextField(
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("phone"),
            TextField(
              controller: _phoneController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("firstname"),
            TextField(
              controller: _firstnameController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("lastname"),
            TextField(
              controller: _lastnameController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () => Api().updateUserById(
                    context,
                    id,
                    _usernameController,
                    _emailController,
                    _phoneController,
                    _firstnameController,
                    _lastnameController),
                child: const Text("수정"))
          ],
        ),
      ),
    );
  }
}
