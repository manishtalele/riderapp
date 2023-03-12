import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/theme/decoration.dart';
import 'package:riderapp/theme/deftheme.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final List vehicletype = ["Bike", "Scooter", "Car", "Cycle"];
  String? vehicle = "Bike";
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _issuedate = TextEditingController();
  final TextEditingController _licencevalidity = TextEditingController();
  final TextEditingController _licenseAuthority = TextEditingController();
  String profilePic = "";

//   Future userImage({
//   required XFile? pickedFile,
// }) async {
//   CroppedFile? croppedFileSeleted;
//   if (pickedFile != null) {
//     final croppedFile = await ImageCropper().cropImage(
//       aspectRatioPresets: [CropAspectRatioPreset.original],
//       cropStyle: CropStyle.circle,
//       sourcePath: pickedFile.path,
//       compressFormat: ImageCompressFormat.jpg,
//       compressQuality: 90,
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             activeControlsWidgetColor: primaryColor,
//             toolbarColor: primaryColor,
//             toolbarWidgetColor: Colors.white,
//             hideBottomControls: true,
//             lockAspectRatio: true),
//         IOSUiSettings(
//           title: 'Cropper',
//         ),
//       ],
//     );
//     if (croppedFile != null) {
//       croppedFileSeleted = croppedFile;
//       return croppedFileSeleted.path.toString();
//     } else {
//       return pickedFile.path.toString();
//     }
//   }
//   return pickedFile!.path.toString();
// }

//   Future<dynamic> takeImages({required source}) async {
//     try {
//       final XFile? image = await ImagePicker().pickImage(source: source);

//       final File file = File(image!.path);
//       String cropFile = await userImage(pickedFile: XFile(file.path));

//       setState(() {
//         profilePic = cropFile;
//       });
//     } catch (e) {
//       if (kDebugMode) {
//         print(e.toString());
//       }
//     }
//   }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios, color: primaryColor)),
            title: Text("Personal Details",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: primaryColor))),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: GestureDetector(
                    // onTap: () => bottomSheet(height: height),
                    child: profilePic == ""
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Image.network(
                                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  CircleAvatar(
                                    child: SvgPicture.asset(
                                        "assets/editprofile.svg"),
                                  )
                                ]),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(profilePic),
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          )),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Full Name",
                style: TextStyle(
                  fontFamily: "Overpass",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                decoration: shadowdecoration,
                child: TextField(
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(
                      Icons.edit,
                      color: primaryColor,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  controller: _fullname,
                ),
              ),
              const Text(
                "Issue Date",
                style: TextStyle(
                  fontFamily: "Overpass",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                decoration: shadowdecoration,
                child: TextField(
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(
                      Icons.edit,
                      color: primaryColor,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  controller: _issuedate,
                ),
              ),
              const Text(
                "License Validity",
                style: TextStyle(
                  fontFamily: "Overpass",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                decoration: shadowdecoration,
                child: TextField(
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(
                      Icons.edit,
                      color: primaryColor,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  controller: _licencevalidity,
                ),
              ),
              const Text(
                "Licensing  Authority",
                style: TextStyle(
                  fontFamily: "Overpass",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                decoration: shadowdecoration,
                child: TextField(
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(
                      Icons.edit,
                      color: primaryColor,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  controller: _licenseAuthority,
                ),
              ),
              const Text(
                "Vehicle Type",
                style: TextStyle(
                  fontFamily: "Overpass",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  dropdownDecoration: BoxDecoration(
                    color: primary3Color,
                  ),
                  buttonDecoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 0.4, color: Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 15),
                  items: vehicletype
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Autour'),
                            ),
                          ))
                      .toList(),
                  value: vehicle,
                  onChanged: (value) {},
                  buttonHeight: 50,
                  buttonWidth: width,
                ),
              ),
            ]),
          ),
        ));
  }
  // Future bottomSheet({required double height}) {
  //   return showModalBottomSheet(
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //     backgroundColor: primaryColor,
  //     builder: (BuildContext context) => Container(
  //       // height:  4,
  //       width: MediaQuery.of(context).size.width,
  //       margin: const EdgeInsets.symmetric(
  //         horizontal: 20,
  //         vertical: 20,
  //       ),
  //       child: SingleChildScrollView(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: <Widget>[
  //             ElevatedButton.icon(
  //               style: ElevatedButton.styleFrom(
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(20)),
  //                 foregroundColor: Colors.white,
  //                 backgroundColor: Theme.of(context).primaryColor,
  //               ),
  //               icon: Icon(
  //                 Icons.camera,
  //                 size: 25,
  //               ),
  //               onPressed: () async {
  //                 takeImages(source: ImageSource.camera);
  //                 Navigator.pop(context);
  //               },
  //               label: Text(
  //                 "Camera",
  //                 style: TextStyle(
  //                     fontSize: 20, fontWeight: FontWeight.w700),
  //               ),
  //             ),
  //             ElevatedButton.icon(
  //               style: ElevatedButton.styleFrom(
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(20)),
  //                 foregroundColor: Colors.white,
  //                 backgroundColor: Theme.of(context).primaryColor,
  //               ),
  //               icon: Icon(
  //                 Icons.image,
  //                 size: 25,
  //               ),
  //               onPressed: () {
  //                 takeImages(source: ImageSource.gallery);
  //                 Navigator.pop(context);
  //               },
  //               label: Text(
  //                 "Gallery",
  //                 style: TextStyle(
  //                     fontSize: 20, fontWeight: FontWeight.w700),
  //               ),
  //             ),
  //             profilePic == ""
  //                 ? const SizedBox.shrink()
  //                 : ElevatedButton.icon(
  //                     style: ElevatedButton.styleFrom(
  //                       shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(20)),
  //                       foregroundColor: Colors.white,
  //                       backgroundColor: Theme.of(context).primaryColor,
  //                     ),
  //                     icon: Icon(
  //                       Icons.image,
  //                       size: 25,
  //                     ),
  //                     onPressed: () {
  //                       setState(() {
  //                         profilePic = "";
  //                       });
  //                       Navigator.pop(context);
  //                     },
  //                     label: Text(
  //                       "Remove ProfilePic",
  //                       style: TextStyle(
  //                           fontSize: 20, fontWeight: FontWeight.w700),
  //                     ),
  //                   )
  //           ],
  //         ),
  //       ),
  //     ),
  //     context: context,
  //   );
  // }
}
