import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  final String pickedDate;
  final Function()? onPressed;
  const DateField({Key? key, required this.pickedDate, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Container(
      height: 40,
      width: 270,
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        // border: Border.all(
        //   color: AppColor.lightGray.withOpacity(0.2),
        // ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              pickedDate,
              style: style.copyWith(
                color: AppColor.primaryColor.withOpacity(0.6),
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: Container()),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.lightGray.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.calendar_month_outlined,
                size: 20,
                color: Color(0xff35383A),
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
