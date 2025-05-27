import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/app_colors.dart';

class CommanderDetailsHeader extends StatelessWidget {
  final String commanderImage;

  const CommanderDetailsHeader({super.key, required this.commanderImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(commanderImage, opacity: const AlwaysStoppedAnimation(.9),
              fit: BoxFit.cover,
              height: 300,),
          ),

          const SizedBox(height: 12.0),

          Row(
            children: [
              Image.asset(
                'assets/icons/commander_bedge.png',
                fit: BoxFit.cover,
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 5.0),
              Text(
                'Certified Great Leader',
                style: TextStyle(
                  color: AppColors.context(context).textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
