import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanvir_ahmed_robin/features/home/controller/home_screen_controller.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({Key? key}) : super(key: key);

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              itemCount: controller.images.length,
              onPageChanged: (index) {
                controller.currentIndex.value = index;
              },
              itemBuilder: (context, index) {
                return Image.network(
                  controller.images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF4CAF50),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            // Page Indicators
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.images.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentIndex.value == entry.key
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
                  );
                }).toList(),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
