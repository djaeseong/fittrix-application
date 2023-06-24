import 'package:flutter/material.dart';

class ListBottomSheet extends StatelessWidget {
  final Widget child;
  const ListBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        top: true,
        bottom: true,
        child: Wrap(
          children: [
            Container(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
