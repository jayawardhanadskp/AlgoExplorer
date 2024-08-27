
import 'package:flutter/material.dart';

import '../../providers/sort/sort_provider.dart';
import '../widgets/sort/sort_button.dart';
import '../widgets/sort/sort_speed.dart';
import '../widgets/sort/sort_visualizer.dart';

class SortPage<T extends SortProvider> extends StatelessWidget {
  const SortPage({super.key, required this.title, this.blockSize = 100})
      // ignore: unnecessary_null_comparison
      : assert(title != null);

  final String title;
  final double blockSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
            ),
            //Cannot be const
            Expanded(
              child: SizedBox(  
                width: constraints.maxWidth,
                child: Center(
                  child: SortVisualizer<T>(
                    blockSize: blockSize,
                    width: constraints.maxWidth,
                  ),
                ),
              ),
            ),
            SortSpeed<T>(),
            SortButton<T>(),
          ],
        ),
      );
    });
    // return
  }
}
