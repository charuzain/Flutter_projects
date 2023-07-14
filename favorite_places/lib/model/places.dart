import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';


var uuid = Uuid();

class Place {
  Place({required this.name, required this.image, required this.address}) : id = uuid.v4();
  final String name;
  final String id;
  final File image;
  final String address;
}
