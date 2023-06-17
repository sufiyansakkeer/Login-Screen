import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
    required TextEditingController dateController,
  }) : _dateController = dateController;

  final TextEditingController _dateController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "Date of Birth",
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
          suffixIcon: const Icon(
            Icons.calendar_month_outlined,
            color: Colors.black,
          )),
      keyboardType: TextInputType.none,
      onTap: () async {
        final selectedTempDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now().subtract(
            const Duration(
              days: 6570,
            ),
          ),
          firstDate: DateTime.now().subtract(
            const Duration(
              days: 30000,
            ),
          ),
          lastDate: DateTime.now(),
          helpText: 'select a Date',
        );

        _dateController.text = RegistrationServices.parseDateTime(
              selectedTempDate!,
            ) ??
            "";
      },
    );
  }
}
