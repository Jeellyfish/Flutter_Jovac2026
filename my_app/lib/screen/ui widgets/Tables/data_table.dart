import 'package:flutter/material.dart';

class DataTableWidge extends StatelessWidget {
  const DataTableWidge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Table-Dynamic Data"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              DataTable(
                headingRowColor: WidgetStateProperty.all(Colors.blue.shade100),
                border: TableBorder.all(),
                columns: [
                  DataColumn(label: Text("Id")),
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("Course")),
                  DataColumn(label: Text("Marks")),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text("101")),
                      DataCell(Text("Pankaj")),
                      DataCell(Text("Flutter")),
                      DataCell(Text("80")),
                    ]
                ),
                  DataRow(
                    cells: [
                      DataCell(Text("102")),
                      DataCell(Text("Rahuk")),
                      DataCell(Text("Flutter")),
                      DataCell(Text("85")),
                    ]
                ),
                  DataRow(
                    cells: [
                      DataCell(Text("103")),
                      DataCell(Text("Nidhi")),
                      DataCell(Text("Android")),
                      DataCell(Text("90")),
                    ]
                ),
                  DataRow(
                    cells: [
                      DataCell(Text("104")),
                      DataCell(Text("Mukesh")),
                      DataCell(Text("IOS")),
                      DataCell(Text("88")),
                    ]
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}