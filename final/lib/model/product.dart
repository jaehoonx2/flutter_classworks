// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final int price;
  final String imgURL;
  final String description;
  final String docID;
  final String authorID;
  final Timestamp created;
  final int votes;
  final List<dynamic> clickedID;
  Timestamp modified;

  final DocumentReference reference;

  Product.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['price'] != null),
        assert(map['imgURL'] != null),
        assert(map['description'] != null),
        assert(map['docID'] != null),
        assert(map['authorID'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        price = map['price'],
        imgURL = map['imgURL'],
        description = map['description'],
        docID = map['docID'],
        authorID = map['authorID'],
        created = map['created'],
        votes = map['votes'],
        clickedID = map['clickedID'],
        modified = map['modified'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}