import 'package:flutter/material.dart';

class ToCartButton extends StatelessWidget {
  const ToCartButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 67.0,
      width: 350.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 1.0),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          icon: const Icon(Icons.shopping_bag_outlined, size: 24),
          label: const Text(
            'В КОРЗИНУ',
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Montserrat',
            ),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
