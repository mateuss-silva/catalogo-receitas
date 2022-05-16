import 'package:flutter/material.dart';

class RatingStartsWidget extends StatelessWidget {
  final int? rating;
  const RatingStartsWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rating != null
        ? Row(
            children: [
              for (int i = 0; i < rating!; i++)
                Icon(Icons.star_rounded, color: Colors.yellow.shade700),
              for (int i = 0; i < 5 - rating!; i++)
                const Icon(Icons.star_rounded, color: Colors.grey),
            ],
          )
        : Row(children: const [
            Icon(Icons.auto_awesome, color: Colors.blue),
            SizedBox(width: 4),
            Text("Não avaliado"),
          ]);
  }
}
