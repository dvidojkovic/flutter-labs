import 'package:flutter/material.dart';
import '../models/exam_model.dart';

class ExamDetailData extends StatelessWidget {
  final Exam exam;

  const ExamDetailData({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final isPast = exam.date.isBefore(DateTime.now());
    final statusColor = isPast ? Colors.grey : Colors.green;
    final timeLeftDays = exam.date.day - DateTime.now().day;
    final timeLeftHours = exam.date.hour - DateTime.now().hour;
    final timeLeftMinutes = exam.date.minute - DateTime.now().minute;

    final totalInHours = (timeLeftDays * 24) + timeLeftHours + (timeLeftMinutes / 60);
    final calculatedDaysLeft = (totalInHours / 24).toInt();
    final calculatedHoursLeft = (totalInHours % 24).toInt();

    final calculatedTime = "$calculatedDaysLeft ${calculatedDaysLeft > 1 ? 'денa' : 'ден'} $calculatedHoursLeft ${calculatedHoursLeft > 1 ? 'часа' : 'час'}";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 3,
          )
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Детали за испитот',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          _infoRow(Icons.calendar_today, 'Датум', "${exam.date.day}.${exam.date.month}.${exam.date.year} ${exam.date.hour}:${exam.date.minute}h", color: statusColor),
          _infoRow(Icons.science, 'Лаборатории', exam.labs.join(', ')),

          if (!isPast)
            _infoRow(Icons.science, 'Преостанати денови', calculatedTime),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color ?? Colors.black54),
          const SizedBox(width: 8),
          Text(
            '$label:',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color ?? Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}