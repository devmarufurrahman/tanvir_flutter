import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  final pageController = PageController();
  final currentIndex = 0.obs;



  final List<String> images = [
    'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/home.jpg-5CejkTcSxNmhSFs0vKjQgS1NVWGW2z.jpeg',
    'https://via.placeholder.com/400x250/4CAF50/FFFFFF?text=Slide+2',
    'https://via.placeholder.com/400x250/2196F3/FFFFFF?text=Slide+3',
  ];

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      int nextPage = (currentIndex.value + 1) % images.length;
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
      currentIndex.value = nextPage;
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }

}