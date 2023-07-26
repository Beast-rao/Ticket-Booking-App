import 'package:flutter/material.dart';
import 'package:ticketbookingapp/utils/routes.dart';
import 'package:country_picker/country_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import '../utils/styles.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  Country? selectedCountry; // Store the selected country
  bool thisButton = false;
  bool that = false;
  final _formKey = GlobalKey<FormState>();

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        thisButton = true;
        that = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(context, MyRoutes.bottombtnroute);
      setState(() {
        thisButton = false;
        that = false;
      });
    }
  }

  // void _openCountryPicker() {
  //   showCountryPicker(
  //     context: context,
  //     showPhoneCode: false, // Hide the phone code in the picker
  //     onSelect: (Country country) {
  //       setState(() {
  //         selectedCountry = country;
  //       });
  //     },
  //   );
  // }
  final TextEditingController _country = TextEditingController();
  final TextEditingController _currency = TextEditingController();

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
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/1.png",
                  scale: 1,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Book Your Ticket Now",
                  style: Styles.headLineStyle1,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        // controller for selecting country from list of countries
                        controller: _country,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "Country",
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please Select your Country";
                          }
                          return null;
                        },
                        // it is to select the country
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              favorite: ['PK'],
                              onSelect: (Country country) {
                                setState(() {
                                  _country.text = country.name;
                                });
                              });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // controller for selecting country from list of countries
                        controller: _currency,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "Currency",
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please Select Currency";
                          }
                          return null;
                        },
                        // it is to select the country
                        onTap: () {
                          showCurrencyPicker(
                              context: context,
                              theme: CurrencyPickerThemeData(
                                  flagSize: 25,
                                  bottomSheetHeight:
                                      MediaQuery.of(context).size.height * 0.8),
                              showFlag: true,
                              favorite: ['PKR'],
                              onSelect: (Currency currency) {
                                setState(() {
                                  _currency.text = currency.name;
                                });
                              });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "Username",
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          name = val;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "Password",
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
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
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => moveToHome(context),
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: thisButton ? Colors.transparent : Styles.textColor,
                      borderRadius: BorderRadius.circular(10),
                      backgroundBlendMode:
                          thisButton ? BlendMode.screen : BlendMode.darken,
                    ),
                    child: thisButton
                        ? CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                          )
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
                SizedBox(
                  height: 10,
                ),
                that
                    ? Text(
                        "$name Welcome",
                        style: Styles.headLineStyle2,
                      )
                    : Text(""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
