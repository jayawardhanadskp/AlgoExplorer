import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/search_model.dart';
import '../../../providers/search/search_provider.dart';

class SearchIndicator<T extends SearchProvider> extends StatefulWidget {
  const SearchIndicator({
    super.key,
    required this.parentKey,
  });

  final GlobalKey parentKey;

  @override
  // ignore: library_private_types_in_public_api
  _SearchIndicatorState<T> createState() => _SearchIndicatorState<T>();
}

class _SearchIndicatorState<T extends SearchProvider>
    extends State<SearchIndicator<T>> with AfterLayoutMixin<SearchIndicator<T>> {
  var _position = Offset.zero;

  @override
  void afterFirstLayout(BuildContext context) {
    final numbers = Provider.of<T>(context, listen: false).numbers;
    setState(() {
      _position = _getIndicatorOffset(numbers[numbers.length ~/ 2]);
    });
  }

  Offset _getIndicatorOffset(SearchModel number) {
    try {
      final RenderBox? rObject = number.key.currentContext?.findRenderObject() as RenderBox?;
      final RenderBox? parentObject = widget.parentKey.currentContext?.findRenderObject() as RenderBox?;
      
      if (rObject != null && parentObject != null) {
        final parentPos = parentObject.localToGlobal(Offset.zero);
        final pos = rObject.globalToLocal(parentPos);
        return pos;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return Offset.zero;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (_, searchProvider, child) {
        for (var number in searchProvider.numbers) {
          if (number.state.value == SearchState.search) {
            _position = _getIndicatorOffset(number);
            break;
          }
        }
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          left: _position.dx,
          top: _position.dy,
          child: Visibility(visible: searchProvider.isSearching, child: child!),
        );
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
