import 'package:flutter/material.dart';
import 'package:land/provider/lands_provider.dart';
import 'package:land/widgets/land_widget.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final landsProvider = Provider.of<LandsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Land'),
      ),
      body: GridView.builder(
        itemCount: 26,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          var land = landsProvider.lands[index];
          return LandWidget(
            location: land.location,
            price: land.price,
            size: land.price,
            image: land.image,
          );
        },
      ),
    );
  }
}
