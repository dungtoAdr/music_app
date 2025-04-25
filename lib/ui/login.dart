import 'package:flutter/material.dart';
import 'package:music_app/ui/form_basic.dart';
import 'package:music_app/ui/home/home.dart';

class Login extends StatefulWidget {
  final String? tk,mk;
  const Login({super.key, this.tk, this.mk});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final taikhoanControl = TextEditingController();
  final matkhauControl = TextEditingController();
  bool _isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blueAccent,Colors.cyanAccent], begin: Alignment.topLeft, end: Alignment.bottomLeft)
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding:  const EdgeInsets.only(left: 16.0,right: 16, top: 48),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        spacing: 20,
                        children: [
                          Text("Login",style: TextStyle(
                            fontSize: 40
                          ),),
                          Row(
                           mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Don't have an account? "),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FormBasicDemo(),));
                              }, child: Text("Sign Up",style: TextStyle(color: Colors.blueAccent),))
                            ],
                          ),

                          CustomField(label: "Email", controller: taikhoanControl, obscure: false),
                          CustomField(label: "Password", controller: matkhauControl, obscure: true),
                          Row(
                            children: [
                              Expanded(child: CheckboxListTile(
                                title: Text("Remember me",style: TextStyle(fontSize: 15),),
                                value: _isAgreed,
                                onChanged: (value) {
                                  setState(() {
                                    _isAgreed = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),

                              )),
                                Expanded(child: TextButton(
                                  onPressed: () {},
                                  child: Text("Forgot Password?", style: TextStyle(color: Colors.blueAccent)),
                                ))
                              ,
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: ElevatedButton(onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  _formKey.currentState!.save();
                                  if(taikhoanControl.text==widget.tk && matkhauControl.text==widget.mk){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MusicHomePage(),));
                                  } else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Login faild"), margin: EdgeInsets.only(left: 16,right: 16, bottom: 50), behavior: SnackBarBehavior.floating,backgroundColor: Colors.green, duration: Duration(milliseconds: 1000),)
                                    );
                                  }
                                }
                              },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Colors.blueAccent,foregroundColor: Colors.white), child: Text("Log in")))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscure;
  const CustomField({super.key,required this.label, required this.controller, required this.obscure});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        SizedBox(height: 5,),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          controller: controller,
          validator: (value) {
            if(value==null || value.isEmpty){
              return 'Please fill out $label';
            }
            return null;
          },
          obscureText: obscure,
        ),
      ],
    );
  }
}
