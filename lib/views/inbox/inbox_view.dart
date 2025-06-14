import 'package:flutter/material.dart';
import 'package:garden_shop/widgets/index.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final messages = List.generate(8, (index) {
      return _MessageItem(
        sender: 'GardenBot',
        preview: 'Your order #GS${1000 + index} has been shipped 🌿',
        time: '2h ago',
        isUnread: index % 2 == 0,
      );
    });

    return Scaffold(
      appBar: const StandardAppBar(title: 'Inbox'),
      body:
          messages.isEmpty
              ? const _EmptyInbox()
              : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, index) => messages[index],
              ),
    );
  }
}

class _MessageItem extends StatelessWidget {
  final String sender;
  final String preview;
  final String time;
  final bool isUnread;

  const _MessageItem({
    required this.sender,
    required this.preview,
    required this.time,
    this.isUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
        child: Icon(Icons.notifications, color: theme.colorScheme.primary),
      ),
      title: Text(
        sender,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: isUnread ? FontWeight.bold : FontWeight.w500,
        ),
      ),
      subtitle: Text(
        preview,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: isUnread ? theme.colorScheme.primary : theme.hintColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(time, style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
      onTap: () {
        // handle navigation to detail
      },
    );
  }
}

class _EmptyInbox extends StatelessWidget {
  const _EmptyInbox();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.mark_email_unread, size: 64, color: theme.hintColor),
            const SizedBox(height: 20),
            Text(
              'No Messages Yet',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'You’ll receive updates here about your orders, promotions, and more.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
            ),
          ],
        ),
      ),
    );
  }
}
