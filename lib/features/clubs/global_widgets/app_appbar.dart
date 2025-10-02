import 'package:fitness/features/clubs/common/extension/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../generated/assets.dart';
import 'app_button.dart';
import 'app_icon_button.dart';
import 'app_image.dart';
import 'app_text.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.startTextAndIcon1,
    this.startTextAndIcon2,
    this.endTextAndIcon1,
    this.endTextAndIcon2,
    this.isBack = false,
    this.title,
    this.isLogo = false,
    this.colorLogo,
  });

  final TextAndIcon? startTextAndIcon1;
  final TextAndIcon? startTextAndIcon2;
  final TextAndIcon? endTextAndIcon1;
  final TextAndIcon? endTextAndIcon2;
  final String? title;
  final bool isBack;
  final bool isLogo;
  final Color? colorLogo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: context.colorScheme.background,
      flexibleSpace: _getTitle(title, isLogo, context),
      //Start
      leading: _getLeading(startTextAndIcon1, startTextAndIcon2, context),
      leadingWidth: 0.5.sw,
      //End
      actions: getActions(endTextAndIcon1, endTextAndIcon2, context),
      toolbarHeight: getHeight,
    );
  }

  Widget getIconButton(BuildContext context) {
    return AppIconButton.ghost(
      onPressed: () {
        context.pop();
      },
      iconPath: Assets.svgBack,
      colorSystem: ColorSystemIconButton.secondary,
    );
  }

  Widget? _getLeading(TextAndIcon? textAndIcon1, TextAndIcon? textAndIcon2,
      BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 8.w),
      alignment: AlignmentDirectional.centerStart,
      child: isBack
          ? getIconButton(context)
          : _getChildrenLeading(textAndIcon1, textAndIcon2, context),
    );
  }

  Widget? _getChildrenLeading(TextAndIcon? textAndIcon1,
      TextAndIcon? textAndIcon2, BuildContext context) {
    if (textAndIcon1 != null && textAndIcon2 != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _conditionsTextAndIcon(textAndIcon1, context),
          _conditionsTextAndIcon(textAndIcon2, context),
        ],
      );
    }
    if (textAndIcon1 != null) {
      return _conditionsTextAndIcon(textAndIcon1, context);
    }
    if (textAndIcon2 != null) {
      return _conditionsTextAndIcon(textAndIcon2, context);
    }
    return null;
  }

  Widget _conditionsTextAndIcon(
      TextAndIcon startTextAndIcon, BuildContext context) {
    if (startTextAndIcon.iconPath != null && startTextAndIcon.text != null) {
      return AppButton.textButton(
        onPressed: startTextAndIcon.onPressed,
        colorSystem: ColorSystemButton.secondary,
        prefixIcon: startTextAndIcon.iconPath,
        text: startTextAndIcon.text,
        size: ButtonSize.medium,
        isOriginalIconColor: startTextAndIcon.isOriginalIconColor,
      );
    }
    if (startTextAndIcon.iconPath != null) {
      return AppIconButton.ghost(
        onPressed: startTextAndIcon.onPressed,
        iconPath: startTextAndIcon.iconPath!,
        size: IconButtonSize.medium,
        isOriginalIconColor: startTextAndIcon.isOriginalIconColor,
        colorSystem: ColorSystemIconButton.secondary,
      );
    }
    if (startTextAndIcon.text != null) {
      return AppButton.textButton(
        onPressed: startTextAndIcon.onPressed,
        colorSystem: ColorSystemButton.secondary,
        text: startTextAndIcon.text,
        isOriginalIconColor: startTextAndIcon.isOriginalIconColor,
        size: ButtonSize.medium,
      );
    }
    return const SizedBox();
  }

  Widget _getTitle(String? title, bool isLogo, BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 0.25.sw),
        alignment: AlignmentDirectional.center,
        child: _getChildTitle(title, isLogo, context),
      ),
    );
  }

  Widget _getChildTitle(String? title, bool isLogo, BuildContext context) {
    if (isLogo) {
      return AppImage.asset(
        Assets.svgLogo,
        height: 24.h,
        color: colorLogo,
      );
    }
    if (title != null) {
      return AppText.titleMedium(
        title,
        maxLines: 1,
        color: context.colorScheme.onSurface,
      );
    }
    return const SizedBox();
  }

  List<Widget>? getActions(TextAndIcon? textAndIcon1, TextAndIcon? textAndIcon2,
      BuildContext context) {
    return [
      SizedBox.fromSize(
        size: Size.fromWidth(0.5.sw),
        child: Container(
          margin: EdgeInsetsDirectional.only(end: 8.w),
          alignment: AlignmentDirectional.centerEnd,
          child: _getChildrenLeading(textAndIcon1, textAndIcon2, context),
        ),
      ),
    ];
  }

  double get getHeight => kToolbarHeight.h;

  @override
  Size get preferredSize => Size.fromHeight(getHeight);
}

class TextAndIcon {
  final String? iconPath;
  final String? text;
  final bool isOriginalIconColor;
  final Function() onPressed;

  TextAndIcon(
      {this.iconPath,
      this.text,
      required this.onPressed,
      this.isOriginalIconColor = false});

  TextAndIcon copyWith({
    final String? iconPath,
    final String? text,
    final bool? isOriginalIconColor,
    final Function()? onPressed,
  }) =>
      TextAndIcon(
        iconPath: iconPath ?? this.iconPath,
        text: text ?? this.text,
        onPressed: onPressed ?? this.onPressed,
        isOriginalIconColor: isOriginalIconColor ?? this.isOriginalIconColor,
      );
}
