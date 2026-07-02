import "package:flutter/material.dart";
import "screen/stateless_widgets.dart";
import "screen/statefull_widget.dart";
import "screen/container_widget.dart";
import "screen/safearea_widget.dart";
import "screen/row_column_widgets.dart";
import "screen/stack_widget.dart";
import "screen/spacer.dart";
import "screen/align_widget.dart";
import "screen/wrap_widget.dart";
import "screen/expanded_widget.dart";
import "screen/listview_widget.dart";
import "screen/listtileview.dart";


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
      home:ListTileWidget()
      // home:CardWidget(),
      // home:InkWellWidget(),

    );
  }
}