import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class photo_picker extends StatelessWidget {
  const photo_picker({
    super.key, required this.onTap, this.selectedPhoto,
  });

  final VoidCallback onTap;
  final XFile? selectedPhoto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )
              ),
              child: Text('Photo'),
              alignment: Alignment.center,
            ),
            Expanded(
              child: Text(selectedPhoto==null ? "no selected photo": selectedPhoto!.name,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,

                ),maxLines: 1,),
            ),
           ],
        ),

      ),
    );
  }
}