import 'package:flutter/material.dart';
import 'package:ticketbookingapp/utils/routes.dart';

import '../utils/styles.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool thisButton = false;
  bool that=false;
  final _formKey = GlobalKey<FormState>();

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        thisButton = true;
        that =true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(context, MyRoutes.bottombtnroute);
      setState(() {
        thisButton = false;
        that=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.bColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 30,),
                Image.asset(
                  "assets/images/1.png",
                  scale: 1,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30,),
                Text(
                  "Book Your Ticket Now",
                  style: Styles.headLineStyle1
                ),
                SizedBox(height:20,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "Username",
                          // labelText: "Name",
                        ),
                        validator: (value) {
                          if (value!= null && value.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                        onChanged: (val){
                          name=val;

                        },


                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "Password",
                          // labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!= null && value.isEmpty) {
                            return "Password can't be empty";
                          } else if (value!.length < 6) {
                            return "Password must contain at least 6 characters";
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () => moveToHome(context),
                  child: Container(
                    width:  100,
                    height: 50,
                    decoration: BoxDecoration(
                      color:thisButton ? Colors.transparent:Styles.textColor,
                      borderRadius:
                           BorderRadius.circular(10),
                      backgroundBlendMode: thisButton?BlendMode.screen:BlendMode.darken

                    ),
                    child: thisButton
                        ? CircularProgressIndicator(backgroundColor: Colors.transparent,)
                        : Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(height: 10,),
                that? Text("$name Welcome",style: Styles.headLineStyle2,):Text("")

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
