import 'package:flutter/material.dart';
import 'package:shoe_shop/views/shared/appstyle.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "AddPage",
        ),
      ),
    );
  }
}
