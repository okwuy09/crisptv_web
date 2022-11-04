import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

/// Usage:
/// CustomDropdown<String>(
//     items: ['A', 'B', 'C'],
//     onChanged: (val) => _selectedValue = val,
//     center: true,
//  ),
/// --> Remember: f.toString() at line 105 is @override String toString() in your class
// @override
// String toString() {
//   return name;
// }
class CustomDropdown<T> extends StatefulWidget {
  CustomDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.onInit,
    this.padding = const EdgeInsets.only(top: 10.0),
    this.height = 33,
    this.center = false,
    this.itemText,
  }) : super(key: key);

  /// list item
  List<T> items;

  /// onChanged
  void Function(T value) onChanged;

  /// onInit
  void Function(T value)? onInit;

  ///padding
  EdgeInsetsGeometry padding;

  /// container height
  double height;

  /// center
  bool center;

  String Function(String text)? itemText;

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  /// current selected value
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _initValue();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  /// set default selected value when init
  _initValue() {
    _selectedValue = widget.items[0];
    if (widget.onInit != null) widget.onInit!(_selectedValue as T);
  }

  _buildBody() {
    Color borderLine = AppColor.white.withOpacity(0.6);
    return Padding(
      padding: widget.padding,
      child: Row(
        mainAxisAlignment: (widget.center)
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: widget.height,
            padding: const EdgeInsets.only(left: 10.0),
            decoration: ShapeDecoration(
              color: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 0.8, style: BorderStyle.solid, color: borderLine),
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(focusColor: AppColor.lightGray),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  dropdownColor: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                  value: _selectedValue,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedValue = newValue;
                      widget.onChanged(newValue as T);
                    });
                  },
                  items: widget.items.map((T f) {
                    return DropdownMenuItem<T>(
                      value: f,
                      child: Text(
                        (widget.itemText != null)
                            ? widget.itemText!(f.toString())
                            : f.toString(),
                        style: style.copyWith(
                          fontSize: 13,
                          color: AppColor.white.withOpacity(0.6),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
