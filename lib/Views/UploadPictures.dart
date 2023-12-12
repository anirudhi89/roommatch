import 'package:flutter/material.dart';
import 'package:roommatch/Views/swipeOnPpl.dart';

class UploadPictures extends StatelessWidget {
  final List<String> placeholderImages = [
    'images/roommatchdude.jpg',
    'images/roommatchdude.jpg',
    'images/roommatchdude.jpg',
    'images/roommatchdude.jpg',
    'images/roommatchdude.jpg',
    'images/roommatchdude.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Pictures'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: placeholderImages.length,
                itemBuilder: (context, index) {
                  return PlaceholderImage(
                    imagePath: placeholderImages[index],
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SwipeOnPpl(),
                    ),
                  );
                },
                child: Text('Upload Pictures'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceholderImage extends StatelessWidget {
  final String imagePath;

  PlaceholderImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
