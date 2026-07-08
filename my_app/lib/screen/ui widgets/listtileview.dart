import "package:flutter/material.dart";

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Tile Widget"),
        backgroundColor: Colors.blue,
      ),
      body:ListView(
        children: [
          ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.fastfood_rounded),
          ),
          title:Text("Pankaj Kapoor", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          subtitle: Text("9729280731"),
          trailing: Icon(Icons.shopping_cart_outlined, ),
          onTap: (){
            print("Open this Contact");
          },
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title:Text("Pankaj Kapoor", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          subtitle: Text("9729280731"),
          trailing: Icon(Icons.shopping_cart_outlined, ),
          onTap: (){
            print("Open this Contact");
          },
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title:Text("Pankaj Kapoor", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          subtitle: Text("9729280731"),
          trailing: Icon(Icons.shopping_cart_outlined, ),
          onTap: (){
            print("Open this Contact");
          },
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title:Text("Pankaj Kapoor", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          subtitle: Text("9729280731"),
          trailing: Icon(Icons.shopping_cart_outlined, ),
          onTap: (){
            print("Open this Contact");
          },
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title:Text("Pankaj Kapoor", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          subtitle: Text("9729280731"),
          trailing: Icon(Icons.shopping_cart_outlined, ),
          onTap: (){
            print("Open this Contact");
          },
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title:Text("Pankaj Kapoor", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          subtitle: Text("9729280731"),
          trailing: Icon(Icons.shopping_cart_outlined, ),
          onTap: (){
            print("Open this Contact");
          },
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title:Text("Pankaj Kapoor", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          subtitle: Text("9729280731"),
          trailing: Icon(Icons.shopping_cart_outlined, ),
          onTap: (){
            print("Open this Contact");
          },
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title:Text("Pankaj Kapoor", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          subtitle: Text("9729280731"),
          trailing: Icon(Icons.shopping_cart_outlined, ),
          onTap: (){
            print("Open this Contact");
          },
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title:Text("Pankaj Kapoor", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          subtitle: Text("9729280731"),
          trailing: Icon(Icons.shopping_cart_outlined, ),
          onTap: (){
            print("Open this Contact");
          },
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title:Text("Pankaj Kapoor", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          subtitle: Text("9729280731"),
          trailing: Icon(Icons.shopping_cart_outlined, ),
          onTap: (){
            print("Open this Contact");
          },
        ),
        ]
        
      )
    );
  }
}