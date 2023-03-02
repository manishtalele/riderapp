import 'package:flutter/material.dart';
import 'package:riderapp/theme/decoration.dart';
import 'package:riderapp/theme/deftheme.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _existingpass = TextEditingController();
  final TextEditingController _newpass = TextEditingController();
  final TextEditingController _confirmpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        elevation:0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios,
          color:primaryColor),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title:Text("Change Password",
        style:TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color:primaryColor,
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            children: [
              Container(
                decoration: shadowdecoration,
                child: TextField (
                      style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)), 
                                    hintText: "Existing Password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    )
                              ), 
                              controller: _existingpass,     
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                decoration: shadowdecoration,
                child: TextField (
                      style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)), 
                                    hintText: "New Password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    )
                              ),    
                              controller: _newpass,  
                ),
              ),
              Container(
                decoration: shadowdecoration,
                child: TextField (
                      style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)), 
                                    hintText: "Confirm Password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    )
                              ),
                              controller: _confirmpass,      
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}