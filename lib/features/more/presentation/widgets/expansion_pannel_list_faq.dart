import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ExpansionPannelListFaq extends StatelessWidget {
  final List faqs;
  const ExpansionPannelListFaq({super.key, required this.faqs});

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      dividerColor: Colors.transparent,
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.symmetric(vertical: 10),
      children:
          faqs.map((faq) {
            return ExpansionPanelRadio(
              value: faq['id']!,
              headerBuilder:
                  (context, isExpanded) => ListTile(
                    title: Text(
                      maxLines: 5,
                      faq['question']!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.context(context).textColor,
                      ),
                    ),
                  ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  maxLines: 15,
                  faq['answer']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.context(context).textColor,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
