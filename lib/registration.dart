import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riderapp/api/createuser.dart';
import 'package:riderapp/data/userdata.dart';
import 'package:riderapp/provider/datepicker.dart';
import 'package:riderapp/provider/emailauth.dart';
import 'package:riderapp/theme/deftheme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List items = ["Scooter", "Bike", "Tempo"];
  final TextEditingController _fullname = TextEditingController(),
      _contactNo = TextEditingController(),
      _licenseno = TextEditingController(),
      _expirydate = TextEditingController(),
      _email = TextEditingController(),
      _password = TextEditingController(),
      _confirmPass = TextEditingController();

  bool showPassword = true, showConfirmPass = true;
  String vehicletype = "Scooter";

  setDetails() {
    username = _fullname.text;
    phoneNum = int.parse(_contactNo.text);
    vehicleType = vehicletype;
    drivingLicenseNo = _licenseno.text;
    expiryDate = _expirydate.text;
    email = _email.text;
  }

  @override
  void initState() {
    _expirydate.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: primaryColor),
                ),
              ),
              SizedBox(height:16),
              Text(
                "Personal information",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: primary2Color),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Full Name",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(106, 140, 175, 1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                        controller: _fullname,
                      ),
                    ),
                    SizedBox(height:15),
                    const Text(
                      "Contact no.",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(106, 140, 175, 1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                        controller: _contactNo,
                      ),
                    ),
                    SizedBox(height:15),
                    const Text(
                      "Email ID",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(106, 140, 175, 1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                        controller: _email,
                      ),
                    ),
                    SizedBox(height:15),
                    const Text(
                      "Vehicle Type",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          buttonDecoration: const BoxDecoration(
                              // color: Color.fromRGBO(233, 245, 255, 12),
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          buttonPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          items: items
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        // color: Color.fromRGBO(24, 101, 137, 0.8),
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: vehicletype,
                          onChanged: (value) {
                            setState(() {
                              vehicletype = value as String;
                            });
                          },
                          buttonHeight: 50,
                          buttonWidth: width,
                          itemHeight: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
              Text(
                "License details",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: primary2Color),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Driving License no.",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(106, 140, 175, 1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                        controller: _licenseno,
                      ),
                    ),
                    SizedBox(height:15),
                    const Text(
                      "Issue Date",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width - 110,
                            child: TextField(
                              // keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(106, 140, 175, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              ),
                              controller: _expirydate,
                              readOnly: true,
                              onTap: () => DatePicker().getDate(
                                context: context,
                                setDate: (date) =>
                                    setState(() => _expirydate.text = date),
                              ),
                            ),
                          ),
                          const Icon(Icons.calendar_today_outlined)
                        ],
                      ),
                    ),
                    SizedBox(height:15),
                    Text(
                      "License Validity",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width - 110,
                            child: TextField(
                              // keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(106, 140, 175, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              ),
                              controller: _expirydate,
                              readOnly: true,
                              onTap: () => DatePicker().getDate(
                                context: context,
                                setDate: (date) =>
                                    setState(() => _expirydate.text = date),
                              ),
                            ),
                          ),
                          
                          const Icon(Icons.calendar_today_outlined)
                        ],
                      ),
                    ),
                    const SizedBox(height:15),
                    const Text(
                      "Licensing Authority",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(106, 140, 175, 1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height:20),
              Text(
                "Password",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: primary2Color),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create Password",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width - 150,
                            child: TextField(
                              obscureText: showPassword,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(106, 140, 175, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              ),
                              controller: _password,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.visibility_off_outlined),
                            onPressed: () =>
                                setState(() => showPassword = !showPassword),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:15),
                    const Text(
                      "Confirm Password",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width - 150,
                            child: TextField(
                              obscureText: showConfirmPass,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(106, 140, 175, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              ),
                              controller: _confirmPass,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.visibility_off_outlined),
                            onPressed: () => setState(
                                () => showConfirmPass = !showConfirmPass),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:30),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () async {
                      try {
                        if (_password.text == _confirmPass.text) {
                          await setDetails();
                          await EmailAuth()
                              .createUserWithEmailAndPassword(
                                  emailAddress: _email.text,
                                  password: _password.text)
                              .then((value) async => await UserDetails()
                                  .createUser(context: context));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please Enter Proper Password",
                              toastLength: Toast.LENGTH_LONG,
                              fontSize: 20,
                              backgroundColor: Theme.of(context).primaryColor,
                              textColor: Colors.white);
                        }
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: "Something Went Wrong",
                            toastLength: Toast.LENGTH_LONG,
                            fontSize: 20,
                            backgroundColor: Theme.of(context).primaryColor,
                            textColor: Colors.white);
                        print(e);
                      }
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
