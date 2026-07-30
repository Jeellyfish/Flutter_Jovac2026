import 'package:flutter/material.dart';

class MarksheetTable extends StatelessWidget {
  const MarksheetTable({super.key});

  TableRow row(String subject, String max, String obtained) {
    return TableRow(children: [
      cell(subject),
      cell(max),
      cell(obtained),
    ]);
  }

  Widget cell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Student Marksheet",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            Table(
              border: TableBorder.all(),

              children: [

                const TableRow(
                  decoration:
                      BoxDecoration(color: Colors.deepPurple),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text("Subject",
                            style:
                                TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text("Max",
                            style:
                                TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text("Obtained",
                            style:
                                TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),

                row("Mathematics", "100", "95"),
                row("Science", "100", "90"),
                row("English", "100", "88"),
                row("Computer", "100", "98"),
                row("Hindi", "100", "85"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}