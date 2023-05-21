import 'package:flutter/material.dart';

class Rent extends StatefulWidget {
  const Rent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  MainWidget createState() => MainWidget();
}

// ignore: camel_case_types
class MainWidget extends State<Rent> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(),
    );
  }
}
