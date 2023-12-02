import 'package:flutter/material.dart';

class CarouselLoading extends StatelessWidget {
  const CarouselLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
