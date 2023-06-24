import 'package:flutter/material.dart';

class WorkoutRecordListItem extends StatelessWidget {
  final String workoutCreatedAt;
  final String workoutRemark;

  const WorkoutRecordListItem({
    super.key,
    required this.workoutCreatedAt,
    required this.workoutRemark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                )),
            child: Text(workoutCreatedAt),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
            child: Text(workoutRemark),
          ),
        ],
      ),
    );
  }
}
