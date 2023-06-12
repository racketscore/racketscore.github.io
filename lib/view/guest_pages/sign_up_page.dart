import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racketscore/view/guest_pages/sign_in_page.dart';
import '../../data/appwrite_service.dart';
import '../../presentation/utils.dart';
import '../base_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends BasePageState<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _password2Controller,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Repeat password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                final AppwriteService appwrite = context.read<AppwriteService>();
                 if(!Utils.validateEmail(_emailController.text)){
                showSnackBar("Email is not valid", context);
                }
                else if(_passwordController.text.length < 8){
                  showSnackBar("Password is too short (min. 8 characters)", context);
                }
                else if (_passwordController.text != _password2Controller.text){
                  showSnackBar("Password values are not equal", context);
                }

                else{
                  await appwrite.createUser(email: _emailController.text, password: _passwordController.text);
                  showSnackBar("User registered saccessfully", context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => SignInPage()));
                }

              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

}