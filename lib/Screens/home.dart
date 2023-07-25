import 'package:flutter/material.dart';
import 'package:kangsters_api/Api/api.dart';
import 'package:kangsters_api/Screens/detail.dart';
import 'package:kangsters_api/Screens/signup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SignupScreen();
              },
            ));
          },
          child: const Text("회원가입"),
        ),
      ]),
      body: SafeArea(
        child: FutureBuilder(
          future: Api().getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    var item = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return DetailSreen(
                              id: item["id"],
                            );
                          },
                        ));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("name: ${item["username"]}"),
                          Text("name: ${item["email"]}"),
                          Text("name: ${item["phone"]}"),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: snapshot.data!.length);
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
