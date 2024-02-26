import 'package:flutter/material.dart';
import 'package:paf_web/ui/views/dashboardView/widgets/graphic_reports.dart';
import 'package:paf_web/ui/views/dashboardView/widgets/reports_button.dart';

class ReportsInformation extends StatelessWidget {
  const ReportsInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 300,
      child: Row(
        children: [
          GraphicReports(),
          SizedBox(width: 10,),
          ReportsButton()
        ],
      ),
    );
  }
}
