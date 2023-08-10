import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_projects/const.dart';
import 'package:iti_projects/ecommerce/features/create_account/cubit/create_account_cubit.dart';
import 'package:iti_projects/ecommerce/widget/build_btn.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  ///Validation
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscureText = true;
  bool isCorrect = true;
  final _form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  bool isLoading = false;

  void _togglePasswordText() {
    obscureText = !obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100.0,
            bottom: 100,
            left: 20,
            right: 20,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/logo2.svg"),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome to our",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF16162E),
                              ),
                            ),
                            Text(
                              "E-Grocery",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    _textFieldTitle("Name"),
                    const SizedBox(
                      height: 8,
                    ),
                    _buildTextFormField(_nameController),
                    const SizedBox(
                      height: 10,
                    ),
                    _textFieldTitle("Email"),
                    const SizedBox(
                      height: 8,
                    ),
                    _buildTextFormField(_emailController),
                    const SizedBox(height: 10),
                    _textFieldTitle("Phone"),
                    const SizedBox(
                      height: 8,
                    ),
                    _buildTextFormField(_phoneController,validator: (val){
                      if(val!.length!=11){
                        return "phone should be 11 digits";
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    _textFieldTitle("Password"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: obscureText,
                      validator: (value) {
                        if (_passwordController.text.length < 6) {
                          return "Password should be more than 6 characters";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "5@*****",
                        filled: true,
                        suffixIcon: InkWell(
                          onTap: _togglePasswordText,
                          child: Icon(
                            obscureText
                                ? CupertinoIcons.eye_fill
                                : CupertinoIcons.eye_slash_fill,
                            color: Colors.black,
                          ),
                        ),
                        fillColor: Colors.grey[300],
                        border: _buildOutlineInputBorder(),
                        focusedBorder: _buildOutlineInputBorder(),
                        enabledBorder: _buildOutlineInputBorder(),
                        errorBorder: _buildOutlineInputBorder(),
                        disabledBorder: _buildOutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<CreateAccountCubit, CreateAccountState>(
                      builder: (context, state) {
                        if (state is CreateAccountLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return buildButton(
                          text: "Sign Up",
                          textColor: Colors.white,
                          btnColor: primaryColor,
                          onTap: () async {
                            if (_form.currentState!.validate()) {
                              await context
                                  .read<CreateAccountCubit>()
                                  .createAccount(
                                      name: _nameController.text,
                                      phone: _phoneController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text);
                            }

                            // Get.offAll(MainScreen());
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(
      TextEditingController controller, {String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        border: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        errorBorder: _buildOutlineInputBorder(),
        disabledBorder: _buildOutlineInputBorder(),
      ),
    );
  }

  Widget _buildSocialMediaButton({
    required String name,
    required String image,
    required Color color,
  }) {
    return Container(
      width: 174,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
        ),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(7),
    );
  }

  Widget _textFieldTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF8B8B97),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

/// Stateless & stateful
/// Ui : Container , SizeBox , Row , Column .......
/// Navigation
/// Packages & plugin
/// Validation TextField
/// MVC : MODEL - View- Controller

/// Database

/// Localization ( Translations )

/// State Management ( Provider , Bloc , getx , mob , riverpod ),
///

/// SharedPrefernce
/// Restful Api
