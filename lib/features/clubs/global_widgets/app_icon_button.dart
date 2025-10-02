import 'package:fitness/features/clubs/common/extension/app_extension.dart';
import 'package:fitness/features/clubs/common/themes/extension_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colo_extension.dart';
import '../common/constant/constant_variables.dart';
import 'app_image.dart';
import 'app_progress_indicator.dart';

enum StyleIconButton { fillButton, tonalButton, outlineButton, ghost }

enum IconButtonType { enabled, disabled }

enum ColorSystemIconButton { primary, secondary }

enum IconButtonSize {
  ///56
  xlarge,

  ///48
  large,

  ///40
  medium,

  ///32
  small,
}

class AppIconButton extends StatefulWidget {
  const AppIconButton.fillButton({
    super.key,
    this.isNetwork = false,
    this.states = IconButtonType.enabled,
    this.size = IconButtonSize.medium,
    this.isLoading = false,
    this.isOriginalIconColor = false,
    required this.onPressed,
    required this.iconPath,
    this.margin = EdgeInsets.zero,
    this.colorSystem = ColorSystemIconButton.primary,
  }) : _styleButton = StyleIconButton.fillButton;

  const AppIconButton.tonalButton({
    super.key,
    this.isNetwork = false,
    this.states = IconButtonType.enabled,
    this.size = IconButtonSize.medium,
    this.isLoading = false,
    this.isOriginalIconColor = false,
    required this.onPressed,
    required this.iconPath,
    this.margin = EdgeInsets.zero,
    this.colorSystem = ColorSystemIconButton.primary,
  }) : _styleButton = StyleIconButton.tonalButton;

  const AppIconButton.outlineButton({
    super.key,
    this.isNetwork = false,
    this.states = IconButtonType.enabled,
    this.size = IconButtonSize.medium,
    this.isLoading = false,
    this.isOriginalIconColor = false,
    required this.onPressed,
    required this.iconPath,
    this.margin = EdgeInsets.zero,
    this.colorSystem = ColorSystemIconButton.primary,
  }) : _styleButton = StyleIconButton.outlineButton;

  const AppIconButton.ghost({
    super.key,
    this.isNetwork = false,
    this.states = IconButtonType.enabled,
    this.size = IconButtonSize.medium,
    this.isLoading = false,
    this.isOriginalIconColor = false,
    required this.onPressed,
    required this.iconPath,
    this.margin = EdgeInsets.zero,
    this.colorSystem = ColorSystemIconButton.primary,
  }) : _styleButton = StyleIconButton.ghost;

  final IconButtonType states;
  final IconButtonSize size;
  final bool isLoading;
  final EdgeInsetsGeometry margin;
  final bool isOriginalIconColor;

  final VoidCallback onPressed;
  final StyleIconButton _styleButton;
  final bool isNetwork;
  final String iconPath;
  final ColorSystemIconButton colorSystem;

  @override
  State<AppIconButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppIconButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: IconButton(
        onPressed: _getOnPressed(widget),
        style: _getButtonStyle(widget, context),
        icon: getIcon(widget, context),
      ),
    );
  }
}

Function()? _getOnPressed(AppIconButton widget) {
  if (widget.isLoading || widget.states == IconButtonType.disabled) return null;
  return widget.onPressed;
}

ButtonStyle _getButtonStyle(AppIconButton widget, BuildContext context) {
  //region backgroundColor
  WidgetStateProperty<Color?>? backgroundDisabled() {
    return WidgetStateProperty.all(TColor.primaryColor1);
  }

  WidgetStateProperty<Color?>? backgroundColorFillButton() {
    switch (widget.colorSystem) {
      case ColorSystemIconButton.primary:
        {
          if (widget.isLoading) {
            return WidgetStateProperty.all(TColor.primaryColor1);
          }
          if (widget.states == IconButtonType.disabled) {
            return backgroundDisabled();
          }
          return WidgetStateProperty.all(TColor.primaryColor1);
        }
      case ColorSystemIconButton.secondary:
        if (widget.isLoading) {
          return WidgetStateProperty.all(TColor.primaryColor1);
        }
        if (widget.states == IconButtonType.disabled) {
          return backgroundDisabled();
        }
        return WidgetStateProperty.all(TColor.primaryColor1);
    }
  }

  WidgetStateProperty<Color?>? backgroundColorTonalButton() {
    switch (widget.colorSystem) {
      case ColorSystemIconButton.primary:
        {
          if (widget.states == IconButtonType.disabled) {
            return backgroundDisabled();
          }
          return WidgetStateProperty.all(context.colorScheme.primaryContainer);
        }
      case ColorSystemIconButton.secondary:
        {
          if (widget.states == IconButtonType.disabled) {
            return backgroundDisabled();
          }
          return WidgetStateProperty.all(
            context.colorScheme.surfaceContainerLow,
          );
        }
    }
  }

  WidgetStateProperty<Color?>? backgroundColorOutlineButton() {
    return WidgetStateProperty.all(Colors.transparent);
  }

  WidgetStateProperty<Color?>? backgroundColorGhostButton() {
    return WidgetStateProperty.all(Colors.transparent);
  }
  //endregion

  //region shape
  WidgetStateProperty<OutlinedBorder?>? shape() {
    return WidgetStateProperty.all(const CircleBorder());
  }
  //endregion

  //region overlayColor
  WidgetStateProperty<Color?>? overlayColorFillButton() {
    switch (widget.colorSystem) {
      case ColorSystemIconButton.primary:
        {
          return WidgetStateProperty.all(
            context.colorScheme.primaryFilledBgOnPress,
          );
        }
      case ColorSystemIconButton.secondary:
        {
          return WidgetStateProperty.all(context.colorScheme.onSurface);
        }
    }
  }

  WidgetStateProperty<Color?>? overlayColorTonalButton() {
    switch (widget.colorSystem) {
      case ColorSystemIconButton.primary:
        {
          return WidgetStateProperty.all(
            context.colorScheme.primaryTonalBgOnPress,
          );
        }
      case ColorSystemIconButton.secondary:
        {
          return WidgetStateProperty.all(
            context.colorScheme.surfaceContainerHigh,
          );
        }
    }
  }

  WidgetStateProperty<Color?>? overlayColorOutlineButton() {
    switch (widget.colorSystem) {
      case ColorSystemIconButton.primary:
        return WidgetStateProperty.all(
          context.colorScheme.primaryTextBgOnPress,
        );
      case ColorSystemIconButton.secondary:
        return WidgetStateProperty.all(context.colorScheme.surface);
    }
  }

  WidgetStateProperty<Color?>? overlayColorGhostButton() {
    switch (widget.colorSystem) {
      case ColorSystemIconButton.primary:
        return WidgetStateProperty.all(
          context.colorScheme.primaryOutlinedBgOnPress,
        );
      case ColorSystemIconButton.secondary:
        return WidgetStateProperty.all(context.colorScheme.surface);
    }
  }
  //endregion

  //region shadowColor ignore when Elevation = 0
  WidgetStateProperty<Color?>? shadowColorFillButton() {
    return WidgetStateProperty.all(Colors.transparent);
  }

  WidgetStateProperty<Color?>? shadowColorTonalButton() {
    return null;
  }

  WidgetStateProperty<Color?>? shadowColorOutlineButton() {
    return null;
  }

  WidgetStateProperty<Color?>? shadowColorGhostButton() {
    return null;
  }
  //endregion

  //region side
  WidgetStateProperty<BorderSide?>? side() {
    if (widget._styleButton == StyleIconButton.outlineButton) {
      return WidgetStateProperty.all(
        BorderSide(
          color: context.colorScheme.outline,
          width: 1.w,
          style: BorderStyle.solid,
        ),
      );
    }
    return WidgetStateProperty.all(BorderSide.none);
  }
  //endregion

  //region surfaceTintColor ignore when Elevation = 0
  WidgetStateProperty<Color?>? surfaceTintColorFillButton() {
    return WidgetStateProperty.all(Colors.transparent);
  }

  WidgetStateProperty<Color?>? surfaceTintColorTonalButton() {
    return null;
  }

  WidgetStateProperty<Color?>? surfaceTintColorOutlineButton() {
    return null;
  }

  WidgetStateProperty<Color?>? surfaceTintColorGhostButton() {
    return null;
  }
  //endregion

  WidgetStateProperty<Size?>? sizeButton() {
    switch (widget.size) {
      case IconButtonSize.xlarge:
        return WidgetStateProperty.all(Size.square(56.w));
      case IconButtonSize.large:
        return WidgetStateProperty.all(Size.square(48.w));
      case IconButtonSize.medium:
        return WidgetStateProperty.all(Size.square(40.w));
      case IconButtonSize.small:
        return WidgetStateProperty.all(Size.square(32.w));
    }
  }

  switch (widget._styleButton) {
    case StyleIconButton.fillButton:
      return ButtonStyle(
        backgroundColor: backgroundColorFillButton(),
        shape: shape(),
        overlayColor: overlayColorFillButton(),
        shadowColor: shadowColorFillButton(),
        side: side(),
        surfaceTintColor: surfaceTintColorFillButton(),
        elevation: WidgetStateProperty.all<double>(0.0),
        fixedSize: sizeButton(),
      );
    case StyleIconButton.tonalButton:
      return ButtonStyle(
        backgroundColor: backgroundColorTonalButton(),
        shape: shape(),
        overlayColor: overlayColorTonalButton(),
        shadowColor: shadowColorTonalButton(),
        side: side(),
        surfaceTintColor: surfaceTintColorTonalButton(),
        elevation: WidgetStateProperty.all<double>(0.0),
        fixedSize: sizeButton(),
      );

    case StyleIconButton.outlineButton:
      return ButtonStyle(
        backgroundColor: backgroundColorOutlineButton(),
        shape: shape(),
        overlayColor: overlayColorOutlineButton(),
        shadowColor: shadowColorOutlineButton(),
        side: side(),
        surfaceTintColor: surfaceTintColorOutlineButton(),
        elevation: WidgetStateProperty.all<double>(0.0),
        fixedSize: sizeButton(),
      );
    case StyleIconButton.ghost:
      return ButtonStyle(
        backgroundColor: backgroundColorGhostButton(),
        shape: shape(),
        overlayColor: overlayColorGhostButton(),
        shadowColor: shadowColorGhostButton(),
        side: side(),
        surfaceTintColor: surfaceTintColorGhostButton(),
        elevation: WidgetStateProperty.all<double>(0.0),
        fixedSize: sizeButton(),
      );
  }
}

Widget getIcon(AppIconButton widget, BuildContext context) {
  Size getSizeIcon() {
    switch (widget.size) {
      case IconButtonSize.xlarge:
        return Size.square(ConstantVariables.size_3.r);
      case IconButtonSize.large:
        return Size.square(ConstantVariables.size_3.r);
      case IconButtonSize.medium:
        return Size.square(ConstantVariables.size_3.r);
      case IconButtonSize.small:
        return Size.square(ConstantVariables.size_2_5.r);
    }
  }

  Color getColorDisableIcon() {
    return context.colorScheme.lowestEmphases;
  }

  Color getColorIcon() {
    switch (widget._styleButton) {
      case StyleIconButton.fillButton:
        {
          switch (widget.colorSystem) {
            case ColorSystemIconButton.primary:
              {
                if (widget.isLoading) {
                  return context.colorScheme.primaryFilledTextColor.withOpacity(
                    0.56,
                  );
                }
                if (widget.states == IconButtonType.disabled) {
                  return getColorDisableIcon();
                }
                return context.colorScheme.primaryFilledTextColor;
              }
            case ColorSystemIconButton.secondary:
              {
                if (widget.isLoading) {
                  return context.colorScheme.onInverseSurface.withOpacity(0.56);
                }
                if (widget.states == IconButtonType.disabled) {
                  return getColorDisableIcon();
                }
                return context.colorScheme.onInverseSurface;
              }
          }
        }
      case StyleIconButton.tonalButton:
        {
          switch (widget.colorSystem) {
            case ColorSystemIconButton.primary:
              {
                if (widget.isLoading) {
                  return context.colorScheme.onPrimaryContainer.withOpacity(
                    0.56,
                  );
                }
                if (widget.states == IconButtonType.disabled) {
                  return getColorDisableIcon();
                }
                return context.colorScheme.onPrimaryContainer;
              }
            case ColorSystemIconButton.secondary:
              {
                if (widget.isLoading) {
                  return context.colorScheme.onSurface.withOpacity(0.56);
                }
                if (widget.states == IconButtonType.disabled) {
                  return getColorDisableIcon();
                }
                return context.colorScheme.onSurface;
              }
          }
        }
      case StyleIconButton.outlineButton:
        {
          switch (widget.colorSystem) {
            case ColorSystemIconButton.primary:
              {
                if (widget.isLoading) {
                  return context.colorScheme.primaryTextTextColor.withOpacity(
                    0.56,
                  );
                }
                if (widget.states == IconButtonType.disabled) {
                  return getColorDisableIcon();
                }
                return context.colorScheme.primaryTextTextColor;
              }
            case ColorSystemIconButton.secondary:
              {
                if (widget.isLoading) {
                  return context.colorScheme.onSurface.withOpacity(0.56);
                }
                if (widget.states == IconButtonType.disabled) {
                  return getColorDisableIcon();
                }
                return context.colorScheme.onSurface;
              }
          }
        }
      case StyleIconButton.ghost:
        {
          switch (widget.colorSystem) {
            case ColorSystemIconButton.primary:
              {
                if (widget.isLoading) {
                  return context.colorScheme.primaryOutlinedTextColor
                      .withOpacity(0.56);
                }
                if (widget.states == IconButtonType.disabled) {
                  return getColorDisableIcon();
                }
                return context.colorScheme.primaryOutlinedTextColor;
              }
            case ColorSystemIconButton.secondary:
              {
                if (widget.isLoading) {
                  return context.colorScheme.mediumEmphases.withOpacity(0.56);
                }
                if (widget.states == IconButtonType.disabled) {
                  return getColorDisableIcon();
                }
                return context.colorScheme.mediumEmphases;
              }
          }
        }
    }
  }

  if (widget.isLoading) {
    return _getCircularProgress(
      widget,
      AppProgressIndicator(color: _getColorCircularProgress(widget, context)),
    );
  }
  if (widget.isNetwork) {
    return AppImage.network(
      widget.iconPath,
      alignment: Alignment.center,
      fit: BoxFit.fill,
      height: getSizeIcon().height,
      width: getSizeIcon().width,
      color: widget.isOriginalIconColor == false ? getColorIcon() : null,
    );
  } else {
    return AppImage.asset(
      widget.iconPath,
      alignment: Alignment.center,
      fit: BoxFit.fill,
      height: getSizeIcon().height,
      width: getSizeIcon().width,
      color: widget.isOriginalIconColor == false ? getColorIcon() : null,
    );
  }
}

Widget _getCircularProgress(AppIconButton widget, Widget circularProgress) {
  switch (widget.size) {
    case IconButtonSize.xlarge:
      return SizedBox(
        height: ConstantVariables.size_2_5.r,
        width: ConstantVariables.size_2_5.r,
        child: circularProgress,
      );
    case IconButtonSize.large:
      return SizedBox(
        height: ConstantVariables.size_2_5.r,
        width: ConstantVariables.size_2_5.r,
        child: circularProgress,
      );
    case IconButtonSize.medium:
      return SizedBox(
        height: ConstantVariables.size_2_5.r,
        width: ConstantVariables.size_2_5.r,
        child: circularProgress,
      );
    case IconButtonSize.small:
      return SizedBox(
        height: ConstantVariables.size_2.r,
        width: ConstantVariables.size_2.r,
        child: circularProgress,
      );
  }
}

Color _getColorCircularProgress(AppIconButton widget, BuildContext context) {
  switch (widget._styleButton) {
    case StyleIconButton.fillButton:
      {
        switch (widget.colorSystem) {
          case ColorSystemIconButton.primary:
            {
              return context.colorScheme.primaryFilledTextColor.withOpacity(
                0.56,
              );
            }
          case ColorSystemIconButton.secondary:
            {
              return context.colorScheme.onInverseSurface.withOpacity(0.56);
            }
        }
      }
    case StyleIconButton.tonalButton:
      {
        switch (widget.colorSystem) {
          case ColorSystemIconButton.primary:
            {
              return context.colorScheme.onPrimaryContainer.withOpacity(0.56);
            }
          case ColorSystemIconButton.secondary:
            {
              return context.colorScheme.onSurface.withOpacity(0.56);
            }
        }
      }
    case StyleIconButton.outlineButton:
      {
        switch (widget.colorSystem) {
          case ColorSystemIconButton.primary:
            {
              return context.colorScheme.primaryTextTextColor.withOpacity(0.56);
            }
          case ColorSystemIconButton.secondary:
            {
              return context.colorScheme.onSurface.withOpacity(0.56);
            }
        }
      }
    case StyleIconButton.ghost:
      {
        switch (widget.colorSystem) {
          case ColorSystemIconButton.primary:
            {
              return context.colorScheme.primaryOutlinedTextColor.withOpacity(
                0.56,
              );
            }
          case ColorSystemIconButton.secondary:
            {
              return context.colorScheme.mediumEmphases.withOpacity(0.56);
            }
        }
      }
  }
}
