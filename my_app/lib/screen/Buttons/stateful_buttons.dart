import "package:flutter/material.dart";

class StatefulButtons extends StatefulWidget {
  const StatefulButtons({super.key});

  @override
  State<StatefulButtons> createState() => _StatefulButtonsState();
}

class _StatefulButtonsState extends State<StatefulButtons> {
  bool isDark = false;
  Color themeColor = Colors.white;
  List<bool> selectedButton = [false, true, false];
  // Check box
  bool isChecked = false;
  // radio widget
  String gender = "Male";
  // slider
  double sliderValue = 50;
  // Stepper
  int currentStep = 0;
  // CHoice chip
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Button"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Toggle Buttons
            Text("Toogle Buttons", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            ToggleButtons(
              isSelected: selectedButton,
              onPressed: (index){
                setState(() {
                  for(int i=0;i<selectedButton.length;i++){
                  selectedButton[i] = false;
                  }
        
                selectedButton[index] = true;
                
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Bold"),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Italic"),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("underline"),
                ),
              ],
            ),
            // Check Box Button
            SizedBox(height: 10,),
            Text("Checkbox Buttons", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            CheckboxListTile(
              title:Text("Accept Terms & Conditions"),
              value: isChecked, 
            onChanged: (value){
                setState(() {
                  isChecked = value!;
                });
            }
            ),
        
            // Radio Button
            SizedBox(height: 10,),
            Text("Radio Buttons", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
        
            RadioListTile(
              title: Text("Male"),
              value: "Male",
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                });
              },
              ),
              SizedBox(height: 10,),
            RadioListTile(
              title: Text("Female"),
              value: "female",
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                });
              },
              ),
            // Switch Button
            SizedBox(height: 10,),
            Text("Swtich Buttons", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            SwitchListTile(
              title: Text("Dark Mode"),
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
        
                  if (isDark) {
                    themeColor = Colors.black;
                    print("Dark Theme Enabled");
                  } else {
                    themeColor = Colors.white;
                    print("Light Theme Enabled");
                  }
                });
              },
            ),
            Container(
              width: double.infinity,
              height: 80,
              alignment: Alignment.center,
              color: isDark? Colors.black:Colors.white,
            ),
            SizedBox(height: 10,),
             // Switch Button
            Text("Slider Buttons", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Slider(
              value: sliderValue, 
              min:0,
              max:100,
              onChanged: (value){
              setState(() {
                sliderValue = value;
              });
            }),
            // Stepper Button
            SizedBox(height: 10,),
            Text("Stepper Buttons", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Stepper(
              physics: NeverScrollableScrollPhysics(),  
              currentStep: currentStep,
              onStepContinue: (){
                if(currentStep<2)
                {
                  setState(() {
                    currentStep++;
                  });
                }
              },
              onStepCancel: (){
                if(currentStep>0)
                {
                  setState(() {
                    currentStep--;
                  });
                }
              },
              steps: const [
                Step(title: Text("Login"), content:Text("Enter Login details")),
                Step(title: Text("Address"), content:Text("Enter Address")),
                Step(title: Text("Payment"), content:Text("Complete Payment")),
              ]
              ),
               // Stepper Button
            SizedBox(height: 10,),
            Text("Chips Buttons", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Chip(
                  label: Text("Flutter"),
                  avatar: Icon(Icons.flutter_dash),
                  ),
                Chip(
                  label: Text("Android"),
                  avatar: Icon(Icons.android),
                  ),
                Chip(
                  label: Text("IOS"),
                  avatar: Icon(Icons.ios_share),
                  ),
              ],
            ), 
            SizedBox(height: 20,),
            ActionChip(
              label: Text("Action Chip"),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Action Chip Clicked"))
                );
              },
            ),
              SizedBox(height: 20,),
            ChoiceChip(
              label: Text("Choice Chip"), 
              selected: isSelected,
              onSelected: (value){
                setState(() {
                  isSelected = value;
                });
              },
              )
          ],
        ),
      ),
    );
  }
}