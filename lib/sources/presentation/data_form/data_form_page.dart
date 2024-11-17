import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/presentation/widgets/app_bar/app_bar.dart';
import 'package:lgs_revpro/sources/presentation/widgets/textfield/app_textfield.dart';

class DataFormPage extends StatefulWidget {
  const DataFormPage({super.key});

  @override
  State<DataFormPage> createState() => _DataFormPageState();
}

class _DataFormPageState extends State<DataFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Data"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSize.viewMargin),
        child: Column(
          children: [
            AppTextfield(
              title: "Market taxes",
            ),
            const SizedBox(height: AppSize.inset),
            AppTextfield(
              title: "Motor Park levies",
            ),
            const SizedBox(height: AppSize.inset),
            AppTextfield(
              title: "Radio and television license fees (other than radio and television transmitter)",
            ),
            const SizedBox(height: AppSize.inset),
            AppTextfield(
              title: "Vehicle  license fees",
            ),
            const SizedBox(height: AppSize.inset),
            AppTextfield(
              title: "Wrong parking charges",
            ),
            const SizedBox(height: AppSize.inset),
            AppTextfield(
              title: "Public conveniences, sewage and refuse dispatching fees",
            ),
            const SizedBox(height: AppSize.inset),
            AppTextfield(
              title: "Shops and kiosks rates",
            ),
            const SizedBox(height: AppSize.inset),
            AppTextfield(
              title: "Tenement rates",
            ),
            const SizedBox(height: AppSize.inset),
            AppTextfield(
              title: "Slaughter slab fees",
            ),
            const SizedBox(height: AppSize.inset),
            AppTextfield(
              title: "Marriage, birth and dead registration fees",
            ),
            const SizedBox(height: AppSize.inset),
            AppTextfield(
              title: "Street registration fees",
            ),
            AppTextfield(
              title: "Right of Occupancy (C of O) fees",
            ),
          ],
        ),
      ),
    );
  }
}
