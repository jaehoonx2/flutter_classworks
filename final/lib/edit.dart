import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as Path;
import 'model/product.dart';

class EditPage extends StatefulWidget {
  final Product product;

  const EditPage({Key key, this.product}): super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  Product _product;
  String _uploadedFileURL;
  File _newImage;
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _product = this.widget.product;
    _uploadedFileURL = _product.imgUrl;

    _nameController.text = _product.name;
    _priceController.text = _product.price;
    _descController.text = _product.description;
  }

  Future getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _newImage = image;
      print('Image Path $_newImage');
    });
  }

  Future updateImageURL() async {
      StorageReference ref = FirebaseStorage.instance.ref().child(
          'products/${Path.basename(_newImage.path)}');
      StorageUploadTask uploadTask = ref.putFile(_newImage);
      await uploadTask.onComplete;
      print('File Uploaded');
      await ref.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL = fileURL;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
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
              if (_nameController.text.isNotEmpty
                  && _priceController.text.isNotEmpty
                  && _descController.text.isNotEmpty) {

                await updateImageURL();
                
                Firestore.instance.runTransaction((transaction) async{
                  await transaction.update(_product.reference, {
                    'name': _nameController.text,
                    'price': _priceController.text,
                    'description': _descController.text,
                    'imgUrl' : _uploadedFileURL,
                  });
                });
                
//                Firestore.instance.collection('product').document(_product.docID).
//                setData({
//                  'name': _nameController.text,
//                  'price': _priceController.text,
//                  'description': _descController.text,
//                  'imgUrl' : _uploadedFileURL,
//                });

                Fluttertoast.showToast(
                    msg: "Product updated successfully!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0
                );

                _newImage = null;
                await updateImageURL();
                _nameController.clear();
                _priceController.clear();
                _descController.clear();

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
            child: _newImage != null
                ? Image.file(_newImage, fit: BoxFit.fill)
                : Image.network(_uploadedFileURL, fit: BoxFit.fill),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(icon: Icon(Icons.camera_alt), onPressed: getGalleryImage),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Product Name',
              ),
              controller: _nameController,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              controller: _priceController,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              controller: _descController,
            ),
          ),
        ],
      ),
    );
  }


}