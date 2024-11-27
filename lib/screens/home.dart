import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_app/const/colors.dart';
import 'package:to_do_app/data/firestore.dart';
import 'package:to_do_app/screens/add_note_screen.dart';
import 'package:to_do_app/widgets/task_widgets.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}
bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Add_creen(),
              ),
            );
          },
          backgroundColor: customGreen,
          child: Icon(Icons.add, size: 30),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification:(notification) {
            if(notification.direction == ScrollDirection.forward){
              setState((){
                  show = true;
              });
            }if(notification.direction == ScrollDirection.reverse){
              setState((){
                  show = false;
              });
            }return true;
          },
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore_Datasource().stream(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              }
              final noteslist = Firestore_Datasource().getNotes(snapshot);
              return ListView.builder(
                itemBuilder: (context, index){
                  final note = noteslist[index];
                  return Task_Widget(note);
                },
                itemCount: noteslist.length,
              );
            }
          ),
        ),
      )
    );
  }
}