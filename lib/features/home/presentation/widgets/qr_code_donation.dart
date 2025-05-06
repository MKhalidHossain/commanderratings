import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/title_subtitle_text.dart';

class QrCodeDonation extends StatefulWidget {
  const QrCodeDonation({super.key});

  @override
  State<QrCodeDonation> createState() => _QrCodeDonationState();
}

class _QrCodeDonationState extends State<QrCodeDonation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        child: Card(
          color: AppColors.context(context).contentBoxGreyColor,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TitleText(color: Colors.red, text: 'MAKE A DONATION'),
                const SizedBox(height: 8),
                SubTitleText(text: 'Scan the QR code to make a donation'),
                const SizedBox(height: 16),
                Image.asset('assets/images/qr/qr_code.png', height: 200),
                const SizedBox(height: 16),
                NormalCustomButton(text: 'Buy Me A Coffee', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
