import 'dart:typed_data';

import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/mytextform.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/service/authentication_controller.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:provider/provider.dart';

class AddNewTeamMemeber extends StatefulWidget {
  const AddNewTeamMemeber({super.key});

  @override
  State<AddNewTeamMemeber> createState() => _AddNewTeamMemeberState();
}

final TextEditingController _userName = TextEditingController();
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();

class _AddNewTeamMemeberState extends State<AddNewTeamMemeber> {
  final _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String? webImageUrl;
  Uint8List? imagefile;
  String? imageName;
  late DropzoneViewController controller;
  bool isHighLighted = false;

  bool visiblePass = true;
  Category? _selectedValue;
  late Stream<List<Category>> _category; //= 'Choose from the dropdown';

  @override
  void initState() {
    _category = Provider.of<CategoryController>(context, listen: false)
        .fetchAllTeamCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<AuthenticationController>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            height: screenSize.height / 1.5,
            width: screenSize.width,
            padding: EdgeInsets.all(screenSize.width / 45),
            margin: EdgeInsets.symmetric(
              horizontal: screenSize.width < 800
                  ? screenSize.width / 15
                  : screenSize.width / 4.5,
              vertical: screenSize.height / 8,
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: screenSize.height / 40),
                            webImageUrl == null
                                ? DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: AppColor.lightGray.withOpacity(0.1),
                                    strokeWidth: 3,
                                    dashPattern: const [8, 4],
                                    padding: EdgeInsets.zero,
                                    radius: const Radius.circular(16),
                                    child: Container(
                                      height: screenSize.height / 2.3,
                                      width: screenSize.width / 4,
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: isHighLighted
                                            ? AppColor.lightGray
                                                .withOpacity(0.2)
                                            : AppColor.lightGray
                                                .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Stack(
                                        children: [
                                          DropzoneView(
                                            onCreated: (controller) =>
                                                this.controller = controller,
                                            onHover: () => setState(
                                                () => isHighLighted = true),
                                            onLeave: () => setState(
                                                () => isHighLighted = false),
                                            onDrop: acceptFile,
                                          ),
                                          Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.cloud_upload,
                                                  size: 50,
                                                  color: AppColor.white,
                                                ),
                                                Text(
                                                  'Drag and drop  the video here',
                                                  style: style.copyWith(
                                                    color: AppColor.primaryColor
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  '(acceptable file formats: .MP4, .MOV, .MKV)',
                                                  style: style.copyWith(
                                                    color: AppColor.primaryColor
                                                        .withOpacity(0.5),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                                Text(
                                                  '------------------ OR ------------------',
                                                  style: style.copyWith(
                                                    fontSize: 12,
                                                    color: AppColor.primaryColor
                                                        .withOpacity(0.8),
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                                InkWell(
                                                  onTap: () async {
                                                    final events =
                                                        await controller
                                                            .pickFiles();
                                                    if (events.isEmpty) return;
                                                    acceptFile(events.first);
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      color: AppColor.lightGray,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Select the file from your device',
                                                        style: style.copyWith(
                                                          fontSize: 12,
                                                          color: AppColor.white
                                                              .withOpacity(0.8),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: screenSize.height / 2.3,
                                    width: screenSize.width / 4,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      //color: AppColor.gray,
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          image: NetworkImage(webImageUrl!),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final events =
                                                await controller.pickFiles();
                                            if (events.isEmpty) return;
                                            acceptFile(events.first);
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 116,
                                            decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Change Cover',
                                                style: style.copyWith(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ]),
                    ),
                    SizedBox(width: screenSize.width / 40),
                    Expanded(
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //SizedBox(height: screenSize.height / 30),
                            Text(
                              'Name',
                              style: style.copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 40,
                              width: 250,
                              child: MyTextForm(
                                controller: _userName,
                                obscureText: false,
                                borderColor: Colors.transparent,
                                hintText: 'Team Member Name',
                                fillColor:
                                    AppColor.primaryColor.withOpacity(0.1),
                                validatior: (input) => (input!.isEmpty)
                                    ? "Enter Member Name"
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Email',
                              style: style.copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 40,
                              width: 250,
                              child: MyTextForm(
                                controller: _email,
                                obscureText: false,
                                borderColor: Colors.transparent,
                                hintText: 'Team Member email',
                                fillColor:
                                    AppColor.primaryColor.withOpacity(0.1),
                                validatior: (input) =>
                                    !(input?.contains('@') ?? false)
                                        ? "Enter your email address"
                                        : null,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Password',
                              style: style.copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 40,
                              width: 250,
                              child: MyTextForm(
                                controller: _password,
                                obscureText: visiblePass,
                                borderColor: Colors.transparent,
                                hintText: 'e.g *******',
                                fillColor:
                                    AppColor.primaryColor.withOpacity(0.1),
                                suffixIcon: InkWell(
                                  onTap: () => setState(() {
                                    visiblePass = !visiblePass;
                                  }),
                                  child: Icon(
                                    visiblePass
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color:
                                        AppColor.primaryColor.withOpacity(0.5),
                                  ),
                                ),
                                validatior: (input) =>
                                    (input != null && input.length < 6)
                                        ? "Enter valid password"
                                        : null,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Position',
                              style: style.copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 5),
                            StreamBuilder<List<Category>>(
                              stream: _category,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Container();
                                } else {
                                  var category = snapshot.data!;
                                  return Container(
                                    height: 40,
                                    width: 250,
                                    padding: const EdgeInsets.only(left: 10.0),
                                    decoration: ShapeDecoration(
                                      color: AppColor.primaryColor
                                          .withOpacity(0.1),
                                      shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.8,
                                          style: BorderStyle.solid,
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                    ),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        focusColor:
                                            AppColor.lightGray.withOpacity(0.1),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<Category>(
                                          dropdownColor: AppColor.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          hint: Text(
                                            'Select Position',
                                            style: style.copyWith(
                                              fontSize: 13,
                                              color: AppColor.primaryColor
                                                  .withOpacity(0.6),
                                            ),
                                          ),
                                          value: _selectedValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _selectedValue = newValue!;
                                            });
                                          },
                                          items: category.map((f) {
                                            return DropdownMenuItem<Category>(
                                              value: f,
                                              child: Text(
                                                f.name.toString().toUpperCase(),
                                                style: style.copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.6),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenSize.height / 22),
                InkWell(
                  onTap: imagefile == null
                      ? null
                      : () async {
                          if (_formkey.currentState!.validate()) {
                            await provider.signUp(
                              context: context,
                              fullName: _userName.text,
                              userImage: imagefile!,
                              imageName: imageName!,
                              position: _selectedValue!.name,
                              positionID: _selectedValue!.id,
                              email: _email.text,
                              password: _password.text,
                            );
                          }
                        },
                  child: Container(
                    height: 45,
                    width: 250,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: provider.isSignUp
                          ? buttonCircularIndicator
                          : Text(
                              'Add Team Member',
                              style: style.copyWith(
                                fontSize: 14,
                                color: AppColor.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenSize.height / 20,
            right: screenSize.width / 4.5,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 37,
                width: 69,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'CLOSE',
                    style: style.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future acceptFile(dynamic event) async {
    final url = await controller.createFileUrl(event);
    final file = await controller.getFileData(event);
    final name = await controller.getFilename(event);

    setState(() {
      isHighLighted = false;
      imagefile = file;
      imageName = name;
      webImageUrl = url;
    });
  }
}
