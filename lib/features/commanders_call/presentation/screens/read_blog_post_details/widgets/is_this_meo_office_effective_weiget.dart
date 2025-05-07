import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/image_button_container.dart';
import '../../../../../../core/widgets/normal_custom_button.dart';
import '../../../../../../core/widgets/title_subtitle_text.dart';

class IsThisMeoOfficeEffectiveWeiget extends StatefulWidget {
  const IsThisMeoOfficeEffectiveWeiget({super.key});

  @override
  State<IsThisMeoOfficeEffectiveWeiget> createState() =>
      _IsThisMeoOfficeEffectiveWeigetState();
}

class _IsThisMeoOfficeEffectiveWeigetState
    extends State<IsThisMeoOfficeEffectiveWeiget> {
  final borderColor = Colors.white;
  final redColor = Colors.red;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final List<Map<String, String>> submittedMessages = [];

  void handleSubmit() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final message = messageController.text.trim();

    if (name.isNotEmpty && email.isNotEmpty && message.isNotEmpty) {
      setState(() {
        submittedMessages.add({
          'name': name,
          'email': email,
          'message': message,
        });
        nameController.clear();
        emailController.clear();
        messageController.clear();
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Message submitted!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFFFFFFF),
                  // top: BorderSide(color: Color(0xFFFFFFFF)),
                  // left: BorderSide(color: Color(0xFFFFFFFF)),
                  // right: BorderSide(color: Color(0xFFFFFFFF)),
                  // right: BorderSide(),
                  // bottom: BorderSide(),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SubTitleText(
                            text:
                                "The Military Equal Opportunity (MEO) office plays a crucial role in maintaining fairness and equity within the military. Discrimination based on protected statuses has no place in the U.'S. military, and MEO provides service members with a formal avenue to report suspected discrimination for review and investigation. /These investigations are conducted by impartial third parties to eliminate bias and ensure a fair and just process/.\n",
                            color: AppColors.context(context).textColor,
                          ),
                          SubTitleText(
                            text:
                                "Once an investigation is completed, MEO generates a report and forwards it to the accused individual’s commander for review. If disciplinary action is warranted, the commander has the authority to administer non-judicial punishment. However, this is where the system begins to break down. With commanders holding full discretion over punishments—often without oversight from higher authorities—outcomes can be inconsistent and, at times, unjust. One service member may receive a mere verbal warning for an offense, while another, under a different commander, might face an Article 15 for the exact same infraction.\n",
                            color: AppColors.context(context).textColor,
                          ),
                          SubTitleText(
                            text:
                                "lack of standardized enforcement fosters resentment—not just among those facing harsher penalties, but also toward commanders who abuse their power by issuing disproportionate punishments. Instead of adhering to a consistent set of consequences for specific offenses, commanders are free to act as they see fit. So, what happens when a commander’s favored personnel are implicated in an MEO report?\n",
                            color: AppColors.context(context).textColor,
                          ),
                          SubTitleText(
                            text:
                                "The answer depends on the commander. More often than not, favoritism results in lighter punishments for some while others face severe consequences for similar offenses. Our platform sheds light on these discrepancies, allowing service members to report instances of biased disciplinary action.\n",
                            color: AppColors.context(context).textColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Divider(color: borderColor),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 16),
                            Icon(
                              Icons.remove_red_eye_outlined,
                              color: AppColors.context(context).iconColor,
                              // color:
                            ),
                            const SizedBox(width: 5),
                            // ............................................need to change this with how many views...............................
                            Text(
                              '6',
                              style: TextStyle(
                                color: AppColors.context(context).textColor,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.comment_outlined,
                              color: AppColors.context(context).iconColor,
                              // color:
                            ),
                            const SizedBox(width: 5),
                            //............................................need to change this with how many comments..............................
                            Text(
                              '6',
                              style: TextStyle(
                                color: AppColors.context(context).textColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ImageButtonContainer(
                              imagePath:
                                  'assets/images/blog/image_button/for_light/fb_light.png',
                              onPressed: () {
                                // handle button press
                              },
                            ),
                            ImageButtonContainer(
                              imagePath:
                                  'assets/images/blog/image_button/for_light/x_light.png',
                              onPressed: () {
                                // handle button press
                              },
                            ),
                            ImageButtonContainer(
                              imagePath:
                                  'assets/images/blog/image_button/for_light/tuter_light.png',
                              onPressed: () {
                                // handle button press
                              },
                            ),

                            //............................................need to change this with facebook, X, tuitter icon..............................................

                            // ElevatedButton(
                            //   onPressed: () {},
                            //   child: Image.network('your_image_url_path'),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Divider(color: borderColor),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "SHARE BY EMAIL",
                            style: TextStyle(
                              color: AppColors.context(context).textColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            TitleText(text: 'DROP A LINE', color: Colors.white),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _inputField("First Name", nameController)),
                const SizedBox(width: 8),
                Expanded(child: _inputField("E-mail", emailController)),
              ],
            ),
            const SizedBox(height: 8),
            _inputField("Your Message", messageController, maxLines: 5),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: NormalCustomButton(text: 'SUBMIT', onPressed: () {}),
            ),

            const SizedBox(height: 24),

            if (submittedMessages.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    submittedMessages
                        .map(
                          (msg) => Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name: ${msg['name']}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Email: ${msg['email']}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Message: ${msg['message']}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.brown),
        ),
      ),
    );
  }
}
