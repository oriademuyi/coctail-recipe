import 'package:cocktail/reuseableConstant/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

final TextEditingController controller = TextEditingController();
final TextEditingController _fullnamecontroller = TextEditingController();
final TextEditingController _deliveryaddresscontroller =
    TextEditingController();
// final TextEditingController _deliverydatecontroller = TextEditingController();
String initialCountry = 'NG';
PhoneNumber number = PhoneNumber(isoCode: 'NG');

class Orderpage extends StatefulWidget {
  String? drinkname;
  String? drinkid;
  String? drinkprice;
  Orderpage({this.drinkid, this.drinkname, this.drinkprice, Key? key})
      : super(key: key);

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  bool _isChecked = false;

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  String? FullName;
  String? DeliveryAddress;
  String? PhoneNumber;
  String? DeliveryDate;
  @override
  Widget build(BuildContext context) {
    sucessdialogbox() {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 230,
                    child: Column(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.mood,
                              color: Colors.blue,
                              size: 60,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            "Awesome!",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Your order as been taken and it will be delivered in next an hour.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 270,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.blue,
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "okay",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    failuredialogbox() {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 230,
                    child: Column(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.mood,
                              color: Colors.red,
                              size: 60,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            "OOPS!",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "There is issue placing your order,kindly try again.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 270,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.red,
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Try Again",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Place order for ${widget.drinkname}'),
        ),
        body: Form(
          key: formKey,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _fullnamecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'FullName is required';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: Kinputddecoration,
                      onChanged: (value) {
                        FullName = value;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _deliveryaddresscontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Delivery address is required';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: Kinputddecoration.copyWith(
                        hintText: "Delivery Address",
                        icon: Icon(
                          Icons.dns,
                          color: Colors.blue,
                        ),
                      ),
                      onChanged: (value) {
                        DeliveryAddress = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.blue,
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    maxTime: DateTime(2050, 6, 7),
                                    onChanged: (date) {
                                  print('change $date');
                                  setState(() {
                                    DeliveryDate = date.toString();
                                  });
                                }, onConfirm: (date) {
                                  print('confirm $date');
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                              child: Text(
                                DeliveryDate ?? 'Select Delivery date',
                                style: TextStyle(color: Colors.blue),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 25, bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InternationalPhoneNumberInput(
                          onInputChanged: (number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: controller,
                          formatInput: false,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          // inputBorder: OutlineInputBorder(),
                          onSaved: (number) {
                            print('On Saved: $number');
                            setState(() {
                              print(number.toString());
                              PhoneNumber = number.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            _toggleCheckbox();
                          },
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            "kindly confirm you are about to make order for ${widget.drinkname} with quantity ${widget.drinkprice}",
                            style: TextStyle(fontSize: 12, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 0, top: 15),
                      child: _isChecked == true
                          ? Container(
                              width: 350,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate() &&
                                      DeliveryDate != null) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    print(FullName);
                                    print(DeliveryAddress);

                                    print(DeliveryDate);
                                    print(PhoneNumber);
                                    await sucessdialogbox();
                                    _fullnamecontroller.clear();
                                    _deliveryaddresscontroller.clear();
                                    controller.clear();
                                  }

                                  formKey.currentState?.save();
                                },
                                child: Text(
                                  'Confirm My Order',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          : Container(
                              width: 350,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // sucessdialogbox();
                                  failuredialogbox();
                                },
                                child: Text(
                                  'Confirm My Order',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ))
                ],
              ),
            ),
          ]),
        ));
  }
}
