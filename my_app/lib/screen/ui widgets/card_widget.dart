import "package:flutter/material.dart";

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:Text("Card Widget"),
      backgroundColor: Colors.blue
    ),
    body:Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Card(
          elevation: 5,
          child:ListTile(
              leading: Icon(Icons.phone_android, size:35, color: Colors.blue,),
              title:Text("Samsung Galaxy ", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text("Rs. 74,999"),
              trailing: ElevatedButton(onPressed: (){
                print("Item Added into Cart");
              }, child: Text("Add"))
            ),
        ),
        Card(
          elevation: 5,
          child:ListTile(
              leading: Icon(Icons.phone_android, size:35, color: Colors.blue,),
              title:Text("Samsung Galaxy ", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text("Rs. 74,999"),
              trailing: ElevatedButton(onPressed: (){
                print("Item Added into Cart");
              }, child: Text("Add"))
            ),
        ),
        Card(
          elevation: 5,
          child:ListTile(
              leading: Icon(Icons.phone_android, size:35, color: Colors.blue,),
              title:Text("Samsung Galaxy ", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text("Rs. 74,999"),
              trailing: ElevatedButton(onPressed: (){
                print("Item Added into Cart");
              }, child: Text("Add"))
            ),
        ),
        Card(
          elevation: 5,
          child:ListTile(
              leading: Icon(Icons.phone_android, size:35, color: Colors.blue,),
              title:Text("Samsung Galaxy ", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text("Rs. 74,999"),
              trailing: ElevatedButton(onPressed: (){
                print("Item Added into Cart");
              }, child: Text("Add"))
            ),
        ),
        Card(
          elevation: 5,
          child:ListTile(
              leading: Icon(Icons.phone_android, size:35, color: Colors.blue,),
              title:Text("Samsung Galaxy ", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text("Rs. 74,999"),
              trailing: ElevatedButton(onPressed: (){
                print("Item Added into Cart");
              }, child: Text("Add"))
            ),
        ),
        Card(
          elevation: 5,
          child:ListTile(
              leading: Icon(Icons.phone_android, size:35, color: Colors.blue,),
              title:Text("Samsung Galaxy ", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text("Rs. 74,999"),
              trailing: ElevatedButton(onPressed: (){
                print("Item Added into Cart");
              }, child: Text("Add"))
            ),
        ),
        Card(
          elevation: 5,
          child:ListTile(
              leading: Icon(Icons.phone_android, size:35, color: Colors.blue,),
              title:Text("Samsung Galaxy ", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text("Rs. 74,999"),
              trailing: ElevatedButton(onPressed: (){
                print("Item Added into Cart");
              }, child: Text("Add"))
            ),
        ),
        Card(
          elevation: 5,
          child:ListTile(
              leading: Icon(Icons.phone_android, size:35, color: Colors.blue,),
              title:Text("Samsung Galaxy ", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text("Rs. 74,999"),
              trailing: ElevatedButton(onPressed: (){
                print("Item Added into Cart");
              }, child: Text("Add"))
            ),
        ),
        Card(
          elevation: 5,
          child:ListTile(
              leading: Icon(Icons.phone_android, size:35, color: Colors.blue,),
              title:Text("Samsung Galaxy ", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text("Rs. 74,999"),
              trailing: ElevatedButton(onPressed: (){
                print("Item Added into Cart");
              }, child: Text("Add"))
            ),
        ),
        Card(
          elevation: 5,
          child:ListTile(
              leading: Icon(Icons.phone_android, size:35, color: Colors.blue,),
              title:Text("Samsung Galaxy ", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text("Rs. 74,999"),
              trailing: ElevatedButton(onPressed: (){
                print("Item Added into Cart");
              }, child: Text("Add"))
            ),
        ),
        ],
        
      ),
    )
    );
  }
}