import "package:flutter/material.dart";

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Container Widget"),
      backgroundColor: Colors.orange,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 200,
              // margin: EdgeInsets.all(10),
              // margin: EdgeInsets.only(left:10, top:20),
              margin: EdgeInsets.fromLTRB(10,20, 30, 10),
              padding: EdgeInsets.all(20),
              // alignment: Alignment.center,
            
              decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 5, color: Colors.red),
              ),
              // child:Text("Hello Friends")
              child:Container(
                width:double.infinity,
                height:double.infinity,
                color: Colors.red,
                alignment: Alignment.center,
                child:Text("Hello")
              )
            ),
            Container(
              width:100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage("https://lh3.googleusercontent.com/a/ACg8ocLFEebqk7XQbCTJH585Lk0571IUSwJ5L0XLQ8_E2IChm9XiAmee=s432-c-no"),
                  fit: BoxFit.cover,
              
                )
              ),
            )
          ],
        ),
      )
    );
  }
}