import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myap/res/custom_colors.dart';
import 'package:myap/screens/edit_screen.dart';
import 'package:myap/utils/database.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return Padding(
            padding: const EdgeInsets.all(90.0),
            child: 
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 16.0),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    dynamic noteInfo = snapshot.data!.docs[index].data()!;
                    String docID = snapshot.data!.docs[index].id;
                    String title = noteInfo["title"];
                    String description = noteInfo["description"];
                    String location = noteInfo["location"];
                    String contact = noteInfo["contact"];

                    return Ink(
                        decoration: BoxDecoration(
                          color: CustomColors.firebaseGrey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditScreen(
                                currentTitle: title,
                                currentDescription: description,
                                currentLocation: location,
                                currentContact: contact,
                                documentId: docID,
                              ),
                            ),
                          ),
                          child: 
                           Card(
                              color: CustomColors.firebaseNavy,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: 
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      description,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(top: 4.0),
                                                child: Text(
                                                  "Location  ",
                                                  style: TextStyle(fontSize: 8),
                                                ),
                                              ),
                                              Text(
                                                location,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const Padding(padding: EdgeInsets.only(top: 4.0),
                                              child: Text("Contact  ", 
                                              style: TextStyle(fontSize: 8),),
                                              ),
                                              Text(
                                                contact,
                                                maxLines: 2,
                                                overflow: TextOverflow.fade,
                                                softWrap: false,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                    )));
                  },
                ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              CustomColors.firebaseOrange,
            ),
          ),
        );
      },
    );
  }
}


// ListTile(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8.0),
//     ),
//     onTap: () => Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => EditScreen(
//           currentTitle: title,
//           currentDescription: description,
//           currentLocation: location,
//           currentContact: contact,
//           documentId: docID,
//         ),
//       ),
//     ),
//     title: Text(
//       title,
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//     ),
//     subtitle: Text(
//       description,
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//     ),
//   ),