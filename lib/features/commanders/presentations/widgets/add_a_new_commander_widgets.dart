import 'package:commanderratings/features/commanders/controllers/commanders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/custom_dropdawon_field_widget.dart';
import '../../../../core/widgets/normal_custom_button.dart';
import '../../../../core/widgets/outlined_text_field_widget.dart';
import '../../../../core/widgets/wide_custom_button.dart';
import '../../domain/add_a_new_commander_response_model.dart';

class AddANewCommanderWidgets extends StatefulWidget {
  const AddANewCommanderWidgets({super.key});

  @override
  State<AddANewCommanderWidgets> createState() =>
      _AddANewCommanderWidgetsState();
}

class _AddANewCommanderWidgetsState extends State<AddANewCommanderWidgets> {
  late AddANewCommanderResponseModel commander;

  final List<String> branch = [
    'Air Force',
    'Army',
    'Cost Guard',
    'Navy',
    'Spacial Force',
    'Us Marines',
  ];
  final List<String> unit = [
    '1st',
    'Black widow Squadron',
    'Cost Guard',
    'Navy',
    'Spacial Force',
    'Us Marines',
  ];
  final List<String> base = ['Fort Valar', 'RAF Alconbury', 'testing'];
  final List<String> rank = [
    'Captain',
    'Major',
    'Cost Guard',
    'Navy',
    'Spacial Force',
    'Us Marines',
  ];

  String? selectServiceBranch;
  String? selectUnit;
  String? selectBase;
  String? selectRank;

  late TextEditingController nameController;
  late TextEditingController yearsOfServiceController;
  late TextEditingController serviceController;
  late TextEditingController unitController;
  late TextEditingController baseController;
  late TextEditingController rankController;

  @override
  void initState() {
    nameController = TextEditingController();
    yearsOfServiceController = TextEditingController();
    serviceController = TextEditingController();
    unitController = TextEditingController();
    baseController = TextEditingController();
    rankController = TextEditingController();
    super.initState();
    // selectServiceBranch = branch.first;
    // selectUnit = unit.first;
    // selectBase = base.first;
    // selectRank = rank.first;
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return GetBuilder<CommandersController>(
        builder:(commandersController){
          return Container(
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
                                //lebel: 'Name',
                                textInputType: TextInputType.text,
                              ),
                              const SizedBox(height: 20),

                              OutlinedTextFieldWidget(
                                textFieldHeaderName: 'Year of Service',
                                name: 'Year of Service',
                                controller: yearsOfServiceController,
                                // lebel: 'Year of Service',
                                textInputType: TextInputType.text,
                              ),
                              const SizedBox(height: 20),
                              //...........................For Service Branch..............................
                              CustomDropdownFieldWidget(
                                text: 'Service Branch',
                                //label: 'Select Service Branch',
                                value: selectServiceBranch,
                                items: branch,
                                onChanged: (value) {
                                  selectServiceBranch = value!;
                                },
                                validator:
                                    (value) =>
                                value == null || value.isEmpty
                                    ? 'Please select one'
                                    : null,
                              ),
                              const SizedBox(height: 20),
                              //...........................For Unit..............................
                              CustomDropdownFieldWidget(
                                text: 'Unit',
                                //label: 'Select Unit',
                                value: selectUnit,
                                items: unit,
                                onChanged: (value) {
                                  selectUnit = value!;
                                },
                                validator:
                                    (value) =>
                                value == null || value.isEmpty
                                    ? 'Please select one'
                                    : null,
                              ),
                              const SizedBox(height: 20),
                              //...........................For Base..............................
                              CustomDropdownFieldWidget(
                                text: 'Base',
                                //label: 'Select Base',
                                value: selectBase,
                                items: base,
                                onChanged: (value) {
                                  selectBase = value!;
                                },
                                validator:
                                    (value) =>
                                value == null || value.isEmpty
                                    ? 'Please select one'
                                    : null,
                              ),
                              const SizedBox(height: 20),
                              //...........................For Rank..............................
                              CustomDropdownFieldWidget(
                                text: 'Rank',
                                //label: 'Select Rank',
                                value: selectRank,
                                items: rank,
                                onChanged: (value) {
                                  selectRank = value!;
                                },
                                validator:
                                    (value) =>
                                value == null || value.isEmpty
                                    ? 'Please select one'
                                    : null,
                              ),
                              //...........................For Base..............................
                              const SizedBox(height: 15),
                              const Divider(height: 1, thickness: .5),
                              const SizedBox(height: 20),

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
                                        text: 'Add image  +',
                                        fontSize: 12,
                                        textColor: Colors.white70,
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
                                  String name = nameController.text;
                                  String yearOfService = yearsOfServiceController.text;
                                  String serviceBranch = selectServiceBranch!;
                                  String unit = selectUnit!;
                                  String base = selectBase!;
                                  String rank = selectRank!;
                                  if (name.isEmpty){
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Opps ! '),
                                          content: Text('Please Fill the required data'),
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
                                  } else if (yearOfService.isEmpty){
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Opps ! '),
                                          content: Text('Please Fill the required data'),
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
                                  } else if (serviceBranch.isEmpty){
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Opps ! '),
                                          content: Text('Please Fill the required data'),
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
                                  } else if (unit.isEmpty){
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Opps ! '),
                                          content: Text('Please Fill the required data'),
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
                                  } else if (base.isEmpty){
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Opps ! '),
                                          content: Text('Please Fill the required data'),
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
                                  } else if (rank.isEmpty){
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Opps ! '),
                                          content: Text('Please Fill the required data'),
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
                                  commandersController.createCommander(
                                      name,
                                      yearOfService,
                                      serviceBranch,
                                      unit,
                                      base,
                                      rank,
                                      'commanderimage'
                                  );
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
    );
  }
}

