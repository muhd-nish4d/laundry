import 'package:flutter/cupertino.dart';

/*
Here =>
The chain named "Laundry"
1. WeirdBorder class its for making inverted rounded border
2. LaundyInvertedCard class its for making each "Laundry" peices
3. LaundryTokenFullList class its for creating the chain of "Laundry"
*/

class WeirdBorder extends ShapeBorder {
  final double? radius;
  final double pathWidth;

  const WeirdBorder({@required this.radius, this.pathWidth = 100});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect, textDirection: textDirection!), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      _createPath(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => WeirdBorder(radius: radius);

  Path _createPath(Rect rect) {
    final innerRadius = radius! + pathWidth;
    final innerRect = Rect.fromLTRB(rect.left + pathWidth, rect.top + pathWidth,
        rect.right - pathWidth, rect.bottom - pathWidth);

    final outer = Path.combine(PathOperation.difference, Path()..addRect(rect),
        _createBevels(rect, radius!));
    final inner = Path.combine(PathOperation.difference,
        Path()..addRect(innerRect), _createBevels(rect, innerRadius));
    return Path.combine(PathOperation.difference, outer, inner);
  }

  Path _createBevels(Rect rect, double radius) {
    return Path()
      ..addOval(
          Rect.fromCircle(center: Offset(rect.left, rect.top), radius: radius))
      ..addOval(Rect.fromCircle(
          center: Offset(rect.left + rect.width, rect.top), radius: radius))
      ..addOval(Rect.fromCircle(
          center: Offset(rect.left, rect.top + rect.height), radius: radius))
      ..addOval(Rect.fromCircle(
          center: Offset(rect.left + rect.width, rect.top + rect.height),
          radius: radius));
  }
}

class LaundyInvertedCard extends StatelessWidget {
  const LaundyInvertedCard({
    super.key,
    required this.tokenColor,
    required this.textColor,
  });
  final Color tokenColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      margin: const EdgeInsets.only(top: 24, bottom: 16),
      decoration: ShapeDecoration(
          shape: const WeirdBorder(radius: 7), color: tokenColor),
      child: Center(
        child:
            Text('Laundry', style: TextStyle(color: textColor, fontSize: 15)),
      ),
    );
  }
}

class LaundryTokenFullList extends StatelessWidget {
  const LaundryTokenFullList({
    super.key,
    this.bottom,
    this.left,
    this.angle,
    required this.tokenColor,
    required this.textColor,
  });
  final double? bottom;
  final double? left;
  final double? angle;
  final Color tokenColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      child: Transform.rotate(
        angle: angle! * (3.1415926535897932 / 180),
        child: Row(
          children: [
            LaundyInvertedCard(tokenColor: tokenColor, textColor: textColor),
            LaundyInvertedCard(tokenColor: tokenColor, textColor: textColor),
            LaundyInvertedCard(tokenColor: tokenColor, textColor: textColor),
            LaundyInvertedCard(tokenColor: tokenColor, textColor: textColor),
            LaundyInvertedCard(tokenColor: tokenColor, textColor: textColor),
          ],
        ),
      ),
    );
  }
}
