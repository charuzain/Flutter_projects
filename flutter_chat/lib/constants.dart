import 'package:flutter/material.dart';

const kInputTextDecorationStyle = InputDecoration(
prefixIcon: Icon(Icons.email),
contentPadding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 20.0), hintText: "Enter Email id",

  border: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(30.0)),
// borderSide: BorderSide(width: 4.0, color: Colors.purple),
),
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(width: 4.0, color: Colors.purple),
  borderRadius: BorderRadius.all(Radius.circular(30.0)),
),
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(width: 4.0, color: Colors.green),
  borderRadius: BorderRadius.all(Radius.circular(30.0)),
),

);