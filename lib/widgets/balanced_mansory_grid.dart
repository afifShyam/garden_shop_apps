import 'package:flutter/material.dart';

class BalancedMasonryGrid extends StatefulWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;

  const BalancedMasonryGrid({
    super.key,
    required this.children,
    this.spacing = 0,
    this.runSpacing = 0,
  });

  @override
  State<BalancedMasonryGrid> createState() => _BalancedMasonryGridState();
}

class _BalancedMasonryGridState extends State<BalancedMasonryGrid> {
  final leftLastKey = GlobalKey();
  final rightLastKey = GlobalKey();

  double leftLastHeight = 0;
  double rightLastHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _calculateHeights());
  }

  void _calculateHeights() {
    final leftBox = leftLastKey.currentContext?.findRenderObject() as RenderBox?;
    final rightBox = rightLastKey.currentContext?.findRenderObject() as RenderBox?;

    if (leftBox != null && rightBox != null) {
      setState(() {
        leftLastHeight = leftBox.size.height;
        rightLastHeight = rightBox.size.height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final int half = (widget.children.length / 2).ceil();
    final List<Widget> leftOriginal = widget.children.sublist(0, half);
    final List<Widget> rightOriginal = widget.children.sublist(half);

    final List<Widget> leftColumn = List<Widget>.from(leftOriginal);
    final List<Widget> rightColumn = List<Widget>.from(rightOriginal);

    final double heightDiff = (leftLastHeight - rightLastHeight).abs();

    // Wrap the final items with keys and padding
    if (leftLastHeight < rightLastHeight && leftColumn.isNotEmpty) {
      leftColumn[leftColumn.length - 1] = Column(
        key: leftLastKey,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [leftColumn.last, SizedBox(height: heightDiff)],
      );
    } else if (rightLastHeight < leftLastHeight && rightColumn.isNotEmpty) {
      rightColumn[rightColumn.length - 1] = Column(
        key: rightLastKey,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [rightColumn.last, SizedBox(height: heightDiff)],
      );
    } else {
      // No padding needed, just apply key for initial measurement
      if (leftColumn.isNotEmpty) {
        leftColumn[leftColumn.length - 1] = Container(key: leftLastKey, child: leftColumn.last);
      }
      if (rightColumn.isNotEmpty) {
        rightColumn[rightColumn.length - 1] = Container(key: rightLastKey, child: rightColumn.last);
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _withSpacing(leftColumn),
          ),
        ),
        SizedBox(width: widget.spacing),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _withSpacing(rightColumn),
          ),
        ),
      ],
    );
  }

  List<Widget> _withSpacing(List<Widget> items) {
    return List.generate(items.length, (i) {
      return Padding(
        padding: EdgeInsets.only(bottom: i == items.length - 1 ? 0 : widget.runSpacing),
        child: items[i],
      );
    });
  }
}
