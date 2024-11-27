import 'package:flutter/material.dart';
import 'package:to_do_app/const/colors.dart';
import 'package:to_do_app/data/auth_data.dart';

class LogIN_Screen extends StatefulWidget {
  final VoidCallback show;
    const LogIN_Screen(this.show, {super.key});

  @override
  State<LogIN_Screen> createState() => _LogIN_ScreenState();
}


class _LogIN_ScreenState extends State<LogIN_Screen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  
  final email = TextEditingController();
  final password = TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              image(),
              const SizedBox(height: 50),
              textfield(email, _focusNode1, 'Email', Icons.email),
              const SizedBox(height: 10),
              textfield(password, _focusNode2, 'Password', Icons.password_sharp),
              const SizedBox(height: 8),
              account(),
              const SizedBox(height: 20),
              Login_bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget account() {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Don't have an accont?", 
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.show,
                    child: const Text(
                      "Sign UP", 
                      style: TextStyle(
                        color: Colors.blue, 
                        fontSize: 14, 
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
  }

  Widget Login_bottom() {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  AuthenticationRemote().login(email.text, password.text);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: customGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Login', 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 23, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
  }

  Widget textfield(TextEditingController _controller , FocusNode _focusNode, String typeName, IconData iconss) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      iconss, 
                      color: _focusNode.hasFocus
                      ? customGreen 
                      : const Color(0xffc5c5c5),
                    ),
                    contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      hintText: typeName,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xffc5c5c5), 
                          width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: customGreen, 
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            );
  }

  Widget image() {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/7.png'), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
  }
}