import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labari/src/features/auth/data/auth_repository.dart';
import 'package:labari/src/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:labari/src/features/auth/presentation/widgets/shared_button.dart';

import 'package:labari/src/features/news/presentation/screens/home_screen.dart';

final passwordVisibilityProvider = StateProvider<bool>((ref) => true);

final loginStatusProvider = StateProvider<bool>((ref) => false);

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
  bool isLoading = false;

  @override
  void dispose() {
    emailText.dispose();
    passwordText.dispose();
    super.dispose();
  }

  void goToNextPage() {}
  @override
  Widget build(BuildContext context) {
    bool isPasswordVisible = ref.watch(passwordVisibilityProvider);
    bool isSpinnerLoading = ref.watch(loginStatusProvider);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
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
                  child: TextFormField(
                    validator: (text) => EmailValidator.validate(text!)
                        ? null
                        : "Please enter a valid email",
                    controller: emailText,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: passwordText,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        ref.read(passwordVisibilityProvider.notifier).state =
                            !isPasswordVisible;
                      },
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              //signin button
              Consumer(
                builder: (context, ref, child) {
                  final loginStatusNotifier =
                      ref.read(loginStatusProvider.notifier);
                  return GestureDetector(
                    onTap: () async {
                      loginStatusNotifier.state = true;
                      final user = await ref
                          .read(authRepositoryProvider)
                          .signInWithEmailAndPassword(
                              emailText.text, passwordText.text);

                      if (user != null) {
                        loginStatusNotifier.state = false;

                        // ignore: use_build_context_synchronously
                        await Navigator.pushReplacement(context,
                            MaterialPageRoute(
                          builder: (context) {
                            return const HomePage();
                          },
                        ));
                      } else {
                        loginStatusNotifier.state = false;
                        return;
                      }
                    },
                    child: SharedButton(
                      inputWidget: isSpinnerLoading
                          ? Transform.scale(
                              scale: 0.65,
                              child: const CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              ),
                            )
                          : const Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                    ),
                  );
                },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
