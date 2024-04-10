import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:land/provider/make_payment_provider.dart';
import 'package:provider/provider.dart';

class SellPage extends StatelessWidget {
  const SellPage({super.key});

  @override
  Widget build(BuildContext context) {
    final landProvider = Provider.of<MakePaymentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sell"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Location"),
              onChanged: (value) {
                landProvider.location = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Size"),
              onChanged: (val) {
                landProvider.size = val;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Owner"),
              onChanged: (val) {
                landProvider.owner = val;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Description"),
              onChanged: (value) {
                landProvider.description = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Price"),
              onChanged: (val) {
                landProvider.price = val;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();

                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);

                    if (image != null) {
                      landProvider.image = image.path;
                    }
                  },
                  child: const Text("Pick Image")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    await landProvider.uploadLand(context);
                  },
                  child: const Text("SUBMIT")),
            )
          ],
        ),
      ),
    );
  }
}
