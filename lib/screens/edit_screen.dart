  import 'package:flutter/material.dart';
import 'package:myap/res/custom_colors.dart';
import 'package:myap/utils/database.dart';
import 'package:myap/widgets/app_bar_title.dart';
import 'package:myap/widgets/edit_item_form.dart';

class EditScreen extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String currentLocation;
  final String currentContact;
  final String documentId;

  const EditScreen({
    Key? key,
    required this.currentTitle,
    required this.currentDescription,
    required this.currentLocation,
    required this.currentContact,
    required this.documentId,
  }): super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _locationFocusNode = FocusNode();
  final FocusNode _contactFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
        _locationFocusNode.unfocus();
        _contactFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: const Text(
          "EDIT ITEM TO SELL/ADVERTISE",
          style: TextStyle(
              color: CustomColors.firebaseOrange,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
          actions: [
            _isDeleting
                ? const Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: ListView(
              children: [
                EditItemForm(
                  documentId: widget.documentId,
                  titleFocusNode: _titleFocusNode,
                  descriptionFocusNode: _descriptionFocusNode,
                  locationFocusNode: _locationFocusNode,
                  contactFocusNode: _contactFocusNode,
                  currentTitle: widget.currentTitle,
                  currentDescription: widget.currentDescription,
                  currentLocation: widget.currentLocation,
                  currentContact: widget.currentContact,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}