library custom_tabbar_indicator;

import 'package:flutter/material.dart';

/// Custom TabBar Indicator
class CustomTabBarIndicator extends Decoration {
  final Color color;

  CustomTabBarIndicator(this.color);

  @override
  _IndicatorPainter createBoxPainter([VoidCallback onChanged]) {
    return new _IndicatorPainter(this, onChanged, color);
  }
}

class _IndicatorPainter extends BoxPainter {
  final CustomTabBarIndicator decoration;
  final Color color;

  _IndicatorPainter(this.decoration, VoidCallback onChanged, this.color)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    final paint = Paint()
      ..color = color ?? Colors.black
      ..style = PaintingStyle.fill;

    var path = Path() // triangle
      ..moveTo(offset.dx + configuration.size.width / 2 + 5, (configuration.size.height - 4))
      ..lineTo(offset.dx + configuration.size.width / 2 - 5, (configuration.size.height - 4))
      ..lineTo(offset.dx + configuration.size.width / 2, (configuration.size.height - 12))
      ..close();

    var botBarRect = RRect.fromRectAndCorners(
      Offset(offset.dx, (configuration.size.height - 4)) & Size(configuration.size.width, 4),
      topRight: Radius.circular(8),
      topLeft: Radius.circular(8),
    );

    canvas.drawPath(path, paint);
    canvas.drawRRect(botBarRect, paint);
  }
}
