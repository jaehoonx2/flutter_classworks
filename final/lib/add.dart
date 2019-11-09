import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as Path;

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() {
    return _AddPageState();
  }
}

class _AddPageState extends State<AddPage> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();

  File _image;
  String _uploadedFileURL = 'https://firebasestorage.googleapis.com/v0/b/final-app-db-df596.appspot.com/o/products%2Fdefault.png?alt=media&token=a18831b6-a69b-4604-b5f2-a9e39e8c9468';

  Future getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  Future getImageURL() async {
    if(_image != null) {
      StorageReference ref = FirebaseStorage.instance.ref().child(
          'products/${Path.basename(_image.path)}');
      StorageUploadTask uploadTask = ref.putFile(_image);
      await uploadTask.onComplete;
      print('File Uploaded');
      await ref.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL = fileURL;
        });
      });
    } else {
      setState(() {
        _uploadedFileURL = 'https://firebasestorage.googleapis.com/v0/b/final-app-db-df596.appspot.com/o/products%2Fdefault.png?alt=media&token=a18831b6-a69b-4604-b5f2-a9e39e8c9468';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0
              ),
            ),
            onPressed: () async {
              if (nameController.text.isNotEmpty
                  && priceController.text.isNotEmpty
                  && descController.text.isNotEmpty) {

                await getImageURL();

                final collRef = Firestore.instance.collection('product');
                DocumentReference docReferance = collRef.document();
                docReferance.setData({
                  'name': nameController.text,
                  'price': priceController.text,
                  'description': descController.text,
                  'imgUrl' : _uploadedFileURL,
                  'docID' : docReferance.documentID,
                });

                Fluttertoast.showToast(
                    msg: "Product uploaded successfully!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0
                );

                _image = null;
                await getImageURL();
                nameController.clear();
                priceController.clear();
                descController.clear();

              } else {
                Fluttertoast.showToast(
                    msg: "PLEASE ENTER THE PRODUCT INFO!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            child: _image != null
                ? Image.file(_image, fit: BoxFit.fill)
                : Image.network(_uploadedFileURL, fit: BoxFit.fill),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(icon: Icon(Icons.camera_alt), onPressed: getGalleryImage),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextField(
                decoration: InputDecoration(
                  filled: false,
                  labelText: 'Product Name',
                ),
                controller: nameController,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextField(
                decoration: InputDecoration(
                  filled: false,
                  labelText: 'Price',
                ),
                controller: priceController,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextField(
                decoration: InputDecoration(
                  filled: false,
                  labelText: 'Description',
                ),
                controller: descController,
            ),
          ),
        ],
      ),
    );
  }
}