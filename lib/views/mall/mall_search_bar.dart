import 'package:flutter/material.dart';

class MallSearchBar extends StatefulWidget {
  const MallSearchBar({super.key, required this.onChanged, required this.onFilterPressed});

  final Function(String) onChanged;
  final VoidCallback onFilterPressed;

  @override
  State<MallSearchBar> createState() => _MallSearchBarState();
}

class _MallSearchBarState extends State<MallSearchBar> {
  final focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    focusNode.dispose();
    _searchController.dispose();
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
              onChanged: widget.onChanged,
              decoration: const InputDecoration(
                hintText: 'Search Plants',
                border: InputBorder.none,
                isDense: true,
              ),
              onTapOutside: (event) => focusNode.unfocus(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.grey),
            onPressed: widget.onFilterPressed,
          ),
        ],
      ),
    );
  }
}
