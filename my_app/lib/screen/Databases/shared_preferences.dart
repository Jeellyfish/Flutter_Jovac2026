import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDemo extends StatefulWidget {
  const SharedPreferenceDemo({super.key});

  @override
  State<SharedPreferenceDemo> createState() => _SharedPreferenceDemoState();
}

class _SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isRemember = false;
  String displayData = "No Saved data";

  @override
  void initState()
  {
    super.initState();
    loadData();     // It acts as Read operation that read data from SharedPreferences (plugin/LocalStorage)
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference DB"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person)
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 20,),
            CheckboxListTile(
              title: Text("Remember Me"),
              value: isRemember, onChanged: (value){
                setState(() {
                  isRemember = value!;
                });
              }
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: saveData, child:Text("Save Data")),
              ElevatedButton(onPressed: loadData, child:Text("Read Data")),
              ElevatedButton(onPressed: deleteData, child:Text("Delete Data")),
              ElevatedButton(onPressed: clearAll, child:Text("Clear Data")),
              SizedBox(height: 20,),
              Divider(),
              SizedBox(height: 20,),
              Text("Stored Data",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text(displayData,
              style: TextStyle(fontSize: 18,),)
          ],
        ),
      ),
    );
  }
  
  Future<void> saveData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", nameController.text);
    await prefs.setString("email", emailController.text);
    await prefs.setBool("remember", isRemember);
    print("Data Saved");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Data Saved"))
    );
    setState(() {
      nameController.text = "";
      emailController.text = "";
      isRemember = false;
    });
  }

  Future<void> loadData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      displayData =
      '''
Name: ${prefs.getString("name")?? "NA"}
Email: ${prefs.getString("email")?? "NA"}
Remember: ${prefs.getBool("remember")?? false}

''';
    });
    print("Data Loaded");
  }
  
  Future<void> deleteData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("name");
    print("Name Data Deleted");
    loadData();
  }
  
  Future<void> clearAll() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("name");
    await prefs.remove("email");
    await prefs.remove("remember");
    print("Data Removed Completely");
    loadData();
  }
  
  
}