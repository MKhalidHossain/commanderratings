import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/title_with_icon_prefix.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommandersDetails extends StatefulWidget {
  const CommandersDetails({super.key});

  @override
  State<CommandersDetails> createState() => _CommandersDetailsState();
}

class _CommandersDetailsState extends State<CommandersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: TitleWithIconPrefix(fontSize: 12, text: 'COMMANDER'),
        centerTitle: true,
        leadingWidth: 60,
        actions: [SizedBox(width: 60)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/banner/banner_for_commanders_details.png',
                    opacity: const AlwaysStoppedAnimation(.9),
                    fit: BoxFit.cover,
                    height: 300,
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
            ),

            //.................................... After Banner section CNontent.........................................
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.context(context).contentBoxGreyColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Name:'),
                              const SizedBox(width: 8.0),
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  color: AppColors.context(context).textColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          //................. need to star add............
                          Row(children: [Text('Individual Rating:')]),
                          Row(children: [Text('Overall Rating:')]),
                        ],
                      ),
                    ),

                    //.................................... Leave a Review section with white border..........................
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.context(context).contentBoxGreyColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Text('data'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
