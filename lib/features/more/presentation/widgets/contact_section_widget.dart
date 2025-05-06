import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:commanderratings/core/widgets/title_subtitle_text.dart';
import 'package:flutter/material.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
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
    final List<Map<String, dynamic>> contactDetails = [
      {
        'icon': Icons.location_on,
        'text': "44 SHIRLEY AVE.\nWEST CHICAGO, IL 60185",
        'index': 0,
      },
      {'icon': Icons.phone, 'text': "0 (800) 555 22 33", 'index': 1},
      {
        'icon': Icons.headset_mic,
        'text': "admincommanderratings.com",
        'index': 2,
      },
    ];

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
                children:
                    contactDetails.map((item) {
                      return Column(
                        children: [
                          const SizedBox(height: 12),
                          Icon(item['icon'], color: borderColor, size: 32),
                          const SizedBox(height: 12),
                          Text(
                            item['text'],
                            style: TextStyle(
                              color: borderColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          item['index'] != 2
                              ? Column(
                                children: [
                                  const SizedBox(height: 12),
                                  Divider(color: borderColor),
                                ],
                              )
                              : Text(''),
                        ],
                      );
                    }).toList(),
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
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
