import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({super.key});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  TextEditingController _nameController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFormField Widget"),
        backgroundColor: Colors.blue,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter Your Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value == null || value.isEmpty)
                  {
                    return "Please Enter the Name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if(formkey.currentState!.validate()){
                    print("Form Submit Succefully");
                }
              }, child:Text("Submit"))
            ],
          ),
        ),
      )
    );
  }
}