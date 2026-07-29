// import "package:flutter/material.dart";
// import 'screen/zz_Tasks/home_screen14.dart';

// void main(){
//   runApp(const StudentPortalApp());
// }

// class StudentPortalApp extends StatelessWidget {
//   const StudentPortalApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "College Student Portal",
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.deepPurple,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() => runApp(const StudentPortalApp());

class StudentPortalApp extends StatelessWidget {
  const StudentPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'College Student Portal',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = const [
    Center(child: Text("Home Content")),
    Center(child: Text("Attendance\n85%", textAlign: TextAlign.center)),
    Center(child: Text("Assignments")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                accountName: Text("John Doe"),
                accountEmail: Text("Roll No. 101"),
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              ListTile(leading: Icon(Icons.dashboard), title: Text("Dashboard")),
              ListTile(leading: Icon(Icons.person), title: Text("Profile")),
              ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
              ListTile(leading: Icon(Icons.logout), title: Text("Logout")),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("College Student Portal"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple],
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Courses"),
              Tab(text: "Notices"),
              Tab(text: "Results"),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  colors: [Colors.teal, Colors.blue],
                ),
              ),
              child: const Row(
                children: [
                  CircleAvatar(radius: 28, child: Icon(Icons.person)),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      "Welcome Back!\nB.Tech CSE\nRoll No. 101",
                      style: TextStyle(color: Colors.white,fontSize:16),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 220,
              child: TabBarView(
                children: [
                  _SimpleList(title: "Courses", icon: Icons.book),
                  _SimpleList(title: "Notices", icon: Icons.campaign),
                  _SimpleList(title: "Results", icon: Icons.bar_chart),
                ],
              ),
            ),
            Expanded(child: pages[index]),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (v)=>setState(()=>index=v),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label:"Attendance"),
            BottomNavigationBarItem(icon: Icon(Icons.assignment),label:"Assignments"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile"),
          ],
        ),
      ),
    );
  }
}

class _SimpleList extends StatelessWidget {
  final String title;
  final IconData icon;
  const _SimpleList({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: List.generate(
        3,
        (i)=>Card(
          child: ListTile(
            leading: Icon(icon,color: Colors.deepPurple),
            title: Text("$title ${i+1}"),
            subtitle: const Text("Sample information"),
          ),
        ),
      ),
    );
  }
}
