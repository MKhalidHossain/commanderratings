import 'package:commanderratings/features/post_or_blog_or_commanders_call/presentation/screens/read_blog_post_details/widgets/is_this_meo_office_effective_weiget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/headers/header_for_others_one_man.dart';

class ReadBlogOrIsTheMeoOfficeEffective extends StatefulWidget {
  const ReadBlogOrIsTheMeoOfficeEffective({super.key});

  @override
  State<ReadBlogOrIsTheMeoOfficeEffective> createState() =>
      _ReadBlogOrIsTheMeoOfficeEffectiveState();
}

class _ReadBlogOrIsTheMeoOfficeEffectiveState
    extends State<ReadBlogOrIsTheMeoOfficeEffective> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderForOthers(text: 'IS THE MED OFFICE EFFECTIVE?'),
            const SizedBox(height: 24),
            IsThisMeoOfficeEffectiveWeiget(),
          ],
        ),
      ),
    );
  }
}
