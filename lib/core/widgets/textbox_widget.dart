import 'package:flutter/material.dart';

class TextboxWidget extends StatelessWidget {
  final String label;
  const TextboxWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1,
                  spreadRadius: 0,
                  offset: Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
