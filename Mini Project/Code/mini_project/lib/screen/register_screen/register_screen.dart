import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/model/login_user_model.dart';
import 'package:mini_project/provider/login_user_provider.dart';
import 'package:mini_project/screen/login_screen/login_screen.dart';
import 'package:mini_project/theme.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController goalController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<LoginUserProvider>(context, listen: false);

    void showError(String massage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(massage),
        ),
      );
    }

    void showSucces(String massage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: greenColor,
          content: Text(massage),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: GoogleFonts.inter(),
        ),
        backgroundColor: greenColor,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF8F8F8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/image/login_image.png',
                  width: 245,
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Full Name',
                style: GoogleFonts.openSans(
                  color: const Color(0xff17171A),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  fillColor: const Color(0xffF3F3F3),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(71),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Full Name',
                  hintStyle: GoogleFonts.inter(
                    color: greyColor,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                'Email Addres',
                style: GoogleFonts.openSans(
                  color: const Color(0xff17171A),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: const Color(0xffF3F3F3),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(71),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Email',
                  hintStyle: GoogleFonts.inter(
                    color: greyColor,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                'Password',
                style: GoogleFonts.openSans(
                  color: const Color(0xff17171A),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: const Color(0xffF3F3F3),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(71),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Password',
                  hintStyle: GoogleFonts.inter(
                    color: greyColor,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                'Your Goal',
                style: GoogleFonts.openSans(
                  color: const Color(0xff17171A),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: goalController,
                decoration: InputDecoration(
                  fillColor: const Color(0xffF3F3F3),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(71),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Goal',
                  hintStyle: GoogleFonts.inter(
                    color: greyColor,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 360,
                height: 55,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        onPressed: () async {
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              goalController.text.isEmpty) {
                            showError('Semua filed harus diisi');
                          } else {
                            setState(
                              () {
                                isLoading = true;
                              },
                            );

                            LoginUser? user =
                                await userProvider.authService.register(
                              emailController.text,
                              passwordController.text,
                              nameController.text,
                              goalController.text,
                            );

                            setState(
                              () {
                                isLoading = false;
                              },
                            );

                            if (user == null) {
                              showError('Akun sudah terdaftar');
                            } else {
                              userProvider.user = user;
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (
                                    context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                  ) =>
                                      const LoginScreen(),
                                  transitionDuration:
                                      const Duration(seconds: 1),
                                  transitionsBuilder: (
                                    context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child,
                                  ) =>
                                      SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(-1, 0),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  ),
                                ),
                              );
                              showSucces('Berhasil Registrasi');
                            }
                          }
                        },
                        child: Text(
                          'Register',
                          style: GoogleFonts.openSans(
                            color: whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
