import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:to_do_app/const/colors.dart';
import 'package:to_do_app/model/notes_model.dart';
import 'package:to_do_app/screens/edit.screen.dart';

class Task_Widget extends StatefulWidget {
  Note _note;
  Task_Widget(this._note, {super.key});

  @override
  State<Task_Widget> createState() => _Task_WidgetState();
}

bool isDone = false;

class _Task_WidgetState extends State<Task_Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 7,
                  offset: Offset(0, 2),
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  //Image
                  imageee(),
                  SizedBox(
                    width: 20,
                  ),

                  //Title and subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget._note.title, 
                            style: TextStyle(
                              fontSize: 18, 
                              fontWeight: FontWeight.bold
                              ),
                            ),
                            Checkbox(
                              activeColor: customGreen,
                              value: isDone, 
                              onChanged: (value){
                              setState(() {
                                isDone = !isDone;
                              });
                            }
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget._note.subtitle,
                        style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400,
                        ),
                      ),
                        Spacer(),
                        edit_time()
                  ],
                ),
             ),
            ],
          ),
        ),
      ),
    );
  }

  Widget edit_time() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 28,
            decoration: BoxDecoration(
              color: customGreen,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal:12, 
                vertical: 6,
              ),
              child: Row(
                children: [
                  Image.asset('images/icon_time.png'),
                  SizedBox(width: 10),
                  Text(
                    widget._note.time, 
                    style: TextStyle(
                    color: Colors.white, 
                    fontSize: 14, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      SizedBox(width: 10),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Edit_Screen(),
            )
          );
        },
        child: Container(
          width: 90,
          height: 28,
          decoration: BoxDecoration(
            color: Color(0xffe2f6f1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
            horizontal:12, 
            vertical: 6,
          ),
          child: Row(
            children: [
              Image.asset('images/icon_edit.png'),
              SizedBox(width: 10),
              Text(
                'Edit', 
                style: TextStyle(
                fontSize: 14, 
                fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
            ),
      ),
    ],
    ),
    );
  }

  Widget imageee() {
    return Container(
                  height: 130,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('images/${widget._note.image}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
  }
}