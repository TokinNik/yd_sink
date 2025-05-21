import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:YDsync/core/ui/generated/assets.gen.dart';
import 'package:YDsync/core/ui/themes/text_styles.dart';
import 'package:YDsync/core/ui/uikit/g_ripple.dart';
import 'package:YDsync/core/ui/uikit/g_text.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

class GInput extends StatefulWidget {
  const GInput({
    super.key,
    this.errorText,
    this.title,
    this.placeholder,
    this.icon,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final String? title;
  final String? placeholder;
  final String? errorText;
  final Widget? icon;
  final bool isPassword;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<GInput> createState() => _GInputState();
}

class _GInputState extends State<GInput> {
  bool hide = true;
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    myFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          GText(
            title: widget.title!,
            style: AppTextStyles.textStyle(14, FontWeight.w500),
            color: widget.errorText == null ? context.colors.contentSecondary : context.colors.contentNegative,
          ),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          focusNode: myFocusNode,
          obscureText: widget.isPassword && hide,
          enableSuggestions: false,
          autocorrect: false,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          style: AppTextStyles.textStyle(16, FontWeight.w400),
          decoration: InputDecoration(
            error: null,
            errorText: null,
            errorStyle: const TextStyle(height: 0.01, fontSize: 0),
            suffixIcon: _suffixIcon(),
            suffixIconConstraints: const BoxConstraints(minHeight: 16, minWidth: 16),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintText: widget.placeholder,
            hintStyle: AppTextStyles.textStyle(16, FontWeight.w400),
            enabledBorder: const OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(color: context.colors.contentAccentPrimary, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(color: context.colors.contentNegative, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            errorBorder: OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(color: context.colors.contentNegative, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            filled: true,
            fillColor: myFocusNode.hasFocus ? context.colors.backgroundPrimary : context.colors.backgroundSecondary,
          ),
        ),
        if (widget.controller != null && widget.validator != null)
          ValueListenableBuilder(
            valueListenable: widget.controller!,
            builder: (context, state, _) {
              final errorText = widget.validator!(null) ?? "";

              if (errorText == "") return const SizedBox();

              return Padding(
                padding: const EdgeInsets.only(top: 4),
                child: GText(title: errorText, style: AppTextStyles.s14regular, color: context.colors.contentNegative),
              );
            },
          ),
      ],
    );
  }

  Widget? _suffixIcon() {
    return widget.icon ??
        (widget.isPassword
            ? GRipple(
              borderRadius: BorderRadius.circular(100),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12, right: 12),
                child: SvgPicture.asset(hide ? Assets.icons.eyeOff : Assets.icons.eye, fit: BoxFit.contain),
              ),
              onPress: () {
                setState(() {
                  hide = !hide;
                });
              },
            )
            : null);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}
