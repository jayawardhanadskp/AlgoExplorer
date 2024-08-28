
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../providers/search/search_provider.dart';

class Search<T extends SearchProvider> extends StatefulWidget {
  const Search({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SearchState<T> createState() => _SearchState<T>();
}

class _SearchState<T extends SearchProvider> extends State<Search<T>> {
  final searchController = TextEditingController();

  void _search() {
    try {
      final val = int.parse(searchController.text);
      Provider.of<T>(context, listen: false).search(value: val);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 100,
          
          child: TextField(
            controller: searchController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              focusColor: Color(0xFF219C90),
              labelText: 'Value',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF219C90), width: 2.0), // Set the focused border color
              ),
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
          ),
        ),
       const SizedBox(width: 20,),

        Selector<T, bool>(
          selector: (_, provider) => provider.isSearching,
          builder: (_, isSearching, child) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF219C90),
              disabledBackgroundColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )
              ),
              
              onPressed: isSearching ? null : _search,
              child: child,
            );
          },
          child: const Text('Search', style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}
