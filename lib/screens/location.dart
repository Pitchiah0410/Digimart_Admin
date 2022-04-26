import 'package:chownow/controller/post/locationcontroller.dart';
import 'package:chownow/screens/home.dart';
import 'package:chownow/screens/navigation.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  TextEditingController country = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController name = TextEditingController();
  var locationtype;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CountryStateCityPicker(
                country: country,
                state: state,
                city: city,
                textFieldInputBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'Location Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  value: locationtype,
                  onChanged: (String? v) {
                    locationtype = v!;
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'VIRTUAL',
                      child: Text('Virtual'),
                    ),
                    DropdownMenuItem(
                      value: 'PHYSICAL',
                      child: Text('Physical'),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: pincode,
                decoration: InputDecoration(
                    hintText: 'Pincode',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                LocationController.addlocation(
                        name: name.text,
                        city: city.text,
                        state: state.text,
                        country: country.text,
                        pincode: pincode.text,
                        locationType: locationtype)
                    .then(
                  (value) => Get.offAll(() => NavigationPage()),
                  onError: (e) => Get.rawSnackbar(message: e.toString()),
                );
              },
              icon: Icon(Icons.login),
              label: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
