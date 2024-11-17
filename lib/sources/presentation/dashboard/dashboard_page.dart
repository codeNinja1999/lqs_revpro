import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/core/app_core.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      // appBar: const MyAppBar(allowBack: false),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSize.viewMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Welcome Guest", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSize.viewSpacing),
              const AppDropDown<String>(
                title: "Local Government",
                items: [],
                enabled: false,
                selectedItem: "Langtang North",
              ),
              const SizedBox(height: AppSize.inset),
              Text("List Wards", style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: AppSize.inset),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoute.dataForm);
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.inset),
                  shape: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(AppSize.cornerRadiusMedium)),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                  ),
                  title: const Text("Sabon Gida"),
                  trailing: const Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
