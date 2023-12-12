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
            flex: 2, // Adjust the flex value to control the image's height
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
          SizedBox(height: 16.0), // Add space between the images and the button
          Expanded(
            flex: 1, // Adjust the flex value to control the button's height
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button click here
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
