import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailText =TextEditingController();
  var passwordText =TextEditingController();
  var obscureText =true;
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("login"),
      ),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: Center(
         child: SingleChildScrollView(
           child: Form(
             key: formKey,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children:  [
                  const Text("Login",style: TextStyle(
                     fontSize: 30,
                     color: Colors.cyan,
                 fontWeight: FontWeight.bold,
                 ),
                 ),
                  SizedBox(height: 20.0),
                 defaultFormField(
                     controller: emailText,
                     prefixIcon: Icon(Icons.mail),
                   labelText: "Email Address",
                     keyboardType: TextInputType.emailAddress,
                   validator: (v){
                     if (v?.isEmpty == true) {
                       return "email address must not be empty";
                     }
                     return null;
                   },
                 ),
                  SizedBox(height: 20.0),
                 defaultFormField(
                     controller: passwordText,
                   prefixIcon: Icon(Icons.lock),
                   onSuffixIconPressed: () {
                       setState(() {
                         obscureText = !obscureText;

                       });

                   },
                   suffixIcon: obscureText ?  const Icon(Icons.visibility) :const Icon(Icons.visibility_off) ,
                   labelText: "Password",
                   obscureText: obscureText,
                   keyboardType: TextInputType.visiblePassword,
                   validator: (v){
                     if (v?.isEmpty == true) {
                       return "password address must not be empty";
                     }
                     return null;
                   },
                 ),
                  const SizedBox(height: 20.0),
                 defaultButton(text: 'Login',
                     function: (){
                       if (formKey.currentState?.validate() == true) {
                         print(emailText.text);
                         print(passwordText.text);
                       }

                 }),
                   const SizedBox(height: 20.0),
                 Row(

                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Don't have an acount"),
                     TextButton(onPressed: (){},
                         child: Text("Register Now ")
                     )
                   ],
                 ),
               ],
             ),
           ),
         ),
       ),
     ),
    );
  }
}
