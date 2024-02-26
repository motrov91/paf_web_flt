import 'package:flutter/material.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:paf_web/ui/views/dashboardView/widgets/icons_information.dart';
import 'package:paf_web/ui/views/dashboardView/widgets/reports_information.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width,
        height: size.height,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Principal',
                  style: CustomLabels.tag,
                ),
                const SizedBox(height: 10),
                const IconsInformation(),
                const SizedBox(height: 10),
                const ReportsInformation(),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: 150,
                      height: 150,
                      child: const Image(image: AssetImage('./logo.png'))),
                )
              ],
            )
          ],
        ));
  }
}
