
import 'package:flutter/material.dart';

import '../../../models/sort_model.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({
    required Key key,
    required this.number,
    required this.index,
    required this.widgetSize, required this.containerWidth,
  // ignore: unnecessary_null_comparison
  })  : assert(number != null && index != null && widgetSize != null),
        assert(index >= 0 && widgetSize > 30),
        super(key: key);

  final SortModel number;
  final int index;
  final double widgetSize;
  final double containerWidth;


  Offset _getPosition(double width) {
    final horizontalFit = width ~/ widgetSize;
    final leftOver = width - (horizontalFit * widgetSize);
    final verticalIndex = index ~/ horizontalFit;
    final horizontalIndex = index % horizontalFit;
    return Offset((widgetSize * horizontalIndex) + leftOver / 2,
        widgetSize * verticalIndex);
  }

  @override
  Widget build(BuildContext context) {
    final offset = _getPosition(containerWidth);

    var fontSize = 20.0;
    var borderRadius = 5.0;
    var borderWidth = 1.0;
    var borderColor = Colors.black54;
    if (number.state == SortState.sort) {
      fontSize = 32;
      borderRadius = 40.0;
      borderWidth = 2.0;
    } else if (number.state == SortState.sorted) {
      fontSize = 20;
      borderRadius = 5.0;
      borderWidth = 1.0;
      borderColor = Colors.green;
    }

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 2250),
      curve: Curves.elasticOut,
      left: offset.dx,
      top: offset.dy,
      child: SizedBox(
        width: widgetSize,
        height: widgetSize,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
                style: TextStyle(
                  color: number.color,
                  fontSize: fontSize,
                ),
                child: Text(
                  number.value.toString(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
