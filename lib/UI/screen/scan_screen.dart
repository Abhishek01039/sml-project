import 'dart:async';
import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/core/provider/message_provider.dart';

import 'package:qr_app/ui/screen/widgets/primary_button.dart';
import 'package:qr_app/UI/shared/style.dart';

class ScanScreen extends StatefulWidget {
  static final routeName = 'scanScreen';
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  double collegeStartlongitude = 70.8310538;
  double collegeStartlatitude = 20.2217161;
  double collegeEndlongitude = 73.8313038;
  double collegeEndlatitude = 23.2237121;

  // StreamSubscription<Position> positionStream;

  String location;
  var result;
  @override
  void initState() {
    super.initState();
    verifyLocation();
  }

  // _scanBarcodeSecondTime() {
  //   var geolocator = Geolocator();
  //   var locationOptions =
  //       LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

  //   positionStream = geolocator
  //       .getPositionStream(locationOptions)
  //       .listen((Position position) {
  //     if (position.longitude.isNaN && position.latitude.isNaN) {
  //       print("something went wrong");
  //     } else {
  //       if (position.longitude > collegeStartlongitude &&
  //           position.longitude < collegeEndlongitude &&
  //           position.latitude > collegeStartlatitude &&
  //           position.latitude < collegeEndlatitude) {
  //         setState(() {
  //           // positionStream?.cancel();
  //           location = "You are in College";
  //           _barCodeScan();
  //         });
  //       } else {
  //         setState(() {
  //           location = "You are not in College";
  //           print("You are not in College");
  //         });
  //       }
  //     }
  //   });
  // }

  Future<Null> verifyLocation() async {
    // print("hello");
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    // print(position);
    if (position.longitude > collegeStartlongitude &&
        position.longitude < collegeEndlongitude &&
        position.latitude > collegeStartlatitude &&
        position.latitude < collegeEndlatitude) {
      setState(() {
        // positionStream?.cancel();
        location = "You are in College";
      });
      // if (result == null) {
      _barCodeScan();
      // }
    } else {
      setState(() {
        location = "You are not in College";
        print("You are not in College");
      });
    }
  }

  _barCodeScan() async {
    try {
      await BarcodeScanner.scan().then((value) {
        setState(() {
          result = value;
        });
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MessageProvider>(
      builder: (context, messageProvider, _) {
        return SingleChildScrollView(
          child: location == "You are in College"
              ? result != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: messageProvider.key,
                        child: Column(
                          children: <Widget>[
                            Text(
                              result.rawContent,
                              style: TextStyle(fontSize: 30),
                            ),
                            TextFormField(
                              controller: messageProvider.messageController,
                              maxLines: null,
                              decoration: Style.inputDecoration('Message'),
                              validator: (v) {
                                if (v.isEmpty) {
                                  return 'input require';
                                } else
                                  return null;
                              },
                            ),
                            result != null
                                ? result.rawContent != ""
                                    ? Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 12),
                                        child: PrimaryButton(
                                          onTap: () {
                                            // if (_key.currentState.validate()) {
                                            //   SharedPreferences.getInstance()
                                            //       .then((value) {

                                            //     // _api.httpPost("message", body);
                                            //   });
                                            // }
                                            messageProvider
                                                .sendMessage(context);
                                          },
                                          child: Text(
                                            'Send Message',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 21),
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 12),
                                        child: PrimaryButton(
                                          onTap: () async {
                                            _barCodeScan();
                                            // await _scanBarcodeSecondTime();
                                          },
                                          child: Text(
                                            'Scan QR Code',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 21),
                                          ),
                                        ),
                                      )
                                : Container(),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                          // strokeWidth: 20,
                          ),
                    )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          // color: Colors.red,
                          child: Text(
                            location != null
                                ? location.toString()
                                : "Please wait",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrimaryButton(
                        onTap: verifyLocation,
                        child: Text(
                          'Varify Location',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 21),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
