import 'package:flutter/material.dart';

//ClickableImage needs to be a stateful widget
class ClickableImage extends StatefulWidget {
  final String img;
  final int imgnum;

  const ClickableImage({
    super.key,
    required this.img,
    required this.imgnum,
  });

  @override
  State<ClickableImage> createState() => _ClickableImageState();
}

class _ClickableImageState extends State<ClickableImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('You clicked image ${widget.imgnum + 1}.');
      },
      child: SizedBox(
        height: 125,
        width: 110,
        child: Image.asset(
          widget.img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
