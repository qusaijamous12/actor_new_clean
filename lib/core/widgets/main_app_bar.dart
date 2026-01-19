import 'package:flutter/material.dart';

import '../constant/app_color.dart';
import '../constant/app_padding.dart';
import '../constant/app_styles.dart';
import 'custom_text.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 150,
      backgroundColor: AppColor.kPrimary,
      centerTitle: true,
      title: Column(
        spacing: AppPadding.kPadding/2,
        children: [
          CustomText(title: title,fontSize: AppFontSize.fs20,),
        const  TextField(
            cursorColor: AppColor.kPrimary,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              label: CustomText(title: 'Search',fontColor: Colors.black,),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppPadding.kPadding/2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppPadding.kPadding/2)),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
