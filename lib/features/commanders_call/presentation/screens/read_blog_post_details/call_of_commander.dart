import 'package:commanderratings/features/commanders_call/presentation/screens/read_blog_post_details/widgets/is_this_meo_office_effective_weiget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/headers/header_for_others_one_man.dart';

class CallOfCommnder extends StatefulWidget {
  const CallOfCommnder({super.key});

  @override
  State<CallOfCommnder> createState() =>
      _CallOfCommnderState();
}

class _CallOfCommnderState
    extends State<CallOfCommnder> {
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
