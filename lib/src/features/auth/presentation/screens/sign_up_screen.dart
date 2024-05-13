import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:labari/src/features/auth/data/auth_repository.dart';
import 'package:labari/src/features/auth/presentation/screens/log_in_screen.dart';
import 'package:labari/src/features/auth/presentation/widgets/shared_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:labari/src/features/news/presentation/screens/home_screen.dart';

final signupStatusProvider = StateProvider<bool>((ref) => false);

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
    bool isSpinKitLoading = ref.watch(signupStatusProvider);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              SvgPicture.asset(
                height: 135,
                width: 135,
                'assets/images/welcome.svg',
              ),

              const SizedBox(
                height: 20,
              ),

              Form(
                key: _form,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //email textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) => EmailValidator.validate(text!)
                            ? null
                            : "Please enter a valid email",
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email)),
                      ),
                    ),
                    const SizedBox(height: 17.5),

                    //password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: _password,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.password),
                        ),
                      ),
                    ),
                    const SizedBox(height: 17.5),

                    //confirm password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _confirmPassword,
                        validator: (value) {
                          if (_password.text.length > 6 &&
                              value != _password.text) {
                            return 'Password do not match';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: 'Confirm password',
                          prefixIcon: const Icon(Icons.password),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              //signin button
              Consumer(
                builder: (context, ref, child) {
                  final signinStatusNotifier =
                      ref.read(signupStatusProvider.notifier);
                  return GestureDetector(
                    onTap: () async {
                      signinStatusNotifier.state = true;
                      final user = await ref
                          .read(authRepositoryProvider)
                          .signUp(_email.text, _confirmPassword.text);

                      if (user != null) {
                        signinStatusNotifier.state = false;
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const HomePage();
                          },
                        ));
                      } else {
                        signinStatusNotifier.state = false;
                        return;
                      }
                    },
                    child: SharedButton(
                      inputWidget: isSpinKitLoading
                          ? Transform.scale(
                              scale: 0.65,
                              child: const CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              ),
                            )
                          : const Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 15),

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
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
