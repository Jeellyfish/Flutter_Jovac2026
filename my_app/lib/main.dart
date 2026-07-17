import "package:flutter/material.dart";
import "package:my_app/screen/zz_Tasks/food_menu_task.dart";
// import "screen/stateless_widgets.dart";
// import "screen/statefull_widget.dart";
// import "screen/container_widget.dart";
// import "screen/safearea_widget.dart";
// import "screen/row_column_widgets.dart";
// import "screen/stack_widget.dart";
// import "screen/spacer.dart";
// import "screen/align_widget.dart";
// import "screen/wrap_widget.dart";
// import "screen/expanded_widget.dart";
// import "screen/listview_widget.dart";
// import "screen/listtileview.dart";
// import "screen/student_idcard.dart";\
// import 'package:flutter/material.dart';
// import 'package:my_app/screen/homescreen.dart';
// import "package:my_app/screen/food_card.dart";
// import "package:my_app/screen/stack_task.dart";
// import "package:my_app/screen/Navigation/screen1.dart";
// import "package:my_app/screen/Navigation/screen2.dart";
// import "package:my_app/screen/Navigation/screen3.dart";
// import "package:my_app/screen/Navigation/push_navigation.dart";
// import "package:my_app/screen/Navigation/home_screen.dart";
// import "package:my_app/screen/Navigation/tabbar_navigation.dart";
// import "package:my_app/screen/Navigation/pass_data_screen1.dart";
// import "package:my_app/screen/Navigation/pass_data_screen2.dart";
// import "package:my_app/screen/Navigation/tabbar_navigation.dart";
// import "package:my_app/screen/Navigation/profile_avatar_screen.dart
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: const HomeScreen(),
      //home: const HomeScreen1(),
      // home:ContainerWidget(),
      // home:SafeAreaWidget(),
      // home:RowColumnWidgets(),
      // home:StackWidget(),
      // home:SpacerWidget(),
      // home:AlignWidget(),
      // home:WrapWidget()
      // home:ExpandedWidget(),
      // home:FlexibleWidget(),
      // home:ListViewWidget(),
      // home:ListTileWidget()
      // home:CardWidget(),
      // home:InkWellWidget(),
      // home: const StudentIDCard(),
      // home: const HomeScreen(),
      // home: const HomeScreen3(),
      // home: const FoodCard()
      // home: const ProfileAvatarScreen(),
      home: FoodListScreen()
    );
  }
}