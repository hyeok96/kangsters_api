import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  Dio dio = Dio();

  Future<List> getUserData() async {
    var result = await dio.get("https://fakestoreapi.com/users");
    return result.data;
  }

  Future getUserById(int id) async {
    var result = await dio.get('https://fakestoreapi.com/users/$id');
    return result.data;
  }

  void deletUserById(BuildContext content, int id) async {
    try {
      var result = await dio.delete("https://fakestoreapi.com/users/$id");
      ScaffoldMessenger.of(content)
          .showSnackBar(const SnackBar(content: Text("삭제완료")));
    } catch (e) {}
  }

  void updateUserById(
      BuildContext context,
      int id,
      TextEditingController usernameController,
      TextEditingController emailController,
      TextEditingController phoneController,
      TextEditingController firstnameController,
      TextEditingController lastnameController) async {
    var prevData = await Api().getUserById(id);
    try {
      var result = await dio.put("https://fakestoreapi.com/users/$id", data: {
        "email": emailController.text != ""
            ? emailController.text
            : prevData["email"],
        "username": usernameController != ""
            ? usernameController.text
            : prevData["phone"],
        "password": prevData["password"],
        "name": {
          "firstname": firstnameController.text != ""
              ? firstnameController.text
              : prevData["name"]["firstname"],
          "lastname": lastnameController.text != ""
              ? lastnameController.text
              : prevData["name"]["lastname"]
        },
        "address": {
          "city": prevData["address"]["city"],
          "street": prevData["address"]["street"],
          "number": prevData["address"]["number"],
          "zipcode": prevData["address"]["zipcode"],
          "geolocation": {
            "lat": prevData["address"]["geolocation"]["lat"],
            "long": prevData["address"]["geolocation"]["long"]
          }
        },
        "phone": phoneController.text != ""
            ? phoneController.text
            : prevData["phone"]
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("수정완료")));
    } catch (e) {
      print(e);
    }
  }

  void createUser(
      BuildContext context,
      TextEditingController usernameController,
      TextEditingController emailController,
      TextEditingController phoneController,
      TextEditingController firstnameController,
      TextEditingController lastnameController) async {
    try {
      var result = await dio.post(
        "https://fakestoreapi.com/users",
        data: {
          {
            "email": usernameController.text,
            "username": usernameController.text,
            "password": 'm38rmF',
            "name": {
              "firstname": firstnameController.text,
              "lastname": lastnameController.text
            },
            "address": {
              "city": 'kilcoole',
              "street": '7835 new road',
              "number": 3,
              "zipcode": '12926-3874',
              "geolocation": {"lat": '-37.3159', "long": '81.1496'}
            },
            "phone": phoneController.text
          },
        },
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("생성완료")));
    } catch (e) {}
  }
}
