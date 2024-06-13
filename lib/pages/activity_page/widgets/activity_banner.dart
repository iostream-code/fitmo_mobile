import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ActivityBanner extends StatelessWidget {
  const ActivityBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/running_1.jpg',
      'assets/walking.jpeg',
      'assets/body_workout.jpg',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: CarouselSlider(
        items: [
          // for (var img in images) imageCarousel(img),
          for (var img in images)
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(.3), BlendMode.lighten),
                ),
              ),
            ),
        ],
        options: CarouselOptions(
          height: 150.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}
