import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/presentation/widgets/app_dropdown/app_dropdown.dart';
import 'package:lgs_revpro/sources/route/app_route.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            const AppDropDown<String>(
              title: "Local Government",
              enabled: false,
              selectedItem: "Langtang North",
            ),
            GestureDetector(
              onTap: () {
Navigator.of(context).pushNamed(AppRoute.dataForm);
              },
              child: const ListTile(
                title: Text("Sabon Gida"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
