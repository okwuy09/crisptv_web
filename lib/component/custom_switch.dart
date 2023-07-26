import 'package:crisptv/component/color.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Color? enableColor;
  final Color? disableColor;
  final double? width;
  final double? height;
  final double? switchHeight;
  final double? switchWidth;
  final ValueChanged<bool> onChanged;

  const CustomSwitch(
      {Key? key,
      this.value = false,
      this.enableColor,
      this.disableColor,
      this.width,
      this.height,
      this.switchHeight,
      this.switchWidth,
      required this.onChanged})
      : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: widget.width ?? 34.0,
            height: widget.height ?? 66.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: _circleAnimation!.value == Alignment.centerLeft
                  ? widget.disableColor
                  : widget.enableColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.topCenter : Alignment.bottomCenter,
                child: Container(
                  width: widget.switchWidth ?? 30.0,
                  height: widget.switchHeight ?? 32.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      //shape: BoxShape.circle,
                      color: widget.value
                          ? AppColor.gray
                          : AppColor.white.withOpacity(0.2) //: AppColor.white,
                      ),
                  child: Icon(
                    widget.value
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    color: widget.value
                        ? AppColor.white.withOpacity(0.8)
                        : AppColor.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
