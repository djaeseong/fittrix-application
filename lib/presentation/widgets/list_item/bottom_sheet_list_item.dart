import 'package:flutter/material.dart';

class BottomSheetListItem extends StatelessWidget {
  final String label;
  final Function() onTap;

  const BottomSheetListItem({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Text(label),
      ),
    );
  }
}
