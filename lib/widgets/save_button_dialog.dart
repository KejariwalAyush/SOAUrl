import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/models/qr_details.dart';

class SaveItButton extends StatelessWidget {
  const SaveItButton({Key key, @required this.qrData, @required this.scanned})
      : super(key: key);

  final bool scanned;
  final String qrData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton.icon(
        padding: EdgeInsets.all(15),

        onPressed: () => showSaveDialog(context),
        icon: Icon(Icons.bookmark),
        label: Text(
          "Save it For Later!",
          style:
              TextStyle(color: Colors.purple[900], fontWeight: FontWeight.bold),
        ),
        //Button having rounded rectangle border
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.indigo[900]),
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }

  Future<void> showSaveDialog(BuildContext context) async {
    TextEditingController titleField = new TextEditingController();
    TextEditingController tagsField = new TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      //this means the user must tap a button to exit the Alert Dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save QR'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text('Give a Title '),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: titleField,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.purple)),
                      hintText: 'Title for QR',
                      labelText: 'Title',
                      prefixIcon: const Icon(
                        Icons.title_rounded,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: tagsField,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.purple)),
                      hintText: 'Tags for QR seperated by Space " "',
                      labelText: 'Tags',
                      prefixIcon: const Icon(
                        Icons.tag,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Save'),
              onPressed: () async {
                if ((titleField?.text ?? '') == '') {
                  Fluttertoast.showToast(
                      msg: 'Error Saving: Title Null',
                      backgroundColor: Colors.redAccent);

                  return;
                }
                DocumentReference doc = FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.uid)
                    .collection('saved')
                    .doc();

                log(doc.id);
                log(titleField.text);
                log(tagsField.text.split(',').toList().toString());
                QrDetails qrDetails = QrDetails(
                    id: doc.id,
                    title: titleField.text,
                    tags: tagsField?.text
                            ?.split(' ')
                            ?.map((e) => e.trim())
                            ?.toList() ??
                        [],
                    text: qrData,
                    time: DateTime.now(),
                    scanned: scanned);
                // SharedPreferences sp = await SharedPreferences.getInstance();
                // List<String> _history = sp.getStringList('saved') ?? [];
                // if (_history.length > 50) _history.removeLast();
                // _history.add(qrDetails.toJson());
                // sp.setStringList('saved', _history);
                // log('added to saved');
                doc.set(qrDetails.toMap());

                Fluttertoast.showToast(msg: 'Saved!');
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
