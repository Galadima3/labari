import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labari/src/features/auth/data/auth_repository.dart';
import 'package:labari/src/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:labari/src/features/auth/presentation/widgets/shared_button.dart';

import 'package:labari/src/features/news/presentation/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends ConsumerStatefulWidget {
  const LogInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  final GlobalKey myWidgetKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  @override
  void dispose() {
    emailText.dispose();
    passwordText.dispose();
    super.dispose();
  }

  void goToNextPage() {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  height: 135,
                  width: 135,
                  'assets/images/welcome.svg',
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome back!',
                  style: GoogleFonts.montserrat(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 15),

                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        validator: (text) => EmailValidator.validate(text!)
                            ? null
                            : "Please enter a valid email",
                        controller: emailText,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: passwordText,
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
                const SizedBox(
                  height: 15,
                ),

                //signin button
                GestureDetector(
                  
                  // onTap: () async {
                  // await authProvider.signInWithEmailAndPassword(emailText.text, passwordText.text);
                  // },
                  onTap: () => ref
                      .read(authRepositoryProvider)
                      .signInWithEmailAndPassword(
                          emailText.text, passwordText.text)
                      .then((value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('loggedIn', true);
                    // if (!context.mounted) {
                    //   return;
                    // }
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ));
                  }),
                  child: const SharedButton(
                    buttonText: 'Log in',
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
                      'Not a registered user?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen();
                        },
                      )),
                      child: const Text(
                        'Sign up',
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
      ),
    ));
  }
}
