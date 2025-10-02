import 'package:fitness/features/clubs/common/extension/app_extension.dart';
import 'package:fitness/features/clubs/common/themes/extension_color_scheme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colo_extension.dart';
import '../common/themes/typography.dart';
import 'app_text.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textCapitalization,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign,
    this.textAlignVertical,
    this.autofocus,
    this.readOnly,
    this.showCursor,
    this.obscuringCharacter,
    this.obscureText,
    this.autocorrect,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions,
    this.maxLengthEnforcement,
    this.minLines,
    this.expands,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.mouseCursor,
    this.contextMenuBuilder,
    this.magnifierConfiguration,
    this.dragStartBehavior,
    this.contentInsertionConfiguration,
    this.description,
    this.label,
    this.suffixIcon,
    this.title,
    this.name,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.border,
    this.fillColor,
    this.enabled = true,
    this.enableInteractiveSelection = true,
    this.filled = true,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,

    ///Custom Parameter
    this.hintText,
    this.hintStyle,
    this.hintMaxLines,
    this.hintTextDirection,
    this.alignLabelWithHint,
    this.margin,
    super.key,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.height,
    this.appKey,
    this.elevation = 2,
    this.isDense = false,
    this.constraints,
    this.onSubmitted,
  });

  final GlobalKey<FormBuilderFieldState>? appKey;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;

  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? constraints;
  final bool? autofocus;
  final bool? readOnly;
  final bool? showCursor;
  final String? obscuringCharacter;
  final bool? obscureText;
  final bool? autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int maxLines;

  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final ValueChanged<String?>? onChanged;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final MouseCursor? mouseCursor;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? border;

  final DragStartBehavior? dragStartBehavior;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final EdgeInsets? margin;
  final String? description;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? title;
  final double elevation;
  final String? name;
  final bool filled;
  final Color? fillColor;

  ///Custom Parameter
  ///when pass [decoration] this will be ignore [hintText,hintStyle,hintMaxLines,hintTextDirection,alignLabelWithHint]
  final String? hintText;
  final TextStyle? hintStyle;
  final int? hintMaxLines;
  final TextDirection? hintTextDirection;
  final bool? alignLabelWithHint;
  final bool? isDense;
  final double? height;
  final Function(String?)? onSubmitted;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();

  static InputDecoration inputDecoration({
    required BuildContext context,
    String? label,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool filled = true,
    Color? fillColor,
    String? hintText,
    TextStyle? hintStyle,
    int? hintMaxLines,
    TextDirection? hintTextDirection,
    bool? alignLabelWithHint,
    bool? isDense,
    double? height,
    BoxConstraints? constraints,
    BoxConstraints? prefixIconConstraints,
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
  }) {
    return InputDecoration(
      isDense: true,
      counter: const SizedBox.shrink(),
      counterStyle: const TextStyle(height: 0),
      label: label != null
          ? AppText.bodySmall(label, color: context.colorScheme.mediumEmphases)
          : null,
      hintText: hintText,
      hintStyle:
          hintStyle ??
          context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.lowEmphases,
          ),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      hintMaxLines: hintMaxLines,
      hintTextDirection: hintTextDirection,
      // contentPadding: REdgeInsets.symmetric(horizontal: 12),
      fillColor: fillColor ?? context.colorScheme.surface,
      focusColor: context.colorScheme.surface,
      alignLabelWithHint: alignLabelWithHint,
      suffixIcon: suffixIcon,
      suffixIconConstraints: BoxConstraints(minHeight: 48.h, minWidth: 40.w),
      constraints:
          constraints ?? BoxConstraints(minHeight: 48.h, minWidth: 40.w),
      prefixIconConstraints:
          prefixIconConstraints ??
          BoxConstraints(minHeight: 48.h, minWidth: 40.w),

      prefixIcon: prefixIcon,
      filled: filled,
      border:
          border ??
          OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colorScheme.outline,
              width: 1.r,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.colorScheme.outline, width: 1.r),
        borderRadius: BorderRadius.circular(12.r),
      ),
      enabledBorder:
          enabledBorder ??
          OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colorScheme.outline,
              width: 1.r,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
      focusedBorder:
          focusedBorder ??
          OutlineInputBorder(
            borderSide: BorderSide(color: TColor.white, width: 1.r),
            borderRadius: BorderRadius.circular(12.r),
          ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.colorScheme.error, width: 1.r),
        borderRadius: BorderRadius.circular(12.r),
      ),
      errorMaxLines: 1,
    ).applyDefaults(
      context.theme.inputDecorationTheme.copyWith(
        alignLabelWithHint: alignLabelWithHint,
      ),
    );
  }
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late FocusNode _focusNode;
  final ValueNotifier<bool> _hasErrorNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _hasErrorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final error = widget.validator?.call(widget.controller?.text);
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) widget.title!,
          ValueListenableBuilder<bool>(
            valueListenable: _hasErrorNotifier,
            builder: (BuildContext context, bool hasError, Widget? child) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: _focusNode.hasFocus && !hasError
                      ?  [
                          BoxShadow(
                            color: TColor.primaryColor1,
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(0, 0),
                          ),
                        ]
                      : null,
                ),
                child: FormBuilderTextField(
                  onSubmitted: widget.onSubmitted,
                  key: widget.appKey,
                  name: widget.name ?? widget.label ?? '',
                  controller: widget.controller,
                  initialValue: widget.initialValue,
                  focusNode: _focusNode,
                  decoration:
                      widget.decoration ??
                      AppTextFormField.inputDecoration(
                        context: context,
                        hintText: widget.hintText,
                        border: widget.border,
                        // height: height ?? 48.h,
                        enabledBorder: widget.enabledBorder,
                        hintMaxLines: widget.hintMaxLines,
                        alignLabelWithHint: widget.alignLabelWithHint,
                        constraints: widget.constraints,
                        fillColor: TColor.white,
                        filled: widget.filled,
                        focusedBorder: widget.focusedBorder,
                        hintStyle:
                            widget.hintStyle ??
                            getTextTheme.bodySmall!.copyWith(
                              color: context.colorScheme.lowestEmphases,
                            ),
                        hintTextDirection: widget.hintTextDirection,
                        isDense: widget.isDense,
                        label: widget.label,
                        prefixIcon: widget.prefixIcon != null
                            ? Padding(
                                padding: REdgeInsets.symmetric(horizontal: 12),
                                child: widget.prefixIcon,
                              )
                            : null,
                        prefixIconConstraints: widget.prefixIconConstraints,
                        suffixIcon: widget.suffixIcon != null
                            ? Padding(
                                padding: REdgeInsets.symmetric(horizontal: 12),
                                child: widget.suffixIcon,
                              )
                            : null,
                      ),
                  keyboardType: widget.keyboardType,
                  textCapitalization:
                      widget.textCapitalization ?? TextCapitalization.none,
                  textInputAction: widget.textInputAction,
                  style:
                      widget.style ??
                      context.textTheme.bodySmall?.copyWith(
                        color: TColor.black,
                      ),
                  strutStyle: widget.strutStyle,
                  textDirection: widget.textDirection,
                  textAlign: widget.textAlign ?? TextAlign.start,
                  textAlignVertical: widget.textAlignVertical,
                  autofocus: widget.autofocus ?? false,
                  readOnly: widget.readOnly ?? false,
                  showCursor: widget.showCursor,
                  obscuringCharacter: widget.obscuringCharacter ?? '•',
                  obscureText: widget.obscureText ?? false,
                  autocorrect: widget.autocorrect ?? true,
                  smartDashesType: widget.smartDashesType,
                  smartQuotesType: widget.smartQuotesType,
                  enableSuggestions: widget.enableSuggestions ?? true,
                  maxLengthEnforcement: widget.maxLengthEnforcement,
                  maxLines: widget.maxLines,
                  minLines: widget.minLines,
                  expands: widget.expands ?? false,
                  maxLength: widget.maxLength,
                  onChanged: widget.onChanged,
                  onTap: widget.onTap,
                  onTapOutside: widget.onTapOutside,
                  onEditingComplete: widget.onEditingComplete,
                  onSaved: widget.onSaved,
                  validator: (value) {
                    final error = widget.validator?.call(value);
                    _hasErrorNotifier.value = error != null;
                    return error;
                  },
                  inputFormatters: widget.inputFormatters,
                  enabled: widget.enabled,
                  cursorWidth: widget.cursorWidth ?? 2.0,
                  cursorHeight: widget.cursorHeight,
                  cursorRadius: widget.cursorRadius,
                  cursorColor: widget.cursorColor,
                  keyboardAppearance: widget.keyboardAppearance,
                  scrollPadding:
                      widget.scrollPadding ?? const EdgeInsets.all(20.0),
                  enableInteractiveSelection: widget.enableInteractiveSelection,
                  buildCounter: widget.buildCounter,
                  scrollPhysics: widget.scrollPhysics,
                  autofillHints: widget.autofillHints,
                  autovalidateMode: widget.autovalidateMode,
                  scrollController: widget.scrollController,
                  restorationId: widget.restorationId,
                  mouseCursor: widget.mouseCursor,
                  contextMenuBuilder: widget.contextMenuBuilder,
                  magnifierConfiguration: widget.magnifierConfiguration,
                  dragStartBehavior:
                      widget.dragStartBehavior ?? DragStartBehavior.start,
                  contentInsertionConfiguration:
                      widget.contentInsertionConfiguration,
                ),
              );
            },
          ),
          if (widget.description != null) ...{
            AppText.bodyMedium(
              widget.description!,
              color: context.colorScheme.onSurfaceVariant,
            ),
            16.verticalSpace,
          },
        ],
      ),
    );
  }
}
