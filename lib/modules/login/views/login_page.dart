import 'package:flutter/material.dart';
import 'package:sic/modules/home/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/ChatBc.png'),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign In to SIC ERP System',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Text('Your gateway to seamless ERP access, SIC login here.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 25),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tolong masukkan username anda';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Username', border: OutlineInputBorder())),
                  const SizedBox(height: 15),
                  TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tolong masukkan password anda';
                        } else if (value.length < 6) {
                          return 'Password minimal 6 karakter';
                        }
                        return null;
                      },
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ))),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                        colors: [Colors.green, Colors.lightGreenAccent])),
                child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                    child: const Text('Sign In')))
          ],
        ),
      )),
    );
  }
}
