import 'package:flutter/material.dart';

class PriceFilterDialog extends StatefulWidget {
  final void Function(double minPrice, double maxPrice) onFilterApplied;

  const PriceFilterDialog({
    super.key,
    required this.onFilterApplied,
    this.min = 0,
    this.minAvailable = 0,
    this.max = 100,
    this.maxAvailable = 100,
  });

  final double min;
  final double minAvailable;
  final double max;
  final double maxAvailable;

  @override
  State<PriceFilterDialog> createState() => _PriceFilterDialogState();
}

class _PriceFilterDialogState extends State<PriceFilterDialog> {
  late var _minPrice = widget.min;
  late var _maxPrice = widget.max;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter by Price'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RangeSlider(
            values: RangeValues(_minPrice, _maxPrice),
            min: widget.minAvailable,
            max: widget.maxAvailable,
            divisions: (widget.maxAvailable - widget.minAvailable).ceil(),
            onChanged: (RangeValues values) {
              setState(() {
                _minPrice = values.start;
                _maxPrice = values.end;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${_minPrice.toStringAsFixed(2)}'),
              Text('\$${_maxPrice.toStringAsFixed(2)}'),
            ],
          ),
        ],
      ),
      actions: [
        if (_minPrice != widget.minAvailable || _maxPrice != widget.maxAvailable)
          TextButton(
            onPressed: () {
              setState(() {
                _minPrice = widget.minAvailable;
                _maxPrice = widget.maxAvailable;
              });
            },
            child: const Text('Clear'),
          ),
        TextButton(
          onPressed: () {
            widget.onFilterApplied(_minPrice, _maxPrice);
            Navigator.of(context).pop();
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
