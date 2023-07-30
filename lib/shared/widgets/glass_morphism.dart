import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  const GlassMorphism({
    super.key,
    this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          borderRadius != null ? borderRadius : BorderRadius.circular(23),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 12,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.94,
          // height: 400,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.08),
            borderRadius:
                borderRadius != null ? borderRadius : BorderRadius.circular(23),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.08),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

String coverUrl = 'assets/images/zulmaury.jpg';
