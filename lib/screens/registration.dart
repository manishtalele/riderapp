import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
      _issuedate = TextEditingController(),
      _email = TextEditingController(),
      _licenseauthority = TextEditingController(),
      _password = TextEditingController(),
      _confirmPass = TextEditingController();

  bool showPassword = true, showConfirmPass = true;
  String vehicletype = "Scooter";
  DateTime yesterDate = DateTime.now();
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
    _expirydate.text =
        "${yesterDate.day - 1}/${yesterDate.month}/${yesterDate.year}";
    _issuedate.text =
        "${yesterDate.day - 1}/${yesterDate.month}/${yesterDate.year}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double sidepadding =
        ResponsiveValue(context, defaultValue: 20.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 18.0),
      Condition.largerThan(name: TABLET, value: 30.0)
    ]).value as double;
    double? fontsize16 =
        ResponsiveValue(context, defaultValue: 16.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 12.0),
      Condition.largerThan(name: TABLET, value: 24.0)
    ]).value;
    double? fontsize20 =
        ResponsiveValue(context, defaultValue: 20.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 16.0),
      Condition.largerThan(name: TABLET, value: 30.0)
    ]).value;
    double? fontsize24 =
        ResponsiveValue(context, defaultValue: 24.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 20.0),
      Condition.largerThan(name: TABLET, value: 32.0)
    ]).value;
    double btnheight =
        ResponsiveValue(context, defaultValue: 50.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 30.0),
      Condition.largerThan(name: TABLET, value: 65.0)
    ]).value as double;
    double? iconsize =
        ResponsiveValue(context, defaultValue: 25.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 15.0),
      Condition.largerThan(name: TABLET, value: 35.0)
    ]).value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: iconsize,
            )),
        elevation: 0,
        title: Text(
          "SIGN UP",
          style: TextStyle(
              fontSize: fontsize24,
              fontWeight: FontWeight.w400,
              color: primaryColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(sidepadding, 20, sidepadding, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal information",
                style: TextStyle(
                    fontSize: fontsize20,
                    fontWeight: FontWeight.w400,
                    color: primary2Color),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Full Name",
                style: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                height: btnheight,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.4, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  style: TextStyle(
                      fontSize: fontsize16, fontWeight: FontWeight.w400),
                  controller: _fullname,
                ),
              ),
              Text(
                "Contact no.",
                style: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                height: btnheight,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.4, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  style: TextStyle(
                      fontSize: fontsize16, fontWeight: FontWeight.w400),
                  controller: _contactNo,
                ),
              ),
              Text(
                "Email ID",
                style: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                height: btnheight,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.4, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  style: TextStyle(
                      fontSize: fontsize16, fontWeight: FontWeight.w400),
                  controller: _email,
                ),
              ),
              Text(
                "Vehicle Type",
                style: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 20),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonDecoration: BoxDecoration(
                        border: Border.all(width: 0.4, color: Colors.grey),
                        shape: BoxShape.rectangle,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
                    items: items
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: fontsize16,
                                  fontWeight: FontWeight.w400,
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
                    buttonHeight: btnheight,
                    buttonWidth: width,
                  ),
                ),
              ),
              Text(
                "License details",
                style: TextStyle(
                    fontSize: fontsize20,
                    fontWeight: FontWeight.w400,
                    color: primary2Color),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Driving License no.",
                style: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                height: btnheight,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.4, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  style: TextStyle(
                      fontSize: fontsize16, fontWeight: FontWeight.w400),
                  controller: _licenseno,
                ),
              ),
              Text(
                "Issue Date",
                style: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                height: btnheight,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.4, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey.shade600,
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  style: TextStyle(
                      fontSize: fontsize16, fontWeight: FontWeight.w400),
                  controller: _issuedate,
                  readOnly: true,
                  onTap: () => DatePicker().getDate(
                      context: context,
                      setDate: (date) => setState(() => date == null
                          ? _issuedate.text = ""
                          : _issuedate.text = date),
                      before: true),
                ),
              ),
              Text(
                "License Validity",
                style: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 15),
                  height: btnheight,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.4, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    // keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      suffixIcon: Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey.shade600,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                    style: TextStyle(
                        fontSize: fontsize16, fontWeight: FontWeight.w400),
                    controller: _expirydate,
                    readOnly: true,
                    onTap: () => DatePicker().getDate(
                      context: context,
                      setDate: (date) => setState(() => date == null
                          ? _expirydate.text = ""
                          : _expirydate.text = date),
                      before: false,
                    ),
                  )),
              Text(
                "Licensing Authority",
                style: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 20),
                height: btnheight,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.4, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  style: TextStyle(
                      fontSize: fontsize16, fontWeight: FontWeight.w400),
                  controller: _licenseauthority,
                ),
              ),
              Text(
                "Password",
                style: TextStyle(
                    fontSize: fontsize20,
                    fontWeight: FontWeight.w400,
                    color: primary2Color),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Create Password",
                style: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                height: btnheight,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.4, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  obscureText: showPassword,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => showPassword = !showPassword),
                        icon: Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.grey.shade600,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  style: TextStyle(
                      fontSize: fontsize16, fontWeight: FontWeight.w400),
                  controller: _password,
                ),
              ),
              Text(
                "Confirm Password",
                style: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 50),
                height: btnheight,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.4, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  obscureText: showConfirmPass,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => showConfirmPass = !showConfirmPass),
                        icon: Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.grey.shade600,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  style: TextStyle(
                      fontSize: fontsize16, fontWeight: FontWeight.w400),
                  controller: _confirmPass,
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(width, btnheight)),
                  onPressed: () async {
                    try {
                      if (_password.text != _confirmPass.text) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Proper Password",
                            toastLength: Toast.LENGTH_LONG,
                            fontSize: 20,
                            backgroundColor: Theme.of(context).primaryColor,
                            textColor: Colors.white);
                        return;
                      }
                      await setDetails();
                      await EmailAuth()
                          .createUserWithEmailAndPassword(
                              emailAddress: _email.text,
                              password: _password.text)
                          .then((value) async =>
                              await UserDetails().createUser(context: context));
                    } catch (e) {
                      Fluttertoast.showToast(
                          msg: "Something Went Wrong",
                          toastLength: Toast.LENGTH_LONG,
                          fontSize: 20,
                          backgroundColor: primaryColor,
                          textColor: Colors.white);
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontSize: fontsize16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
