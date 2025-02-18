import 'package:flutter/material.dart';
import 'package:partner_hub/app/models/models/brands_model.dart';
import 'package:partner_hub/app/models/models/types_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddMobilePhoneDrawer extends StatefulWidget {
  const AddMobilePhoneDrawer({
    super.key,
    required this.brandsList,
    required this.typesList,
  });

  final List<BrandsModel> brandsList;
  final List<TypesModel> typesList;

  @override
  State<AddMobilePhoneDrawer> createState() => _AddMobilePhoneDrawerState();
}

class _AddMobilePhoneDrawerState extends State<AddMobilePhoneDrawer> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController basePriceController = TextEditingController();
  List<Map<String, dynamic>> questions = [
    {'question': 'Is your Phone turned on?', 'options': []},
    {'question': 'Is your Phone cracked on?', 'options': []},
    {'question': 'Is your Phone networked on?', 'options': []},
    {'question': 'Phone condition on?', 'options': []}
  ];

  // void addQuestion() {
  //   setState(() {
  //     questions.add({'question': TextEditingController(), 'options': []});
  //   });
  // }

  void addOption(int index) {
    setState(() {
      questions[index]['options'].add({
        'answer': TextEditingController(),
        'price_adjustment': TextEditingController()
      });
    });
  }

  Future<void> savePhone() async {
    try {
      final mobilePhone = {
        'name': nameController.text,
        // 'brand_name': brandNameController.text,
        'base_price': double.parse(basePriceController.text),
        'brands': 2,
        'type': 1,
        'questions': questions
            .map((q) => {
                  'question': q['question'],
                  'options': q['options']
                      .map((o) => {
                            'answer': o['answer'].text,
                            'price_adjustment':
                                double.parse(o['price_adjustment'].text)
                          })
                      .toList()
                })
            .toList()
      };

      // Save to Supabase
      await Supabase.instance.client.from('phones_models').insert(mobilePhone);
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Phone Name')),
            TextField(
                controller: brandNameController,
                decoration: InputDecoration(labelText: 'Brand Name')),
            TextField(
                controller: basePriceController,
                decoration: InputDecoration(labelText: 'Base Price')),
            const SizedBox(height: 10),
            // ElevatedButton(
            //     onPressed: addQuestion, child: const Text("Add Question")),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(questions[index]['question']),
                      ElevatedButton(
                          onPressed: () => addOption(index),
                          child: const Text("Add Option")),
                      Column(
                        children: List.generate(
                            questions[index]['options'].length, (optIndex) {
                          return Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                      controller: questions[index]['options']
                                          [optIndex]['answer'],
                                      decoration: InputDecoration(
                                          labelText: 'Option'))),
                              Expanded(
                                  child: TextField(
                                      controller: questions[index]['options']
                                          [optIndex]['price_adjustment'],
                                      decoration: InputDecoration(
                                          labelText: 'Price Adjustment'))),
                            ],
                          );
                        }),
                      )
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: savePhone, child: const Text("Save Mobile Phone"))
          ],
        ),
      ),
    );
  }
}
