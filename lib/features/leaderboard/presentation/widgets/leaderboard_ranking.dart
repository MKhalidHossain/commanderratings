import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LeaderboardRanking extends StatefulWidget {
  const LeaderboardRanking({super.key});

  final List<Map<String, dynamic>> leaderboardData = const [
    {
      'name': 'John Doe',
      'rank': 1,
      'score': 100,
      'commanderCatagory': 'Air Force',
      'speciality': 'None',
    },
    {
      'name': 'John Doe',
      'rank': 1,
      'score': 100,
      'commanderCatagory': 'Air Force',
      'speciality': 'None',
    },
    {
      'name': 'John Doe',
      'rank': 1,
      'score': 100,
      'commanderCatagory': 'Air Force',
      'speciality': 'None',
    },
    {
      'name': 'John Doe',
      'rank': 1,
      'score': 100,
      'commanderCatagory': 'Air Force',
      'speciality': 'None',
    },
    {
      'name': 'John Doe',
      'rank': 1,
      'score': 100,
      'commanderCatagory': 'Air Force',
      'speciality': 'None',
    },
    {
      'name': 'John Doe',
      'rank': 1,
      'score': 100,
      'commanderCatagory': 'Air Force',
      'speciality': 'None',
    },
  ];

  @override
  State<LeaderboardRanking> createState() => _LeaderboardContentState();
}

class _LeaderboardContentState extends State<LeaderboardRanking> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.leaderboardData.length,
        itemBuilder: (context, index) {
          final data = widget.leaderboardData[index];
          return Container(
            height: 130,
            margin: const EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.context(context).contentBoxGreyColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('#' + data['rank'].toString()),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      data['score'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      data['name'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(data['commanderCatagory']),
                Text(data['speciality']),
              ],
            ),
          );
        },
      ),
    );
  }
}
