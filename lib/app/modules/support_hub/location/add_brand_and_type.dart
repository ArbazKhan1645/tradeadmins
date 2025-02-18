// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:partner_hub/app/constants/constants_colors.dart';
import 'package:partner_hub/app/constants/padding_constants.dart';
import 'package:partner_hub/app/services/fetch_supabase.dart';

class AddBrandsAndType extends StatefulWidget {
  const AddBrandsAndType({super.key});

  @override
  State<AddBrandsAndType> createState() => _AddBrandsAndTypeState();
}

class _AddBrandsAndTypeState extends State<AddBrandsAndType> {
  String errorText = '';
  bool isloading = false;
  setErrortext(String val) {
    setState(() {
      errorText = val;
    });
  }

  setLoading(bool val) {
    setState(() {
      isloading = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black45),
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade400),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Add Category',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.cancel_presentation,
                              color: Colors.red))
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widgets.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> widget = widgets[index];
                          return Padding(
                            padding: EdgeInsets.only(
                                top: 30,
                                bottom: (widget['widgets'] as List).isNotEmpty
                                    ? 20
                                    : 30,
                                left: 20,
                                right: 20),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.grey.shade400)),
                                  child: (widget['widgets'] as List).isEmpty
                                      ? Container()
                                      : (widget['isopened'] as bool) == true
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                  children: (widget['widgets']
                                                      as List<Widget>)))
                                          : Container(),
                                ),
                                Positioned(
                                    top: -17,
                                    left: 20,
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.grey.shade400),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget['name'] as String,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            padding10,
                                            const Icon(Icons.info_outline)
                                          ],
                                        ),
                                      ),
                                    )),
                                Positioned(
                                    top: -17,
                                    right: 20,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget['isopened'] =
                                              !widget['isopened'];
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade400),
                                        child: Center(
                                            child: Icon(
                                                (widget['isopened'] as bool) ==
                                                        true
                                                    ? Icons.arrow_drop_up
                                                    : Icons.arrow_drop_down)),
                                      ),
                                    ))
                              ],
                            ),
                          );
                        })),
                const Divider(),
                SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: errorText.isEmpty
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    errorText,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                )),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel',
                              style: TextStyle(fontSize: 18))),
                      padding10,
                      GestureDetector(
                        onTap: () async {
                          if (isloading == false) {
                            if (namecontroller.text.isNotEmpty) {
                              errorText = '';
                              setLoading(true);
                              try {
                                if (namecontroller.text.isNotEmpty) {
                                  await supbaseClient.from('brands').insert({
                                    'name': namecontroller.text,
                                  });
                                }

                                if (typecontroller.text.isNotEmpty) {
                                  await supbaseClient
                                      .from('device_types')
                                      .insert({
                                    'name': typecontroller.text,
                                  });
                                }

                                setLoading(false);
                                Navigator.of(context).pop();
                              } catch (e) {
                                errorText = e.toString();
                                setLoading(false);
                              }
                            }
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.headingTextColor),
                          child: Center(
                            child: isloading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Save',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                      padding15
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController typecontroller = TextEditingController();
  late final List<Map<String, dynamic>> widgets = [
    {
      "name": "General",
      "widgets": [
        padding30,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 70,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600),
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: TextField(
                    controller: namecontroller,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Enter Brand Name',
                        border: InputBorder.none)),
              )),
        ),
        padding30,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 70,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600),
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: TextField(
                    controller: typecontroller,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Enter Type Name',
                        border: InputBorder.none)),
              )),
        ),
        padding30,
      ],
      'isopened': true
    },
    {"name": "More Info", "widgets": [], 'isopened': true},
    {"name": "Appearence", "widgets": [], 'isopened': true},
    {"name": "Control", "widgets": [], 'isopened': true}
  ];
}

 showDialogsShopPage(
    {required BuildContext context,
    required Function(dynamic value) returnValue}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return ShowDialogBody();
    },
  ).then((value) => returnValue);
}

class ShowDialogBody extends StatefulWidget {
  const ShowDialogBody({
    super.key,
  });

  @override
  _ShowDialogBodyState createState() => _ShowDialogBodyState();
}

class _ShowDialogBodyState extends State<ShowDialogBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _scaleAnimation,
        child: Center(
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
              width: 400,
              height: 500,
              child: AddBrandsAndType()),
        ));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
