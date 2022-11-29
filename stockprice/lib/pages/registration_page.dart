import 'package:flutter/material.dart';

import '../widgets/app_text_bold.dart';
import '../widgets/bubble_layer.dart';
import '../widgets/constants.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
   final TextEditingController _codeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> genderItems = ["Male", "Female", "Other"];
  String _selectGender = "Select Gender";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BubbleLayer(
        // ignore: sized_box_for_whitespace
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //making close icon clickable

              GestureDetector(
                onTap: () {
                  //handle close
                  // ignore: avoid_print
                  print("close");
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: bubbleColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.close_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //image will be taken from the profile page
                        const AppTextBold(text: "Registration"),

                        Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            controller: _nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "*Required";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Name",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "*Required";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Email",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //dropdown
                        Container(
                          color: bubbleColor,
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          padding: const EdgeInsets.only(left: 10),
                          child: DropdownButton<String>(
                            underline: Container(),
                            icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.black,
                            ),
                            isExpanded: true,
                            value: _selectGender,
                            hint: const Text("Select Gender"),
                            items: genderItems
                                .map(
                                  (e) => DropdownMenuItem<String>(
                                    value: _selectGender,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (val) {
                              // ignore: avoid_print
                              print(val);
                              setState(() {
                                _selectGender = val.toString();
                              });
                            },
                          ),
                        ),

                        //button
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: Container(
                            height: 40,
                            color: buttonColor,
                            child: ElevatedButton(
                              onPressed: () {
                                //handle click of button
                                if (_formKey.currentState!.validate()) {
                                  // ignore: avoid_print
                                  print("Code is ${_codeController.text}");
                                }
                              },
                              child: const Center(
                                child: Text("Register"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
