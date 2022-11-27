import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double height;

  const VerticalSpace({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: height,
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  final double width;

  const HorizontalSpace({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: width,
    );
  }
}

class StandardDivider extends StatelessWidget {
  final double height;
  final double thickness;

  const StandardDivider({super.key, required this.height, required this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
    );
  }
}