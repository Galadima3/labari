import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:labari/src/features/auth/data/auth_repository.dart';
import 'package:labari/src/features/auth/presentation/screens/log_in_screen.dart';
import 'package:labari/src/features/auth/presentation/widgets/shared_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labari/src/features/auth/services/controller.dart';
import 'package:labari/src/features/news/presentation/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.android_outlined,
                size: 95,
              ),

              Text(
                'Hello There!',
                style: GoogleFonts.montserrat(
                    fontSize: 45, fontWeight: FontWeight.w400),
              ),
              const Text('Register below',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  )),

              const SizedBox(
                height: 20,
              ),

              Form(
                key: _form,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //email textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (text) => EmailValidator.validate(text!)
                              ? null
                              : "Please enter a valid email",
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextFormField(
                          controller: _password,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.password),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //confirm password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextFormField(
                          controller: _confirmPassword,
                          validator: (value) {
                            if (value != _password.text) {
                              return 'Password do not match';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.password),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              //signin button
              GestureDetector(
                onTap: () => ref
                    .read(authRepositoryProvider)
                    .signUp(_email.text, _confirmPassword.text)
                    .then((value) async {
                  //
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ));

                  
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('loggedIn', true);

                  ref.read(testProvider.notifier).logIn();
                }),
                child: const SharedButton(
                  buttonText: 'Register',
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Registered already?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const LogInScreen();
                      },
                    )),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                          color: Color(0xFF427dde),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
