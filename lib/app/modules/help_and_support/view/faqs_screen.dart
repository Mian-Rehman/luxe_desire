import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key, required this.title, required this.desc});
  final String title, desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkThemeColor.primary,
        title: Text(
          'FAQs',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Readex Pro',
                color: DarkThemeColor.alternate,
                fontSize: 19,
              ),
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              desc,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
