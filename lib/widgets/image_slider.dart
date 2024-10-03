import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import 'package:rideev_test/utils/app_colors.dart';

final currentImageProvider = StateProvider<int>((ref) => 0);

class ImageSlider extends ConsumerStatefulWidget {
  const ImageSlider({super.key});

  @override
  ConsumerState<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends ConsumerState<ImageSlider> {
  final List<String> images = [
    'assets/images/banner_1.png',
    'assets/images/banner_2.png',
    'assets/images/banner_3.png',
  ];

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      final currentImage = ref.read(currentImageProvider);
      ref.read(currentImageProvider.notifier).state =
          (currentImage + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentImage = ref.watch(currentImageProvider);

    return Stack(
      children: [
        SizedBox(
          height: 160, // Fixed height for the image slider
          width: double.infinity, // Ensures the images take full width
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: (index) {
              ref.read(currentImageProvider.notifier).state = index;
            },
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
              );
            },
          ),
        ),
        Positioned(
          bottom: 28, // Position the dots near the bottom of the image
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentImage != index ? AppColors.black : AppColors.primaryGreen,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
