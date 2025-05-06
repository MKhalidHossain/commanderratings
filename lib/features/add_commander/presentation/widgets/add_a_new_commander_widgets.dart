import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:commanderratings/core/widgets/wide_custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
import 'outlined_text_field_widget.dart';

class AddANewCommanderWidgets extends StatefulWidget {
  const AddANewCommanderWidgets({super.key});

  @override
  State<AddANewCommanderWidgets> createState() =>
      _AddANewCommanderWidgetsState();
}

class _AddANewCommanderWidgetsState extends State<AddANewCommanderWidgets> {
  late Commander commander;

  late TextEditingController nameController;
  late TextEditingController yearsOfServiceController;

  @override
  void initState() {
    nameController = TextEditingController();
    yearsOfServiceController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 1400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.context(context).contentBoxColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.context(context).contentBoxColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppColors.context(context).borderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'Add a New Commander',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.context(context).textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.context(context).contentBoxColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: AppColors.context(context).borderColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),

                        OutlinedTextFieldWidget(
                          textFieldHeaderName: 'Name',
                          name: 'Commmanders Name',
                          controller: nameController,
                          lebel: 'Name',
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(height: 20),

                        OutlinedTextFieldWidget(
                          textFieldHeaderName: 'Year of Service',
                          name: 'Year of Service',
                          controller: yearsOfServiceController,
                          lebel: 'Year of Service',
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(height: 20),
                        const Divider(height: 1, thickness: 1),
                        const SizedBox(height: 10),

                        //..............................For Featured Image.........................
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Featured Image',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'No Image Delected',
                                  style: TextStyle(fontSize: 12),
                                ),
                                //button for Image
                                NormalCustomButton(
                                  height: 30,
                                  weight: 100,
                                  text: 'Add image +',
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        WideCustomButton(
                          text: 'Submit Commander',
                          onPressed: () {
                            if (nameController.text.isNotEmpty ||
                                yearsOfServiceController.text.isNotEmpty) {
                              commander = Commander(
                                base: 'base',
                                name: nameController.text,
                                rank: 'rank',
                                serviceBrach: 'serviceBrach',
                                unit: 'unit',
                                yearOfService: yearsOfServiceController.text,
                              );

                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text(
                                      '${commander.name} ${commander.yearOfService}',
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Please fill all the fields'),
                                    actions: [
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Commander {
  final String name;
  final String yearOfService;
  final String unit;
  final String serviceBrach;
  final String base;
  final String rank;
  Commander({
    required this.name,
    required this.yearOfService,
    required this.unit,
    required this.serviceBrach,
    required this.base,
    required this.rank,
  });
}
