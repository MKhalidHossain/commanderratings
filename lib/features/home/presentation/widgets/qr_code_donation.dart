import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/widgets/title_subtitle_text.dart';

class QrCodeDonation extends StatefulWidget {
  const QrCodeDonation({super.key});

  @override
  State<QrCodeDonation> createState() => _QrCodeDonationState();
}

class _QrCodeDonationState extends State<QrCodeDonation> {
  Future<void> launchURL(BuildContext context) async {
    final Uri uri = Uri.parse("https://www.buymeacoffee.com/commanderratings");

    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $uri');
      }
    } catch (e) {
      // Show fallback SnackBar or log
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch the URL')));
    }
  }

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
                Image.asset(
                  'assets/images/qr/buy_cofee.png',
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 16),

                NormalCustomButton(
                  text: 'Buy Me A Coffee',
                  onPressed: () {
                    launchURL(context);
                  },
                ),

                // NormalCustomButton(
                //   text: 'Buy Me A Coffee',
                //   onPressed: () async {
                //     final url = Uri.parse(
                //       "https://www.buymeacoffee.com/commanderratings",
                //     );
                //     final canLaunch = await canLaunchUrl(url);
                //     print("Can launch URL? $canLaunch");

                //     if (!canLaunch) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(
                //           content: Text('Device cannot launch browser.'),
                //         ),
                //       );
                //       return;
                //     }

                //     final launched = await launchUrl(
                //       url,
                //       mode: LaunchMode.externalApplication,
                //     );
                //     if (!launched) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(
                //           content: Text('Could not open the donation link.'),
                //         ),
                //       );
                //     }
                //   },
                // ),

                // NormalCustomButton(text: 'Buy Me A Coffee', onPressed: () async{
                //   final url = Uri.parse("https://buymeacoffee.com/commanderratings");
                //   if (await canLaunchUrl(url)){
                //     await launchUrl(url,mode: LaunchMode.externalApplication);
                //   }
                //   else{
                //     throw "Could not launch $url";
                //   }
                // },
                //
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
