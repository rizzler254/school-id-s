import 'package:scids/constants/colors.dart';
import 'package:scids/screens/dashboard.dart';
import 'package:scids/utils/validate.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool isEmailValid = false;

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: tertiaryColor,
      child: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: primaryColor,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Sign in to continue.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                loginFormContainer("Email Address", emailController),
                const SizedBox(
                  height: 20,
                ),
                loginFormContainer("Password", passwordController),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(color: blackColor.withOpacity(0.5)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardView(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget loginFormContainer(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: title == "Email Address"
                ? Border.all(
                    width: 0.5,
                    color: controller.text.isEmpty
                        ? Colors.grey
                        : isEmailValid
                            ? Colors.green
                            : Colors.red,
                  )
                : Border.all(width: 0.5, color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: (value) {
                if (title == "Email Address") {
                  if (value.isEmpty) {
                    setState(() {
                      isEmailValid = true;
                    });
                  } else {
                    final isValid = validateEmailAddress(value);
                    if (isValid) {
                      setState(() {
                        isEmailValid = true;
                      });
                    } else {
                      setState(() {
                        isEmailValid = false;
                      });
                    }
                  }
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
