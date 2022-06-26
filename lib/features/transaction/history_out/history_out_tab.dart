import 'package:desktop_base/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HistoryOutTab extends StatelessWidget {
  const HistoryOutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Out Product'),
            ],
          ),
        ),
      ),
    );
  }
}
