import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:housecretary/theme.dart';

class HouseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String address;

  const HouseCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16), // Outer image rounding
      child: Stack(
        children: [
          // Background image
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
          ),

          // Frosted Glass Blur Overlay
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.25),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Color.fromRGBO(255, 255, 255, 0.25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        address,
                        style: whiteTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
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
