import 'package:car_coreconnect/core/gen/fonts.gen.dart';
import 'package:car_coreconnect/core/theme/colors.dart';
import 'package:car_coreconnect/core/theme/dimens.dart';
import 'package:car_coreconnect/core/widgets/app_space.dart';
import 'package:car_coreconnect/core/widgets/app_svg_viewer.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    this.title,
    this.color,
    this.width,
    this.iconPath,
    this.margin,
    this.borderRadius,
  });

  final GestureTapCallback? onPressed;
  final String? title;
  final Color? color;
  final double? width;
  final String? iconPath;
  final EdgeInsets? margin;
  final double? borderRadius;

  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: width ?? size.width,
      height: 54.0,
      margin: margin ?? const EdgeInsets.all(Dimens.largePadding),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? Dimens.corners,
              ),
            ),
          ),
          side: WidgetStateProperty.all<BorderSide>(
            const BorderSide(
              color: AppColors.primaryColor,
              width: 2.0,
            ),
          ),
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null) ...[
                AppSvgViewer(
                  iconPath ?? '',
                  color: AppColors.primaryColor,
                ),
                const AppHSpace(),
              ],
              Text(
                title ?? '',
                style: const TextStyle(
                  fontFamily: FontFamily.poppinsMedium,
                  color: AppColors.primaryColor,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}