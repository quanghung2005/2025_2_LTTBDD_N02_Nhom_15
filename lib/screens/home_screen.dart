import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../widgets/medication_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.app_title ?? 'Nhắc Thuốc'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: l10n?.nav_about ?? 'Thông tin',
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n?.hello_user ?? 'Chào bạn,',
                    style: const TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n?.today_summary(2) ?? 'Bạn có 2 liều thuốc hôm nay',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                l10n?.nav_medicines ?? 'Lịch trình hôm nay',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textColorDark,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 80, left: 16, right: 16),
                children: const [
                  MedicationCard(
                    time: '08:00',
                    medicationName: 'Paracetamol',
                    dosage: '1 viên - Sau khi ăn',
                    categoryIcon: Icons.medication_outlined,
                    status: 'taken',
                  ),
                  MedicationCard(
                    time: '20:00',
                    medicationName: 'Vitamin C 500mg',
                    dosage: '1 viên - Trước khi ăn',
                    categoryIcon: Icons.healing,
                    status: 'upcoming',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: Text(l10n?.add_med_title ?? 'Thêm thuốc'),
      ),
    );
  }
}
