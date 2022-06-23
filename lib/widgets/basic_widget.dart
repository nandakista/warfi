import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingIndicator =
    const SpinKitThreeBounce(size: 45, color: Colors.blue);

class CustomCard extends StatelessWidget {
  final Color? borderColor, backgroundColor;
  final Widget? child;
  final double? borderRadius;
  final double? elevation;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomCard({
    Key? key,
    this.borderColor,
    this.backgroundColor = Colors.white,
    this.borderRadius = 12,
    this.child,
    this.padding,
    this.elevation,
    this.margin,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      elevation: elevation ?? 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          // color: backgroundColor,
          color: backgroundColor ??
              ((context.isDarkMode())
                  ? AppColors.systemBgDark
                  : Colors.white),
        ),
        child: child,
      ),
    );
  }
}

class ActionIcon extends StatelessWidget {
  final int countUpdate;
  final IconData? icon;
  final Color? color;
  final VoidCallback? onPressed;

  const ActionIcon({
    Key? key,
    this.countUpdate = 0,
    this.icon,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color:
                  color ?? ((context.isDarkMode()) ? Colors.white : Colors.black),
              size: 32,
            ),
          ),
          Visibility(
            visible: (countUpdate != 0),
            child: Positioned(
              top: 10,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                maxRadius: 8,
                child: Text(
                  countUpdate.toString(),
                  style: const TextStyle(fontSize: 9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? iconSize, size;
  final Color? backgroundColor, color, splashColor;

  const CircleIcon({
    Key? key,
    this.onPressed,
    required this.icon,
    this.backgroundColor = Colors.black,
    this.color = Colors.white,
    this.iconSize = 30,
    this.size = 56,
    this.splashColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: backgroundColor ?? Colors.black54.withOpacity(0.6),
        child: SizedBox(
          height: size,
          width: size,
          child: IconButton(
            onPressed: onPressed,
            splashColor: splashColor,
            icon: Icon(
              icon,
              size: iconSize,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class MyBox extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final EdgeInsets? padding;
  const MyBox({Key? key, this.child, this.padding, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: (context.isDarkMode()) ? AppColors.baseDark : color,
      child: child,
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: TextStyle(
        fontSize: 110,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
