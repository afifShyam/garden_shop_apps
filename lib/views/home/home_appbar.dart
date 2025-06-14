import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 220,
      color: colorScheme.primary,
      padding: const EdgeInsets.fromLTRB(16, 45, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'LOGO',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimary,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: colorScheme.onPrimary.withValues(alpha: 0.5),
                  thickness: 1,
                  endIndent: 8,
                ),
              ),
              Text(
                'NEXT APPOINTMENT',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1,
                  color: colorScheme.onPrimary.withValues(alpha: 0.7),
                ),
              ),
              Expanded(
                child: Divider(
                  color: colorScheme.onPrimary.withValues(alpha: 0.5),
                  thickness: 1,
                  indent: 8,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _iconText(context, Icons.calendar_today, '14 Oct 2020'),
              const SizedBox(width: 12),
              _iconText(context, Icons.access_time, '12:30 PM'),
              const SizedBox(width: 12),
              Expanded(child: _iconText(context, Icons.location_on, '123 Plant Street, 1/1...')),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: colorScheme.onPrimary.withValues(alpha: 0.7),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                StatItem(title: 'CREDIT', value: 'RM100.00'),
                VerticalDivider(width: 1),
                StatItem(title: 'POINTS', value: '10'),
                VerticalDivider(width: 1),
                StatItem(title: 'PACKAGE', value: '1'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _iconText(BuildContext context, IconData icon, String text) {
    final color = Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.7);
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final String title;
  final String value;
  const StatItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6);
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 12, color: textColor)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
