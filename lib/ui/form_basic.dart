import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:music_app/ui/home/home.dart';
import 'package:music_app/ui/login.dart';

class FormBasicDemo extends StatefulWidget {
  const FormBasicDemo({super.key});

  @override
  State<FormBasicDemo> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  final _formKey = GlobalKey<FormState>();
  String? _fullname, _taikhoan, _birthOfDate, _phoneNumber, _pass;
  final _matKhauController = TextEditingController();
  final _reMatKhauController = TextEditingController();
  final _dateofBirthConTroller = TextEditingController();
  DateTime? _dateOfBirth;
  late String formattedDate;

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
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign up", style: TextStyle(fontSize: 30)),
                    Row(
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                          },
                          child: Text("Login", style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFormField(label: "Fullname", onSaved: (newValue) {
                            _fullname = newValue;
                          }, obscure: false,),
                          CustomFormField(label: "Email", onSaved: (newValue) {
                            _taikhoan = newValue;
                          },obscure: false),
                          Text("Birth of date", style: const TextStyle(color: Colors.grey)),
                          SizedBox(height: 5,),
                          TextFormField(
                            controller: _dateofBirthConTroller,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.calendar_today)
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2026)
                              );
                              if(pickedDate!=null){
                                formattedDate = DateFormat("dd/MM/yyyy").format(pickedDate);
                                setState(() {
                                  _dateofBirthConTroller.text = formattedDate;
                                  _dateOfBirth = pickedDate;
                                });
                              }
                            },
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please fill out Birth of date';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10,),

                          CustomFormField(label: "Phone Number", onSaved: (newValue) {
                            _phoneNumber = newValue;
                          },obscure: false),
                          CustomFormField(label: "Password", onSaved: (newValue) {
                            _pass = newValue;
                          },obscure: true),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => Login(
                                                tk: _taikhoan.toString(),
                                                mk: _pass.toString(),
                                              ),
                                        ),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Xin chaoo $_fullname,$_taikhoan,$_phoneNumber,$formattedDate" ,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text("Register"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
}

class CustomFormField extends StatelessWidget {
  final String label;
  final Function(String?) onSaved;
  final bool obscure;
  const CustomFormField({
    super.key,
    required this.label,
    required this.onSaved,
    required this.obscure
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        TextFormField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill out $label';
            }
            return null;
          },
          onSaved: onSaved,
          obscureText: obscure,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}