import 'package:desktop_base/helper/date_time_helper.dart';
import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/themes/app_shadows.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/basic_widget.dart';
import 'package:flutter/material.dart';

class HeaderCardComponent extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final int updateTitle;
  final DateTime? dateUpdate;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsets? margin;
  final IconData? icon;

  const HeaderCardComponent({
    Key? key,
    this.title,
    this.subtitle,
    this.updateTitle = 0,
    this.dateUpdate,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.margin, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 50;
    TextStyle titleStyle = AppStyle.title2;
    TextStyle subtitleStyle = AppStyle.normal;

    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 1000) {
       iconSize = iconSize/1.2;
       titleStyle = AppStyle.subtitle1;
       subtitleStyle = AppStyle.normalSmall;
    }

    return Flexible(
      flex: 1,
      child: CustomCard(
        margin: margin,
        backgroundColor: backgroundColor,
        child: Container(
          height: 160,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Visibility(
                  visible: (icon!=null),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Icon(
                      icon,
                      size: iconSize,
                      shadows: [AppShadows.shadow4,],
                      color: textColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          title.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: titleStyle.copyWith(
                            color: textColor,
                            fontWeight: AppStyle.semiBold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      subtitle.toString(),
                      style: subtitleStyle.copyWith(color: textColor),
                    ),
                  ],
                ),
              ),
              // Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: (updateTitle != 0),
                        child: Text(
                          "+$updateTitle",
                          style: AppStyle.subtitle1.copyWith(
                            color: textColor,
                            fontWeight: AppStyle.mediumWeight,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (dateUpdate != null),
                        child: Text(
                          DateHelper(date: dateUpdate).format().toString(),
                          textAlign: TextAlign.end,
                          style:
                              AppStyle.normalSmall.copyWith(color: textColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
