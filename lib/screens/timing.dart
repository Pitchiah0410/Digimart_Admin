import 'package:chownow/constants/colors.dart';
import 'package:chownow/controller/post/timing.dart';
import 'package:chownow/screens/home.dart';
import 'package:chownow/screens/location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimingPage extends StatefulWidget {
  @override
  _TimingPageState createState() => _TimingPageState();
}

class _TimingPageState extends State<TimingPage> {
  TextEditingController monopeningHours1 = TextEditingController();
  TextEditingController monclosingHours1 = TextEditingController();
  TextEditingController monopeningHours2 = TextEditingController();
  TextEditingController monclosingHours2 = TextEditingController();
  TextEditingController monopeningHours3 = TextEditingController();
  TextEditingController monclosingHours3 = TextEditingController();

  TextEditingController tueopeningHours1 = TextEditingController();
  TextEditingController tueclosingHours1 = TextEditingController();
  TextEditingController tueopeningHours2 = TextEditingController();
  TextEditingController tueclosingHours2 = TextEditingController();
  TextEditingController tueopeningHours3 = TextEditingController();
  TextEditingController tueclosingHours3 = TextEditingController();

  TextEditingController wedopeningHours1 = TextEditingController();
  TextEditingController wedclosingHours1 = TextEditingController();
  TextEditingController wedopeningHours2 = TextEditingController();
  TextEditingController wedclosingHours2 = TextEditingController();
  TextEditingController wedopeningHours3 = TextEditingController();
  TextEditingController wedclosingHours3 = TextEditingController();

  TextEditingController thuropeningHours1 = TextEditingController();
  TextEditingController thurclosingHours1 = TextEditingController();
  TextEditingController thuropeningHours2 = TextEditingController();
  TextEditingController thurclosingHours2 = TextEditingController();
  TextEditingController thuropeningHours3 = TextEditingController();
  TextEditingController thurclosingHours3 = TextEditingController();

  TextEditingController friopeningHours1 = TextEditingController();
  TextEditingController friclosingHours1 = TextEditingController();
  TextEditingController friopeningHours2 = TextEditingController();
  TextEditingController friclosingHours2 = TextEditingController();
  TextEditingController friopeningHours3 = TextEditingController();
  TextEditingController friclosingHours3 = TextEditingController();

  TextEditingController satopeningHours1 = TextEditingController();
  TextEditingController satclosingHours1 = TextEditingController();
  TextEditingController satopeningHours2 = TextEditingController();
  TextEditingController satclosingHours2 = TextEditingController();
  TextEditingController satopeningHours3 = TextEditingController();
  TextEditingController satclosingHours3 = TextEditingController();

  TextEditingController sunopeningHours1 = TextEditingController();
  TextEditingController sunclosingHours1 = TextEditingController();
  TextEditingController sunopeningHours2 = TextEditingController();
  TextEditingController sunclosingHours2 = TextEditingController();
  TextEditingController sunopeningHours3 = TextEditingController();
  TextEditingController sunclosingHours3 = TextEditingController();

  timing(size, con1, con2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: size,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Opening Hours',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: con1,
                onTap: () async {
                  final TimeOfDay? picked_s = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (BuildContext? context, Widget? child) {
                        return MediaQuery(
                          data: MediaQuery.of(context!)
                              .copyWith(alwaysUse24HourFormat: false),
                          child: child!,
                        );
                      });
                  print(picked_s!.format(context));
                  if (picked_s != null)
                    setState(() {
                      con1.text =
                          '${picked_s.format(context).substring(0, 5).trim()}:00 ${picked_s.format(context).substring(5, 7)}';
                    });
                },
                decoration: InputDecoration(
                    hintText: 'Opening Hours',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        SizedBox(
          width: size,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Closing Hours',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: con2,
                onTap: () async {
                  final TimeOfDay? picked_s = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (BuildContext? context, Widget? child) {
                        return MediaQuery(
                          data: MediaQuery.of(context!)
                              .copyWith(alwaysUse24HourFormat: false),
                          child: child!,
                        );
                      });
                  print(picked_s!.format(context));
                  if (picked_s != null)
                    setState(() {
                      con2.text =
                          '${picked_s.format(context).substring(0, 5).trim()}:00 ${picked_s.format(context).substring(5, 7)}';
                    });
                },
                decoration: InputDecoration(
                    hintText: 'Closing Hours',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.30;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size,
                      child: Text(
                        'Restaurant Timing',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                          fontSize: 26,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    // SizedBox(
                    //   width: size,
                    //   child: CheckboxListTile(
                    //       title: Text('Same Timing for All Days'),
                    //       value: isSametiming,
                    //       onChanged: (v) {
                    //         setState(() {
                    //           isSametiming = v!;
                    //         });
                    //       }),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monday',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        timing(size, monopeningHours1, monclosingHours1),
                        SizedBox(
                          height: 15.0,
                        ),
                        timing(size, monopeningHours2, monclosingHours2),
                        SizedBox(
                          height: 15.0,
                        ),
                        timing(size, monopeningHours3, monclosingHours3),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                TimingController.createtiming(mapdata: [
                                  {
                                    "openingHours":
                                        '${monopeningHours1.text}:00',
                                    "closingHours":
                                        '${monclosingHours1.text}:00'
                                  },
                                  if (monclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${monopeningHours2.text}:00',
                                        "closingHours":
                                            '${monclosingHours2.text}:00'
                                      }
                                    },
                                  if (monclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${monopeningHours3.text}:00',
                                        "closingHours":
                                            '${monclosingHours1.text}:00'
                                      }
                                    }
                                ], day: 'Monday')
                                    .then(
                                  (value) => setState(() {
                                    mon = true;
                                  }),
                                  onError: (e) => Get.rawSnackbar(
                                    message: e.toString(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primarycolor,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                height: 50,
                                width: size,
                                child: Center(
                                  child: Text(
                                    'Add Time ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () => Get.offAll(() => LocationPage()),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primarycolor,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                height: 50,
                                width: size,
                                child: Center(
                                  child: Text(
                                    'Continue to Setup ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Visibility(
                      visible: mon,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tuesday',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(
                            size,
                            tueopeningHours1,
                            tueclosingHours1,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(size, tueopeningHours2, tueclosingHours2),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(size, tueopeningHours3, tueclosingHours3),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  TimingController.createtiming(mapdata: [
                                    {
                                      "openingHours":
                                          '${tueopeningHours1.text}',
                                      "closingHours": '${tueclosingHours1.text}'
                                    },
                                    if (tueclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${tueopeningHours2.text}',
                                          "closingHours":
                                              '${tueclosingHours2.text}'
                                        }
                                      },
                                    if (tueclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${tueopeningHours3.text}',
                                          "closingHours":
                                              '${tueclosingHours1.text}'
                                        }
                                      }
                                  ], day: 'Tuesday')
                                      .then(
                                    (value) => setState(() {
                                      tue = true;
                                    }),
                                    onError: (e) => Get.rawSnackbar(
                                      message: e.toString(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Add Time ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () => Get.offAll(() => LocationPage()),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Continue to Setup ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Visibility(
                      visible: tue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wednesday',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(
                            size,
                            wedopeningHours1,
                            wedclosingHours1,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(size, wedopeningHours2, wedclosingHours2),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(size, wedopeningHours3, wedclosingHours3),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  TimingController.createtiming(mapdata: [
                                    {
                                      "openingHours":
                                          '${wedopeningHours1.text}',
                                      "closingHours": '${wedclosingHours1.text}'
                                    },
                                    if (wedclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${wedopeningHours2.text}',
                                          "closingHours":
                                              '${wedclosingHours2.text}'
                                        }
                                      },
                                    if (wedclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${wedopeningHours3.text}',
                                          "closingHours":
                                              '${wedclosingHours1.text}'
                                        }
                                      }
                                  ], day: 'Wednesday')
                                      .then(
                                    (value) => setState(() {
                                      wed = true;
                                    }),
                                    onError: (e) => Get.rawSnackbar(
                                      message: e.toString(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Add Time ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () =>
                                    TimingController.createtiming(mapdata: [
                                  {
                                    "openingHours": '${wedopeningHours1.text}',
                                    "closingHours": '${wedclosingHours1.text}'
                                  },
                                  if (wedclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${wedopeningHours2.text}',
                                        "closingHours":
                                            '${wedclosingHours2.text}'
                                      }
                                    },
                                  if (wedclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${wedopeningHours3.text}',
                                        "closingHours":
                                            '${wedclosingHours1.text}'
                                      }
                                    }
                                ], day: 'Wednesday')
                                        .then(
                                  (value) => Get.offAll(() => LocationPage()),
                                  onError: (e) => Get.rawSnackbar(
                                    message: e.toString(),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Continue to Setup ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Visibility(
                      visible: wed,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thursday',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(
                            size,
                            thuropeningHours1,
                            thurclosingHours1,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(size, thuropeningHours2, thurclosingHours2),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(size, thuropeningHours3, thurclosingHours3),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  TimingController.createtiming(mapdata: [
                                    {
                                      "openingHours":
                                          '${thuropeningHours1.text}',
                                      "closingHours":
                                          '${thurclosingHours1.text}'
                                    },
                                    if (thurclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${thuropeningHours2.text}',
                                          "closingHours":
                                              '${thurclosingHours2.text}'
                                        }
                                      },
                                    if (thurclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${thuropeningHours3.text}',
                                          "closingHours":
                                              '${thurclosingHours1.text}'
                                        }
                                      }
                                  ], day: 'Thursday')
                                      .then(
                                    (value) => setState(() {
                                      thur = true;
                                    }),
                                    onError: (e) => Get.rawSnackbar(
                                      message: e.toString(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Add Time ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () =>
                                    TimingController.createtiming(mapdata: [
                                  {
                                    "openingHours": '${thuropeningHours1.text}',
                                    "closingHours": '${thurclosingHours1.text}'
                                  },
                                  if (thurclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${thuropeningHours2.text}',
                                        "closingHours":
                                            '${thurclosingHours2.text}'
                                      }
                                    },
                                  if (thurclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${thuropeningHours3.text}',
                                        "closingHours":
                                            '${thurclosingHours1.text}'
                                      }
                                    }
                                ], day: 'Thursday')
                                        .then(
                                  (value) => Get.offAll(() => LocationPage()),
                                  onError: (e) => Get.rawSnackbar(
                                    message: e.toString(),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Continue to Setup ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Visibility(
                      visible: thur,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Friday',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(
                            size,
                            friopeningHours1,
                            friclosingHours1,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(
                            size,
                            friopeningHours2,
                            friclosingHours2,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(
                            size,
                            friopeningHours3,
                            friclosingHours3,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  TimingController.createtiming(mapdata: [
                                    {
                                      "openingHours":
                                          '${friopeningHours1.text}',
                                      "closingHours": '${friclosingHours1.text}'
                                    },
                                    if (friclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${friopeningHours2.text}',
                                          "closingHours":
                                              '${friclosingHours2.text}'
                                        }
                                      },
                                    if (friclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${friopeningHours3.text}',
                                          "closingHours":
                                              '${friclosingHours1.text}'
                                        }
                                      }
                                  ], day: 'Friday')
                                      .then(
                                    (value) => setState(() {
                                      fri = true;
                                    }),
                                    onError: (e) => Get.rawSnackbar(
                                      message: e.toString(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Add Time ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () =>
                                    TimingController.createtiming(mapdata: [
                                  {
                                    "openingHours": '${friopeningHours1.text}',
                                    "closingHours": '${friclosingHours1.text}'
                                  },
                                  if (friclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${friopeningHours2.text}',
                                        "closingHours":
                                            '${friclosingHours2.text}'
                                      }
                                    },
                                  if (friclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${friopeningHours3.text}',
                                        "closingHours":
                                            '${friclosingHours1.text}'
                                      }
                                    }
                                ], day: 'Friday')
                                        .then(
                                  (value) => Get.offAll(() => LocationPage()),
                                  onError: (e) => Get.rawSnackbar(
                                    message: e.toString(),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Continue to Setup ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Visibility(
                      visible: fri,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saturday',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(
                            size,
                            satopeningHours1,
                            satclosingHours1,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(size, satopeningHours2, satclosingHours2),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(size, satopeningHours3, satclosingHours3),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  TimingController.createtiming(mapdata: [
                                    {
                                      "openingHours":
                                          '${satopeningHours1.text}',
                                      "closingHours": '${satclosingHours1.text}'
                                    },
                                    if (satclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${satopeningHours2.text}',
                                          "closingHours":
                                              '${satclosingHours2.text}'
                                        }
                                      },
                                    if (satclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${satopeningHours3.text}',
                                          "closingHours":
                                              '${satclosingHours1.text}'
                                        }
                                      }
                                  ], day: 'Saturday')
                                      .then(
                                    (value) => setState(() {
                                      sat = true;
                                    }),
                                    onError: (e) => Get.rawSnackbar(
                                      message: e.toString(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Add Time ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () =>
                                    TimingController.createtiming(mapdata: [
                                  {
                                    "openingHours": '${satopeningHours1.text}',
                                    "closingHours": '${satclosingHours1.text}'
                                  },
                                  if (satclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${satopeningHours2.text}',
                                        "closingHours":
                                            '${satclosingHours2.text}'
                                      }
                                    },
                                  if (satclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${satopeningHours3.text}',
                                        "closingHours":
                                            '${satclosingHours1.text}'
                                      }
                                    }
                                ], day: 'Saturday')
                                        .then(
                                  (value) => Get.offAll(() => LocationPage()),
                                  onError: (e) => Get.rawSnackbar(
                                    message: e.toString(),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Continue to Setup ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Visibility(
                      visible: sat,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sunday',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(
                            size,
                            sunopeningHours1,
                            sunclosingHours1,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(size, sunopeningHours2, sunclosingHours2),
                          SizedBox(
                            height: 15.0,
                          ),
                          timing(
                            size,
                            sunopeningHours3,
                            sunclosingHours3,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  TimingController.createtiming(mapdata: [
                                    {
                                      "openingHours":
                                          '${sunopeningHours1.text}',
                                      "closingHours": '${sunclosingHours1.text}'
                                    },
                                    if (sunclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${sunopeningHours2.text}',
                                          "closingHours":
                                              '${sunclosingHours2.text}'
                                        }
                                      },
                                    if (sunclosingHours2.text.isNotEmpty)
                                      {
                                        {
                                          "openingHours":
                                              '${sunopeningHours3.text}',
                                          "closingHours":
                                              '${sunclosingHours1.text}'
                                        }
                                      }
                                  ], day: 'Sunday')
                                      .then(
                                    (value) => setState(() {
                                      sun = true;
                                    }),
                                    onError: (e) => Get.rawSnackbar(
                                      message: e.toString(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Add Time ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () =>
                                    TimingController.createtiming(mapdata: [
                                  {
                                    "openingHours": '${sunopeningHours1.text}',
                                    "closingHours": '${sunclosingHours1.text}'
                                  },
                                  if (sunclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${sunopeningHours2.text}',
                                        "closingHours":
                                            '${sunclosingHours2.text}'
                                      }
                                    },
                                  if (sunclosingHours2.text.isNotEmpty)
                                    {
                                      {
                                        "openingHours":
                                            '${sunopeningHours3.text}',
                                        "closingHours":
                                            '${sunclosingHours1.text}'
                                      }
                                    }
                                ], day: 'Sunday')
                                        .then(
                                  (value) => Get.offAll(() => LocationPage()),
                                  onError: (e) => Get.rawSnackbar(
                                    message: e.toString(),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 50,
                                  width: size,
                                  child: Center(
                                    child: Text(
                                      'Continue to Setup ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                // InkWell(
                //   onTap: () {
                //     // TimingController.createProduct(mapdata: {

                //     // }, day: day)
                //   },
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: primarycolor,
                //       border: Border.all(
                //         color: Colors.transparent,
                //       ),
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //     height: 50,
                //     width: size,
                //     child: Center(
                //       child: Text(
                //         'Add Time',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool mon = false;
  bool tue = false;
  bool wed = false;
  bool thur = false;
  bool fri = false;
  bool sat = false;
  bool sun = false;
  bool isSametiming = false;
}
