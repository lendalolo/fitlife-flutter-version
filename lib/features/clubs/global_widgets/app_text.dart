import 'package:fitness/features/clubs/common/extension/app_extension.dart';
import 'package:flutter/material.dart';


import '../common/themes/typography.dart';

class IconAndText{

}
class AppText extends StatelessWidget {
  AppText(
    this.text, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    final TextStyle? style,
    this.color,
    this.velocity,
    this.figmaLineHeight,
    
  })  : style = (style ?? const TextStyle()).copyWith(color: color);


  final String text;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final Color? selectionColor;
  final TextStyle? style;
  final Color? color;
  final double? velocity;

  final double? figmaLineHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
            text,
            style: style?.copyWith(
                color: color??context.colorScheme.onSurface,
                height: (figmaLineHeight != null && style?.fontSize != null)
                    ? figmaLineHeight?.fromFigmaHeight(style!.fontSize!)
                    : null),
            key: key,
            locale: locale,
            maxLines: maxLines,
            overflow: overflow,
            semanticsLabel: semanticsLabel,
            softWrap: softWrap,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            textScaleFactor: textScaleFactor,
          );
  }

  AppText.displayLarge(
    this.text, {
    
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    this.figmaLineHeight,
    final TextStyle? style,
    final FontWeight? fontWeight,
    super.key,
  }) : style =
  getTextTheme.displayLarge?.merge(style).copyWith(fontWeight: fontWeight);


  AppText.displayMedium(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.displayMedium?.merge(style).copyWith(fontWeight: fontWeight);


  AppText.displaySmall(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.displaySmall?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.headlineLarge(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.headlineLarge?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.headlineMedium(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.headlineMedium?.merge(style).copyWith(fontWeight: fontWeight);


  AppText.headlineSmall(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.headlineSmall?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.titleLarge(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.titleLarge?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.titleMedium(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.titleMedium?.merge(style).copyWith(fontWeight: fontWeight);


  AppText.titleSmall(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.titleSmall?.merge(style).copyWith(fontWeight: fontWeight);


  AppText.bodyLarge(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.bodyLarge?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.bodyMedium(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.bodyMedium?.merge(style).copyWith(fontWeight: fontWeight);


  AppText.bodySmall(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.bodySmall?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.bodyXSmall(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.bodyXSmall?.merge(style).copyWith(fontWeight: fontWeight);


  AppText.labelLarge(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.labelLarge?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.labelMedium(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.labelMedium?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.labelSmall(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.labelSmall?.merge(style).copyWith(fontWeight: fontWeight);


  AppText.buttonLarge(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.buttonLarge?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.buttonSmall(
      this.text, {
        
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.selectionColor,
        this.color,
        this.velocity,
        this.figmaLineHeight,
        final TextStyle? style,
        final FontWeight? fontWeight,
        super.key,
      }) : style =
  getTextTheme.buttonSmall?.merge(style).copyWith(fontWeight: fontWeight);


  copyWith({Color? color}) => AppText(
        text,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        selectionColor: selectionColor,
        style: style,
        color: color ?? this.color,
        velocity: velocity,
        figmaLineHeight: figmaLineHeight,
      );
}