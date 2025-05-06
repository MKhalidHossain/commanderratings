import 'package:flutter/material.dart';


import '../../widgets/contact_section_widget.dart';
import '../../../../../core/headers/header_for_others_one_man.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderForOthers(text: 'Contact Us'),
            const SizedBox(height: 24),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
