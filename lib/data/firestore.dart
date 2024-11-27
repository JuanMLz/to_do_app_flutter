import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/model/notes_model.dart';
import 'package:uuid/uuid.dart';

class Firestore_Datasource{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> CreateUser(String email) async{
    try {
      await _firestore 
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .set({"id": _auth.currentUser!.uid, "email": email});
      return true;
    } catch (e) {
      return true;
    }
  }

  Future<bool> AddNote(String subtitle, String title, int image) async{
    try {
      var uuid = Uuid().v4();
      DateTime data = DateTime.now();
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .set({
        'id':uuid, 
        'subtitle':subtitle, 
        'isDon': false, 
        'image':image,
        'time':'${data.hour}:${data.minute}',
        'title': title,
      });
      return true;
    } catch (e) {
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot){
    try {
      final notesList = snapshot.data.docs.map((doc){
        final data = doc.data() as Map<String,dynamic>;
        return Note(
          data['id'], 
          data['subtitle'], 
          data['time'], 
          data['image'], 
          data['title'],
        );
      }).toList();
      return notesList;
    } catch (e) {
      print(e);
      return [];
    }
  }


  Stream<QuerySnapshot> stream(){
    return _firestore
    .collection('users')
    .doc(_auth.currentUser!.uid)
    .collection('notes')
    .snapshots();
  }

  Future<bool> isdone(String uuid, bool isDon) async{
    try{
      await _firestore
      .collection('user')
      .doc(_auth.currentUser!.uid)
      .collection('notes')
      .doc(uuid)
      .update({'isDon': isDon});
      return true;
    }catch(e){
      print(e);
      return true;
    }
  }
}