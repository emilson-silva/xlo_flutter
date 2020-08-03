import 'package:flutter/material.dart';

class HidePhoneWidget extends FormField<bool> {
  HidePhoneWidget()
      : super(
          builder: (state) {
            return Padding(
              padding: EdgeInsets.all(6),
              child: Row(),
            );
          },
        );
}
