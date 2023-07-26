import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/mytextform.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateVideoCategory extends StatefulWidget {
  const CreateVideoCategory({
    super.key,
  });

  @override
  State<CreateVideoCategory> createState() => _CreateVideoCategoryState();
}

final _formKey = GlobalKey<FormState>();
final TextEditingController _categoryName = TextEditingController();

class _CreateVideoCategoryState extends State<CreateVideoCategory> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<CategoryController>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Container(
              height: screenSize.height / 1.5,
              width: screenSize.width,
              padding: EdgeInsets.all(screenSize.width / 40),
              margin: EdgeInsets.symmetric(
                horizontal: screenSize.width < 800
                    ? screenSize.width / 15
                    : screenSize.width / 3,
                vertical: screenSize.height / 8,
              ),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create video Category',
                    style: style.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Text(
                        'Category Name',
                        style: style.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 300,
                        child: MyTextForm(
                          controller: _categoryName,
                          obscureText: false,
                          borderColor: Colors.transparent,
                          hintText: 'Enter Category name',
                          fillColor: AppColor.primaryColor.withOpacity(0.1),
                          validatior: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter category name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(child: Container()),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await provider.addVideoCategory(
                            context: context,
                            name: _categoryName.text,
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
                          child: provider.isCreatingVideoCategory
                              ? buttonCircularIndicator
                              : Text(
                                  'Create',
                                  style: style.copyWith(
                                    fontSize: 14,
                                    color: AppColor.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: screenSize.height / 20,
            right: screenSize.width / 3,
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
