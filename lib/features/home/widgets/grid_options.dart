import 'package:flutter/material.dart';

class GridOptions extends StatelessWidget {
  const GridOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
        children: [
          _buildGridItem(
            icon: Icons.person_outline,
            iconColor: const Color(0xFF2196F3),
            title: 'আপনার অভিযোগ ও\nপরামর্শ জানান',
            onTap: () => print('Complaints tapped'),
          ),
          _buildGridItem(
            icon: Icons.attach_money,
            iconColor: const Color(0xFF4CAF50),
            title: 'চাঁদাবাজ ও মাদক\nব্যবসায়ীদের তথ্য দিন',
            onTap: () => print('Report tapped'),
          ),
          _buildGridItem(
            icon: Icons.image,
            iconColor: const Color(0xFFFF5722),
            title: 'বিএনপির ৩৯ দফা',
            onTap: () => print('BNP 39 points tapped'),
          ),
          _buildGridItem(
            icon: Icons.photo_library,
            iconColor: const Color(0xFF2196F3),
            title: 'গ্যালারি',
            onTap: () => print('Gallery tapped'),
          ),
          _buildGridItem(
            icon: Icons.contact_support,
            iconColor: const Color(0xFFFF9800),
            title: 'যোগাযোগ করুন',
            onTap: () => print('Contact tapped'),
          ),
          _buildGridItem(
            icon: Icons.info,
            iconColor: const Color(0xFF2196F3),
            title: 'আমার সম্পর্কে',
            onTap: () => print('About tapped'),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 30,
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
