import 'package:crisptv_media/component/color.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatefulWidget {
  final Widget? image;
  final TextEditingController? controller;
  final BorderRadius? inputRadius;
  final void Function()? onSend, onImageRemoved;

  const CommentBox(
      {Key? key,
      this.image,
      this.controller,
      this.inputRadius,
      this.onSend,
      this.onImageRemoved})
      : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  Widget? image;

  @override
  void initState() {
    image = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 1,
          color: Colors.grey[300],
          thickness: 1,
        ),
        const SizedBox(height: 20),
        if (image != null)
          _removable(
            context,
            _imageView(context),
          ),
        if (widget.controller != null)
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              fillColor: AppColor.lightGray.withOpacity(0.2),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: widget.onSend,
              ),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: widget.inputRadius ?? BorderRadius.circular(32),
              ),
            ),
          ),
      ],
    );
  }

  Widget _removable(BuildContext context, Widget child) {
    return Stack(
      //alignment: Alignment.topRight,
      children: [
        child,
        Positioned(
          top: -5,
          right: -9.5,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(children: [
              IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: AppColor.white.withOpacity(0.6),
                ),
                onPressed: () {
                  setState(() {
                    image = null;
                    widget.onImageRemoved!();
                  });
                },
              )
            ]),
          ),
        )
      ],
    );
  }

  Widget _imageView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: image,
      ),
    );
  }
}
