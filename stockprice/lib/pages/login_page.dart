import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stockprice/pages/verification_page.dart';
import 'package:stockprice/widgets/app_text_bold.dart';
import 'package:stockprice/widgets/bubble_layer.dart';
import 'package:stockprice/widgets/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BubbleLayer(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppTextBold(
                  text: "Login",
                  size: 45,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: bubbleColor,
                  ),
                  child: TextFormField(
                    controller: _mobileController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "*Required";
                      }
                      if (value.length < 10) {
                        return "Invalid mobile number";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      fillColor: bubbleColor,
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                      ),
                      hintText: "Mobile Number",
                      hintStyle: const TextStyle(color: Colors.black54),
                      prefixIcon: const Icon(
                        Icons.phone_iphone,
                        color: Colors.black,
                      ),
                      counterText: "",
                    ),
                  ),
                ),
                //button
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 40,
                    color: buttonColor,
                    child: ElevatedButton(
                      onPressed: () {
                        //handle click of button
                        if (_formKey.currentState!.validate()) {
                          // ignore: avoid_print
                          print("Mobile Number is ${_mobileController.text}");
                        }
                      },
                      child: const Center(
                        child: Text("Send OTP"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RichText(
                    text: TextSpan(
                      text: "By logging in you agree to the following",
                      style: const TextStyle(fontSize: 14),
                      children: [
                        TextSpan(
                            text: " Terms & Conditions",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //handle click of text
                                // ignore: avoid_print
                                print("terms and conditions");
                                //for testing purposes
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const VerificationPage()));
                              },
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            )),
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
