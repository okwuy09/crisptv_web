import 'package:crisptv_media/component/color.dart';
import 'package:flutter/material.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({Key? key}) : super(key: key);

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.red,
                margin: const EdgeInsets.only(left: 20, right: 5),
                elevation: 0.5,
                child: Container(
                  height: screenSize.height / 3,
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: Colors.yellow,
                margin: const EdgeInsets.only(left: 5, right: 20),
                elevation: 0.5,
                child: Container(
                  height: screenSize.height / 3,
                ),
              ),
            ),
          ],
        ),
        // second
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.green,
                margin: const EdgeInsets.only(left: 20, right: 5),
                elevation: 0.5,
                child: Container(
                  height: screenSize.height / 3.5,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.blue,
                elevation: 0.5,
                child: Container(
                  height: screenSize.height / 3.5,
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: AppColor.primaryColor,
                margin: const EdgeInsets.only(left: 5, right: 20),
                elevation: 0.5,
                child: Container(
                  height: screenSize.height / 3.5,
                ),
              ),
            ),
          ],
        ),
        // third
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Card(
                color: Colors.deepOrange,
                margin: const EdgeInsets.only(left: 20, right: 5),
                elevation: 0.5,
                child: Container(height: screenSize.height / 2.8),
              ),
            ),
            Expanded(
              child: Card(
                color: Colors.purple,
                elevation: 0.5,
                child: Container(height: screenSize.height / 2.8),
              ),
            ),
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.brown,
                margin: const EdgeInsets.only(left: 5, right: 20),
                elevation: 0.5,
                child: Container(
                  height: screenSize.height / 2.8,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
