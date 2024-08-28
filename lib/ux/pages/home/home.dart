
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/screen_size.dart';
import '../../providers/pages_provider.dart';
import 'widgets/category_switcher.dart';
import 'widgets/configuration_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PagesProvider(),
      child: deviceScreenType(MediaQuery.of(context).size.width) ==
              DeviceScreenType.Desktop
          ?  const HomeDesktop()
          :  const HomeMobile(),
    );
  }
}

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFD8EFD3),
            Color(0xFF95D2B3),
          ]
        )
      ),
      child: const Column(
        children:  <Widget>[
          ConfigurationWidget(),
          Expanded(
            child: CategorySwitcher(),
          )
        ],
      ),
    );
  }
}

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        children:  <Widget>[
          Expanded(
            child: ConfigurationWidget(),
          ),
          Expanded(
            child: CategorySwitcher(),
          ),
        ],
      ),
    );
  }
}
