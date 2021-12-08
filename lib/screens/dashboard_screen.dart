import 'package:flutter/material.dart';
import 'package:myap/res/custom_colors.dart';
import 'package:myap/screens/add_screen.dart';
import 'package:myap/widgets/app_bar_title.dart';
import 'package:myap/widgets/item_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // final FocusNode _nameFocusNode = FocusNode();
  // final FocusNode _emailFocusNode = FocusNode();
  // final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: const Text(
          "LIST OF ITEMS",
          style: TextStyle(
              color: CustomColors.firebaseOrange,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        backgroundColor: CustomColors.firebaseOrange,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: ItemList(),
        ),
      ),
    );
  }
}
