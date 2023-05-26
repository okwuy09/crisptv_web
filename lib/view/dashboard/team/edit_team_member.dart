import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/mytextform.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/constant.dart';
import 'package:crisptv_media/model/category.dart';
import 'package:crisptv_media/model/team.dart';
import 'package:crisptv_media/service/category_controller.dart';
import 'package:crisptv_media/service/user_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:provider/provider.dart';

class EditTeamMemeber extends StatefulWidget {
  //String webImageUrl;
  final TeamMember teamMember;
  const EditTeamMemeber({super.key, required this.teamMember});

  @override
  State<EditTeamMemeber> createState() => _EditTeamMemeberState();
}

class _EditTeamMemeberState extends State<EditTeamMemeber> {
  TextEditingController? _userName;
  bool isHighLighted = false;

  Category? _selectedValue;
  late Stream<List<Category>> _category; //= 'Choose from the dropdown';
  String? _categoryName;
  String? _categoryID;
  @override
  void initState() {
    _categoryName = widget.teamMember.position;
    _categoryID = widget.teamMember.positionID;
    _userName = TextEditingController(text: widget.teamMember.userName);
    _category = Provider.of<CategoryController>(context, listen: false)
        .fetchAllTeamCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<UserController>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: screenSize.height / 1.5,
            width: screenSize.width,
            padding: EdgeInsets.all(screenSize.width / 40),
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
                Text(
                  'Edit Team Member Details',
                  style: style.copyWith(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: screenSize.height / 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenSize.height / 40),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            color: AppColor.primaryColor.withOpacity(0.5),
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
                                    ? AppColor.lightGray.withOpacity(0.2)
                                    : AppColor.lightGray.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.teamMember.imageUrl!),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenSize.height / 30),
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
                              hintText: 'Enter employee name',
                              fillColor: AppColor.primaryColor.withOpacity(0.1),
                            ),
                          ),
                          const SizedBox(height: 30),
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
                                    color:
                                        AppColor.primaryColor.withOpacity(0.1),
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
                                        borderRadius: BorderRadius.circular(8),
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
                                            _categoryID = newValue.id;
                                            _categoryName = newValue.name;
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
                          SizedBox(height: screenSize.height / 10),
                          InkWell(
                            onTap: () async {
                              await provider.updateTeamMember(
                                  context: context,
                                  userName: _userName!.text,
                                  position: _categoryName!,
                                  positionID: _categoryID!,
                                  docID: widget.teamMember.id);
                            },
                            child: Container(
                              height: 45,
                              width: 250,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: provider.isUpdatingMember
                                    ? buttonCircularIndicator
                                    : Text(
                                        'Update Team Member Details',
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
                    )
                  ],
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
}
