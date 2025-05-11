import 'package:commanderratings/core/ratting_a_to_z/ratting.dart';
import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/title_with_icon_prefix.dart';
import 'package:commanderratings/features/commander_details/presentation/widgets/commander_details_header.dart';
import 'package:commanderratings/features/commander_details/presentation/widgets/container_for_commander_details.dart';
import 'package:commanderratings/features/commander_details/presentation/widgets/lebel_and_value_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../widgets/bottom_sheet_leave_a_review.dart';
import '../widgets/search_and_recent_widget.dart';
import '../widgets/user_reveiws_widgets.dart';

class CommandersDetails extends StatefulWidget {
  const CommandersDetails({super.key});

  @override
  State<CommandersDetails> createState() => _CommandersDetailsState();
}

class _CommandersDetailsState extends State<CommandersDetails> {
  //late TextEditingController _searchController;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8.0),
              CommanderDetailsHeader(),
              //.................................... After Banner section CNontent.........................................
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.context(context).contentBoxColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                LabelText(text: 'Name:'),
                                const SizedBox(width: 8.0),
                                ValueTextAeroMatics(text: 'Doniel J. Merlkh'),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            ShowRating(rating: 5.5),
                            const SizedBox(height: 8.0),

                            //................. need to star add............
                            Row(
                              children: [
                                LabelText(text: 'Individual Rating: '),
                                ValueTextAeroMatics(text: '5.5/10'),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                LabelText(text: 'Overall Rating: '),
                                ValueTextAeroMatics(text: '#5/59'),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    AppColors.context(
                                      context,
                                    ).contentBoxGreyColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Service Branches: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          'assets/images/commander/commander_bedge.svg',
                                          semanticsLabel: 'My SVG image asset',
                                          height: 30,
                                          width: 30,
                                        ),
                                        ContainerForCommanderDetails(
                                          text: 'Air force',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        LabelText(text: 'Unit:'),
                                        const SizedBox(width: 20),
                                        ContainerForCommanderDetails(
                                          width: 210,
                                          text: '36th Security Forces Squadron',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        LabelText(text: 'Unit:'),
                                        const SizedBox(width: 20),
                                        ContainerForCommanderDetails(
                                          width: 210,
                                          text: 'Andersen Air Force Base, Guam',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        LabelText(text: 'Rank:'),
                                        const SizedBox(width: 20),
                                        ContainerForCommanderDetails(
                                          width: 100,
                                          text: '04 - Major',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 60,
                        indent: 60,
                      ),
                      Center(
                        child: Text(
                          'Notify us commander info changes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      ),

                      //.................................... Leave a Review section with white border..........................
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.context(context).contentBoxColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              color: AppColors.context(context).borderColor,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //.................................... Leave a Review button..........................
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    alignment: Alignment.center,
                                    side: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 8,
                                    ),
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext contex) {
                                        // ......bottom sheet content..........
                                        return BottomSheetLeaveAReview();
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Leave a Review',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32.0),
                                LabelText(text: 'user Rating (1)'),
                                const SizedBox(height: 8.0),
                                ValueTextAeroMatics(text: 'Overall '),
                                const SizedBox(height: 32.0),
                                ShowRating(rating: 8.5),
                                const SizedBox(height: 8),
                                ValueTextAeroMatics(text: '8.5'),
                                const SizedBox(height: 8.0),
                                ValueTextAeroMatics(
                                  text:
                                      'Tactical Competence: Now Effectively Does the commander make operational decisions during Mission: Or Exercise? Are they tactically sound and capable of leading during high pressure Solution',
                                ),
                                const SizedBox(height: 32.0),

                                //
                                const SizedBox(height: 32.0),

                                //SearchBar(controller: _searchController),

                                //.................................... Search section with white border..........................
                                // OutlinedTextFieldWidget(
                                //   controller: controller,
                                //   name: 'search',
                                //   textInputType: textInputType,
                                //   textFieldHeaderName: 'Search',
                                // ),
                                SearchAndRecentWidget(),
                                const SizedBox(height: 32.0),

                                UserReveiwsWidgets(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
