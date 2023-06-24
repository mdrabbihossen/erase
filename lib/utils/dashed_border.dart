import 'package:erase/utils/dotted_custom_paint.dart';
import 'package:flutter/material.dart';

class DashedBorder extends StatefulWidget {
  final Color? color;
  final double strokeWidth;
  final double dotsWidth;
  final double gap;
  final double radius;
  final Widget child;
  final EdgeInsets? padding;

  const DashedBorder({
    Key? key,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dotsWidth = 5.0,
    this.gap = 3.0,
    this.radius = 0,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  State<DashedBorder> createState() => _DashedBorderState();
}

class _DashedBorderState extends State<DashedBorder> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedCustomPaint(
color: widget.color,
        dottedLength: widget.dotsWidth,
        dottedSpace: widget.gap,
        strokeWidth: widget.strokeWidth,
        radius: widget.radius,
      ),
      child: Container(
        padding: widget.padding??const EdgeInsets.all(2),
        child: widget.child,
      ),
    );
  }
}
