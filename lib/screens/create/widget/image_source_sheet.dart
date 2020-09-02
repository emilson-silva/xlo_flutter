import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  final picker = ImagePicker();

  ImageSourceSheet(this.onImageSelected);
  final Function(File) onImageSelected;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              child: Text('Camera'),
              onPressed: () async {
                final PickedFile image =
                    await picker.getImage(source: ImageSource.camera);
                final File finalImage = File(image.path);
                onImageSelected(finalImage);
              },
            ),
            FlatButton(
              child: Text('Galeria'),
              onPressed: () async {
                final PickedFile image =
                    await picker.getImage(source: ImageSource.gallery);
                final File finalImage = File(image.path);

                onImageSelected(finalImage);
              },
            ),
          ],
        );
      },
    );
  }
}
