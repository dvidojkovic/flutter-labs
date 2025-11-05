import 'package:flutter/material.dart';
import '../models/exam_model.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final cardColor = exam.date.isBefore(now)
      ? Colors.red.shade100
      : Colors.yellow.shade500;

    return Card(
      color: cardColor,
      elevation: 2,
      margin: EdgeInsets.zero, // remove extra margin
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blueGrey.shade200, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0), // less padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.black54),
                const SizedBox(width: 4),
                Text(
                  "Датум: ${exam.date.day}.${exam.date.month}.${exam.date.year}",
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.science, size: 16, color: Colors.black54),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    exam.labs.join(', '),
                    style: const TextStyle(fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}