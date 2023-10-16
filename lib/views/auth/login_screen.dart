import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meu_pedido/components/auth_button.dart';
import 'package:meu_pedido/components/google_button.dart';
import 'package:meu_pedido/utils/constants.dart';
import 'package:meu_pedido/views/auth/forget_password_screen.dart';
import 'package:meu_pedido/views/auth/signup_screen.dart';
import 'package:meu_pedido/views/home_screen.dart';
import 'package:meu_pedido/views/main_screen.dart';

import '../error_dialog.dart';
import '../loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;

  loginNow() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingDialog(
            message: "Checking Credentials",
          );
        });

    User? currentUser;
    await Constants.firebaseAuth
        .signInWithEmailAndPassword(
      email: _emailTextController.text.trim(),
      password: _passTextController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user!;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          });
    });
    if (currentUser != null) {
      readDataAndSetDataLocally(currentUser!).then((value) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const MainScreen()));
      });
    }
  }

  Future readDataAndSetDataLocally(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("sellers")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {});
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
                    height: 120.0,
                  ),
                  const Text(
                    'Bem-vindo',
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
                    'Cadastre para continuar',
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
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            // border: InputBorder.none,
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
                              return 'Por favor, entre com um endereço válido';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        // Password
                        TextFormField(
                          textInputAction: TextInputAction.done,
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
                            hintText: 'Senha',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onEditingComplete: () => _submitFormOnLogin(),
                          controller: _passTextController,
                          focusNode: _passFocusNode,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Por favor, entre com uma senha válida.';
                            } else {
                              return null;
                            }
                          },
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
                        'Esqueceu a senha?',
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
                  const SizedBox(
                    height: 10,
                  ),
                  AuthButton(
                    fct: () => _submitFormOnLogin(), //fct: __submitFormOnLogin
                    buttonText: 'Login',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GoogleButton(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthButton(
                    fct: () {
                      Navigator.of(context).pushNamed(MainScreen.routeName);
                    },
                    buttonText: 'Continue como convidado',
                    primary: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Não possui uma conta',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      children: [
                        TextSpan(
                          text: '   Cadastre-se',
                          style: const TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context)
                                  .pushNamed(SignupScreen.routeName);
                            },
                        ),
                      ],
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

  void _submitFormOnLogin() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      print('The form is valid!');
      loginNow();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
  }
}
