import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../l10n/app_localizations.dart';

class MedicationCard extends StatelessWidget {
  final String time;
  final String medicationName;
  final String dosage;
  final IconData categoryIcon;
  final String status;
  final ValueChanged<String>? onStatusChanged;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const MedicationCard({
    super.key,
    required this.time,
    required this.medicationName,
    required this.dosage,
    required this.categoryIcon,
    required this.status,
    this.onStatusChanged,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (status == 'taken') {
      statusColor = AppTheme.successColor;
      statusText = l10n?.status_taken ?? 'Đã uống';
      statusIcon = Icons.check_circle;
    } else if (status == 'skipped') {
      statusColor = AppTheme.dangerColor;
      statusText = l10n?.status_skipped ?? 'Bỏ qua';
      statusIcon = Icons.cancel;
    } else {
      statusColor = AppTheme.secondaryColor;
      statusText = l10n?.status_upcoming ?? 'Sắp tới';
      statusIcon = Icons.access_time;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textColorDark,
                  ),
                ),
              ],
            ),

            Container(
              height: 50,
              width: 1,
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        categoryIcon,
                        color: AppTheme.primaryColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          medicationName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textColorDark,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dosage,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppTheme.textColorLight,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(statusIcon, color: statusColor, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 12,
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (onStatusChanged != null)
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert,
                  color: AppTheme.textColorLight,
                ),
                onSelected: (value) {
                  if (value == 'edit') {
                    onEdit?.call();
                  } else if (value == 'delete') {
                    if (onDelete != null) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(l10n?.action_delete ?? 'Xóa'),
                          content: Text(
                            l10n?.delete_confirm ??
                                'Bạn có chắc chắn muốn xóa thuốc này?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(l10n?.btn_cancel ?? 'Hủy'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                onDelete!();
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: AppTheme.dangerColor,
                              ),
                              child: Text(l10n?.action_delete ?? 'Xóa'),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    onStatusChanged?.call(value);
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'taken',
                    child: Text(l10n?.status_taken ?? 'Đã uống'),
                  ),
                  PopupMenuItem<String>(
                    value: 'skipped',
                    child: Text(l10n?.status_skipped ?? 'Bỏ qua'),
                  ),
                  PopupMenuItem<String>(
                    value: 'upcoming',
                    child: Text(l10n?.status_upcoming ?? 'Sắp tới'),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit,
                          size: 18,
                          color: AppTheme.primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Text(l10n?.action_edit ?? 'Sửa'),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Row(
                      children: [
                        const Icon(
                          Icons.delete,
                          size: 18,
                          color: AppTheme.dangerColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          l10n?.action_delete ?? 'Xóa',
                          style: const TextStyle(color: AppTheme.dangerColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
