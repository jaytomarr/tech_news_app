import 'package:flutter/material.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
  const appBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgColor,
      elevation: 2,
      shadowColor: AppColors.white,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boldText(text: 'Tech', size: 20, color: AppColors.primary),
            SizedBox(width: 1),
            modifiedText(text: 'News', size: 20, color: AppColors.lightblack),
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
