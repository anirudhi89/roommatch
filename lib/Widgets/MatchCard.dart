import 'package:flutter/material.dart';
import 'package:roommatch/Models/UnmatchedUserModel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MatchCard extends StatefulWidget {
  final UnmatchedUserModel user;
  final VoidCallback onLike;
  final VoidCallback onDislike;
  final VoidCallback onForceMatch;

  MatchCard({
    required this.user,
    required this.onLike,
    required this.onDislike,
    required this.onForceMatch,
  });

  @override
  _MatchCardState createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    int totalImages = widget.user.getImages().length;

    return Container(
      height: 700,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CarouselSlider(
                items: widget.user.getImages().map((imageAssetPath) {
                  return Stack(
                    children: [
                      Container(
                        height: 2 * 700 / 3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(imageAssetPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8.0,
                        right: 8.0,
                        child: Text(
                          '${_currentImageIndex + 1}/$totalImages',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 2 * 500 / 3,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.user.firstName} ${widget.user.lastName}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('Age: ${widget.user.age}'),
                    Text('College: ${widget.user.collegeName}'),
                    Text('About: ${widget.user.bio}'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: widget.onDislike,
                    child: Icon(Icons.thumb_down, size: 30, color: Colors.red),
                  ),
                  GestureDetector(
                    onTap: widget.onLike,
                    child: Icon(Icons.thumb_up, size: 30, color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: GestureDetector(
              onTap: widget.onForceMatch,
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Text(
                  'A',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
