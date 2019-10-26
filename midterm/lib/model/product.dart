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

import 'package:flutter/foundation.dart';

enum Category { all, accessories, clothing, home, hotel, }

class Product {
  const Product({
    @required this.category,
    @required this.id,
    @required this.stars,
    @required this.name,
    @required this.address,
    @required this.phone,
    @required this.description,
  })  : assert(category != null),
        assert(id != null),
        assert(stars != null),
        assert(name != null),
        assert(address != null),
        assert(phone != null),
        assert(description != null);

  final Category category;
  final int id;
  final int stars;
  final String name;
  final String address;
  final String phone;
  final String description;

  String get assetName => 'assets/$id-0.jpg';
  //String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}