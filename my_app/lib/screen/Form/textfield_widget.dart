import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _secureText = true;
  
  TextEditingController  _nameController = TextEditingController();
  TextEditingController  _passwordController = TextEditingController();

  String? _passwordError = "";
  String? _nameError = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField Widget"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Colors.blue,),
                hintText: "Enter Your Name",
                border:OutlineInputBorder(),
                labelText: "Name",
                errorText: _nameError,
                // border:InputBorder.none
                // border:UnderlineInputBorder(),
                // fillColor: Colors.blueGrey,
                // filled: true
              ),
              // maxLength: 20,
              // maxLines: 5,
              // keyboardType: TextInputType.number,
              // keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                errorText: _passwordError,
                hintText: "Enter Your Password",
                border:OutlineInputBorder(),
                labelText: "Password",
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _secureText = !_secureText;
                  });
                }, 
                icon: Icon(_secureText?Icons.visibility:Icons.visibility_off)
                )
              ),
              maxLength: 20,
              obscureText: _secureText,

              // keyboardType: TextInputType.number,
              // keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
                

                setState(() {
                if(_nameController.text.trim() =="" && _passwordController.text.length<6)
                {
                  _passwordError ="Password should not less than 6";
                  _nameError = "Name can not be Blank";
                }else{
                  _nameError = null;
                  _passwordError = null;
                  print("Name: "+ _nameController.text);
                  print("Password: "+ _passwordController.text);
                }
                });
                
            }, child: Text("Submit"))
          ],
        ),
      )
    );
  }
}