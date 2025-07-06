import 'package:commanderratings/core/widgets/lebel_and_value_text.dart';
import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:commanderratings/features/commanders/presentations/widgets/customBoxContainer.dart';
import 'package:commanderratings/features/commanders/presentations/widgets/title_text_all_commanders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/ratting_a_to_z/ratting.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../domain/all_commanders_list_model.dart';
import '../screens/commanders_details.dart';

class CommandersCardWidget extends StatelessWidget {
  final Commanders card;
  const CommandersCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    print(card.name);
    Size size = MediaQuery.of(context).size;
    // String reviewedTime = '9 Hours Ago';
    return Column(
      children: [
        Customboxcontainer(
          width: size.width,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //........................................................................... need to calculate post __Times ago ......................................
                        TitleTextAllCommanders(
                          fontSize: 11,
                          text: card.yearOfExperience.toString(),
                        ),
                        ValueTextAeroMatics(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          text: card.name.toString() ?? 'Commander Name',
                        ),
                        ValueTextAeroMatics(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          text: card.serviceBroad!,
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:
                              (card.image == null || card.image!.isEmpty)
                                  ? Image.asset(
                                    'assets/icons/profile_placeholder.png',
                                    fit: BoxFit.cover,
                                    height: 70,
                                    width: 70,
                                  )
                                  : Image.network(
                                    card.image!,
                                    opacity: const AlwaysStoppedAnimation(0.9),
                                    fit: BoxFit.cover,
                                    height: 70,
                                    width: 70,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/icons/profile_placeholder.png',
                                        fit: BoxFit.cover,
                                        height: 70,
                                        width: 70,
                                      );
                                    },
                                  ),
                        ),

                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(
                        //     8,
                        //   ), // Adjust radius as needed
                        //   child: Image.network(
                        //     card.image ?? '',
                        //     opacity: const AlwaysStoppedAnimation(.9),
                        //     fit: BoxFit.cover,
                        //     height: 70,
                        //     width: 70,
                        //   ),
                        // ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8.0),

                Row(
                  children: [
                    Container(
                      width: size.width * .40,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * .01,
                        vertical: size.height * .001,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.context(context).contentBoxGreyColor,
                        border: Border.all(
                          color: Colors.red.shade400,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShowRating(
                            iconSize: 13,
                            rating: card.avgRating!.toDouble() ?? 0.0,
                          ),
                          Row(
                            children: [
                              ValueTextAeroMatics(
                                fontSize: 10,
                                text: 'Individual Rating: ',
                              ),
                              ValueTextAeroMatics(
                                fontSize: 11,
                                text:
                                    '${card.avgRating!.toStringAsFixed(1)} /10',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10.0),

                    Flexible(
                      child: NormalCustomButton(
                        height: 40,
                        weight: size.width * .40,
                        fontSize: 12,
                        text: 'Read More',
                        onPressed: () {
                          Get.to(
                            transition: Transition.fadeIn,
                            () => CommandersDetails(
                              commandersId: card.id.toString()!,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
