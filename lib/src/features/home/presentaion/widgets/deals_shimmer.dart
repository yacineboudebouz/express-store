import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDeal extends StatelessWidget {
  const ShimmerDeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.white10,
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
