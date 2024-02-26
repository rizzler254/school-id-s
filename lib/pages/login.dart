import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

 @override
 _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Login Page'),
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           const Text(
             'Login',
             style: TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.bold,
             ),
           ),
           const SizedBox(height: 16),
           TextFormField(
             decoration: const InputDecoration(
              
               labelText: 'User id',
             ),
           ),
           const SizedBox(height: 16),
           TextFormField(
             decoration: const InputDecoration(
               labelText: 'Password',
             ),
             obscureText: true,
           ),
           const SizedBox(height: 16),
           ElevatedButton(
             onPressed: () {
               // Perform login logic here
             },
             child: const Text('Login'),
           ),
           const SizedBox(height: 16),
           TextButton(
             onPressed: () {
               // Navigate to signup page
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const SignupPage()),
               );
             },
             child: const Text('Don\'t have an account? Sign up'),
           ),
         ],
       ),
     ),
   );
 }
}


class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Signup Page'),
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           const Text(
             'Signup',
             style: TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.bold,
             ),
           ),
           const SizedBox(height: 16),
           TextFormField(
             decoration: const InputDecoration(
               labelText: 'User id',
             ),
           ),
           const SizedBox(height: 16),
           TextFormField(
             decoration: const InputDecoration(
               labelText: 'Password',
             ),
             obscureText: true,
           ),
           const SizedBox(height: 16),
           ElevatedButton(
             onPressed: () {
               // Perform signup logic here
             },
             child: const Text('Signup'),
           ),
           const SizedBox(height: 16),
           TextButton(
             onPressed: () {
               // Navigate back to login page
               Navigator.pop(context);
             },
             child: const Text('Already have an account? Login'),
           ),
         ],
       ),
     ),
   );
 }
}



