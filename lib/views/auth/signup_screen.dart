import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meu_pedido/components/auth_button.dart';
import 'package:meu_pedido/controller/login_controller.dart';
import 'package:meu_pedido/views/auth/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';
import '../main_screen.dart';
import 'forget_password_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const routeName = '/SignupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _addressTextController = TextEditingController();

  final _passFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();

  bool _obscureText = true;

  

  void authenticateAndSignUpUser() async {
    User? currentUser;
    
    // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await Constants.firebaseAuth.createUserWithEmailAndPassword(
      email: _emailTextController.text.trim(),
      password: _passTextController.text.trim(),
    ).then((auth) {
      currentUser = auth.user;
    });

    if(currentUser != null) {
      saveDataToFirestore(currentUser!).then((value) {
        Navigator.of(context).pushNamed(MainScreen.routeName);
      });
    }

  }

  Future saveDataToFirestore(User currentUser) async {
    FirebaseFirestore.instance.collection("users").doc(currentUser.uid).set({
      "userUid": currentUser.uid,
      "userFullName": _fullNameController.text.trim(),
      "userEmail": _emailTextController.text.trim(),
      "userPassword": _passTextController.text.trim(),
      "userAddress": _addressTextController.text.trim(),
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            duration: 800,
            autoplayDelay: 8000,
            itemBuilder: (context, index) {
              return Image.asset(
                Constants.authImagesPaths[index],
                fit: BoxFit.cover,
              );
            },
            autoplay: true,
            itemCount: Constants.authImagesPaths.length,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.canPop(context)
                        ? Navigator.pop(context)
                        : null,
                    child: const Icon(
                      IconlyLight.arrow_left_2,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text(
                    'Sign up to continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Full name
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Full name',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          controller: _fullNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is missing';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // E-mail
                        TextFormField(
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'E-mail',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please, enter a valid e-mail address';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Password
                        TextFormField(
                          focusNode: _passFocusNode,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_addressFocusNode),
                          controller: _passTextController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please, enter a valid password';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Address
                        TextFormField(
                          focusNode: _addressFocusNode,
                          textInputAction: TextInputAction.done,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Address',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onEditingComplete: () => _submitFormOnSignUp(),
                          controller: _addressTextController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 10) {
                              return 'Please, enter a valid address';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AuthButton(
                          fct: () => _submitFormOnSignUp(),
                          buttonText: 'Sign up',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Already a user?',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                  text: '   Sign in',
                                  style: const TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: 18,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              LoginScreen.routeName);
                                    }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(ForgetPasswordScreen.routeName),
                      child: const Text(
                        'Forget password?',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.lightBlue,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitFormOnSignUp() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      authenticateAndSignUpUser();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _addressTextController.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _addressFocusNode.dispose();
  }
}
