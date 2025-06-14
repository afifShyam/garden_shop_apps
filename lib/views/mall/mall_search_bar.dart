import 'package:flutter/material.dart';

class MallSearchBar extends StatefulWidget {
  const MallSearchBar({super.key});

  @override
  State<MallSearchBar> createState() => _MallSearchBarState();
}

class _MallSearchBarState extends State<MallSearchBar> {
  final focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {});
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              focusNode: focusNode,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Salon',
                border: InputBorder.none,
                isDense: true,
              ),
              onTapOutside: (event) => focusNode.unfocus(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.grey),
            onPressed: () {
              // TODO: handle filter tap
            },
          ),
        ],
      ),
    );
  }
}
