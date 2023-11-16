import 'package:flutter/material.dart';

class ClickableImage extends StatelessWidget {
  final int num;
  //Will keep this constructor to have alternate text for images
  const ClickableImage({
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(28),
        //TODO: replace text with profile picture
        child: Text(
          'Image $num',
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
