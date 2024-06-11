import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActionButton extends StatelessWidget {
  final String labelButton;
  final Icon iconButton;
  final Color colorButton;

  const ActionButton({
    super.key,
    required this.labelButton,
    required this.iconButton,
    required this.colorButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FloatingActionButton.extended(
        foregroundColor: Colors.black,
        onPressed: () {
          SystemNavigator.pop(
            animated: true,
          );
        },
        heroTag: labelButton,
        elevation: 3,
        backgroundColor: colorButton,
        label: Text(labelButton),
        icon: iconButton,
      ),
    );
  }
}
