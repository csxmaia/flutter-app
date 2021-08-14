import 'package:appidea/app/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

void main() async {
  setupInjection();
  runApp(MyApp());

  await Firebase.initializeApp();

  FirebaseFirestore.instance.collection('secao').doc().set({
    'nome': 'TODO',
    'cor': 'red'
  });
}
