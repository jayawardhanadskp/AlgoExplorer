
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/sort/sort_provider.dart';

class SortButton<T extends SortProvider> extends StatelessWidget {
  const SortButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Selector<T, bool>(
        selector: (_, provider) => provider.isSorting,
        builder: (_, isSorting, child) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF219C90),
            disabledBackgroundColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            )
            ),
            onPressed: isSorting
                ? null
                : () {
                    Provider.of<T>(context, listen: false).sort();
                  },
            child: child,
          );
        },
        child: const Text('Sort', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
