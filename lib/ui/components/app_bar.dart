import 'package:flutter/material.dart' as material;
import 'package:vigorus/file_exporter.dart';

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBar({
    Key? key,
    this.toolbarHeight,
    this.actions,
    this.elevation,
    this.leading,
    this.leadingWidth,
    this.implyLeading = true,
    this.centerTitle = true,
    this.bottom,
    this.bottomOpacity = 1.0,
    this.actionsIconTheme,
    this.flexibleSpace,
    this.foregroundColor,
    this.iconTheme,
    this.primary = true,
    this.shape,
    this.title,
    this.titleFontSize,
    this.titleFontWeight,
    this.titleColor,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.toolbarTextStyle,
    this.systemOverlayStyle,
    this.excludeHeaderSemantics = true,
  }) : super(key: key);
  final double? toolbarHeight;
  final List<Widget>? actions;
  final double? elevation;
  final Widget? leading;
  final double? leadingWidth;
  final bool implyLeading;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final double bottomOpacity;
  final IconThemeData? actionsIconTheme;
  final Widget? flexibleSpace;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final bool primary;
  final ShapeBorder? shape;
  final String? title;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final Color? titleColor;
  final double? titleSpacing;
  final double toolbarOpacity;
  final TextStyle? toolbarTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool excludeHeaderSemantics;

  @override
  Widget build(BuildContext context) {
    return material.AppBar(
      actions: actions,
      actionsIconTheme: actionsIconTheme,
      elevation: elevation ?? 0.0,
      leading: leading ?? (implyLeading == true ? const _LeadingIcon() : null),
      leadingWidth: leadingWidth,
      automaticallyImplyLeading: false,
      backgroundColor: context.colorScheme.appbarBg,
      centerTitle: centerTitle,
      bottom: bottom,
      bottomOpacity: bottomOpacity,
      flexibleSpace: flexibleSpace,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme ??
          IconThemeData(
            color: context.colorScheme.appbarIcons,
          ),
      primary: primary,
      shape: shape,
      title: title != null
          ? AppText(
              text: title!,
              color: titleColor ?? context.colorScheme.appbarTitle,
              fontSize: titleFontSize,
              fontWeight: titleFontWeight,
            )
          : null,
      titleSpacing: titleSpacing ?? (Navigator.canPop(context) ? 5 : 15).wWise,
      toolbarOpacity: toolbarOpacity,
      toolbarHeight: toolbarHeight,
      toolbarTextStyle: toolbarTextStyle,
      systemOverlayStyle: systemOverlayStyle,
      excludeHeaderSemantics: excludeHeaderSemantics,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}

class _LeadingIcon extends StatelessWidget {
  const _LeadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.hWise,
        vertical: 5.hWise,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.appText),
          borderRadius: BorderRadius.circular(
            5.hWise,
          )),
      child: Icon(
        Icons.arrow_back,
        color: context.colorScheme.appText,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final Function() onPressedBack;
  final String? title;

  const CustomAppBar({Key? key, required this.onPressedBack, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: AppText(
              text: title ?? "",
              fontSize: 22.wWise,
              fontWeight: FontWeight.w600,
              color: context.colorScheme.appText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: onPressedBack,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 7.wWise,
                  vertical: 5.hWise,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: context.colorScheme.appText,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomAppBar2 extends StatelessWidget {
  final Function() onPressedBack;
  final String? title;
  final String? step;

  const CustomAppBar2(
      {Key? key, required this.onPressedBack, this.title, this.step})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onPressedBack,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 7.wWise,
                  vertical: 5.hWise,
                ),
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: 30.hWise,
                  color: context.colorScheme.appText,
                ),
              ),
            ),
            20.wGap,
            Expanded(
              child: AppText(
                text: title ?? "",
                fontSize: 20.wWise,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
                color: context.colorScheme.appText,
              ),
            ),
            if (step != null) ...[
              AppText(
                text: step ?? "",
                fontSize: 12.wWise,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w900,
                color: context.colorScheme.appGrey,
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class CustomAppBar3 extends StatelessWidget {
  final String? title;
  final String? step;

  const CustomAppBar3({Key? key, this.title, this.step}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: AppText(
                text: title ?? "",
                fontSize: 20.wWise,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
                color: context.colorScheme.appText,
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          top: 7,
          child: AppText(
            text: step ?? "",
            fontSize: 12.wWise,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w900,
            color: context.colorScheme.appGrey,
          ),
        ),
      ],
    );
  }
}
