import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:commanderratings/features/commanders_call/controllers/commanders_calls_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/title_subtitle_text.dart';
import '../../../commanders_call/domain/model/get_all_blog_service_model.dart';
import '../../../commanders_call/presentations/screens/call_of_commander_screen.dart';


class LeadershipSection extends StatefulWidget {
  const LeadershipSection({super.key});

  @override
  State<LeadershipSection> createState() => _LeadershipSectionState();
}

class _LeadershipSectionState extends State<LeadershipSection> {
  // List of military branches with placeholder image URLs
  final List<Map<String, String>> militaryBranches = const [
    {
      'imageUrl': 'https://via.placeholder.com/300x200/0000FF/FFFFFF?text=NAVY',
      'label': 'NAVY',
    },
    {
      'imageUrl':
          'https://via.placeholder.com/300x200/87CEEB/FFFFFF?text=AIR+FORCE',
      'label': 'AIR FORCE',
    },
    {
      'imageUrl':
          'https://via.placeholder.com/300x200/1E90FF/FFFFFF?text=COAST+GUARD',
      'label': 'COAST GUARD',
    },
    {
      'imageUrl':
          'https://via.placeholder.com/300x200/8B0000/FFFFFF?text=US+MARINES',
      'label': 'US MARINES',
    },
    {
      'imageUrl':
          'https://via.placeholder.com/300x200/000000/FFFFFF?text=SPACE+FORCE',
      'label': 'SPACE FORCE',
    },
    {
      'imageUrl': 'https://via.placeholder.com/300x200/228B22/FFFFFF?text=ARMY',
      'label': 'ARMY',
    },
  ];


  late GetAllBlogResponseModel getAllBlogResponseModel;

  @override
  void initState() {
    Get.find<CommandersCallsController>().getAllCommandersCall().then((_) {
      final controller = Get.find<CommandersCallsController>();
      if (controller.getAllBlogResponseModel != null &&
          controller.getAllBlogResponseModel.data != null &&
          controller.getAllBlogResponseModel.data!.blogs != null) {
        setState(() {
          getAllBlogResponseModel =
              controller.getAllBlogResponseModel;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth =
        (screenWidth - 16 * 2 - 10) / 2; // Account for padding and spacing

    return GetBuilder<CommandersCallsController>(
        builder: (commandersCallsController){
          return !commandersCallsController.isLoading ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                TitleText(
                  text: 'LEADERSHIP AT EVERY LEVEL',
                  color: AppColors.context(context).textColor,
                ),

                const SizedBox(height: 8),
                SubTitleText(
                  text:
                  'Explore how military commanders shape their units, their responsibilities, and their leadership effectiveness based on real experiences.',
                  color: AppColors.context(context).textColor,
                ),

                GridView.count(
                  padding: EdgeInsets.only(top: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5, // Adjust this for your desired aspect ratio
                  children:
                  commandersCallsController.getAllBlogResponseModel.data!.blogs!
                      .map(
                        (branch) => GestureDetector(
                          onTap: (){
                            Get.to(CallOfCommanderScreen(id: branch.sId!,));
                          },
                          child: _buildImageTile(
                                                branch.image!,
                                                branch.title!,
                                                itemWidth,
                                              ),
                        ),
                  )
                      .toList(),
                ),
                const SizedBox(height: 10),
                Center(
                  child: NormalCustomButton(text: "View More", onPressed: () {}),
                ),
              ],
            ),
          ) : Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }
}

class _buildImageTile extends StatelessWidget {
  const _buildImageTile(this.imageUrl, this.label, this.width);

  final String imageUrl;
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Optional: for rounded corners
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black54,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
