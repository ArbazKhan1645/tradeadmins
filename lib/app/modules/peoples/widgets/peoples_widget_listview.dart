import 'package:flutter/material.dart';

class PeoplesItemWidgetListview extends StatelessWidget {
  const PeoplesItemWidgetListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                const SizedBox(width: 20),
                const CircleAvatar(
                  radius: 70,
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Christofer Vetroves',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'UI/UX Designer',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.green.shade100),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 5, bottom: 5),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: const BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text(
                                          'Active',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.green),
                                        ),
                                      ],
                                    ),
                                  )),
                                ),
                              ],
                            )
                          ],
                        )),
                    const Expanded(
                        flex: 6,
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Employement Type',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            'Permenent',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Department',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            'Project Team',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Joint Date',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            '12 April 2023',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Office',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            'Orix Dubai',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.call, color: Colors.grey),
                                    SizedBox(width: 10),
                                    Text('+44 32 821 0273 0')
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Icon(Icons.email, color: Colors.grey),
                                    SizedBox(width: 10),
                                    Text('HSETECHNO@Gmail.com')
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Icon(Icons.web, color: Colors.grey),
                                    SizedBox(width: 10),
                                    Text('https://hse13278.com')
                                  ],
                                )
                              ],
                            ))
                          ],
                        ))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
