import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    this.height,
    this.width,
    this.bgColor,
    this.bdRadius,
    required this.child,
  });
  final Widget child;
  final double? height;
  final double? width;
  final Color? bgColor;
  final double? bdRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? double.infinity,
        alignment: Alignment.center,
        height: height ?? 52.h,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          borderRadius:
              BorderRadius.circular(bdRadius == null ? 12.r : bdRadius!),
        ),
        child: child);
  }
}
