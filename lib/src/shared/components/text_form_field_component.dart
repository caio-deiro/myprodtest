import 'package:flutter/material.dart';
import 'package:myprodtest/src/shared/constants/app_colors.dart';

class TextFormFieldComponent extends StatelessWidget {
  final void Function(String)? onChanged;
  const TextFormFieldComponent({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: TextFormField(
        onChanged: onChanged,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 1.0,
            ),
            prefixIcon: const Icon(Icons.search),
            iconColor: AppColors.warmGrey,
            hintText: 'Filter by name',
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.apply(color: AppColors.warmGrey),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.warmGrey),
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }
}
