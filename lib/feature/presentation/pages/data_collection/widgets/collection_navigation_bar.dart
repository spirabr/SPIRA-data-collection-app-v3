import 'package:flutter/material.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_back_button.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_next_button.dart';

class CollectionNavigationBar extends StatelessWidget {
  const CollectionNavigationBar({
    super.key,
    required this.onPressedNext,
    required this.onPressedBack,
    this.firstPage = false,
  });

  final VoidCallback onPressedNext;
  final VoidCallback onPressedBack;
  final bool firstPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      width: double.maxFinite,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 20,
      ),
      child: Row(
        children: [
          Expanded(
              child: CollectionBackButton(
            onPressed: onPressedBack,
            firstPage: firstPage,
          )),
          const SizedBox(width: 8),
          Expanded(child: CollectionNextButton(onPressed: onPressedNext)),
        ],
      ),
    );
  }
}
