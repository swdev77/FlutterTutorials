import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.mobileBuilder,
    required this.tabletBuilder,
    required this.desktopBuilder,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, BoxConstraints constraints)
      mobileBuilder;
  final Widget Function(BuildContext context, BoxConstraints constraints)
      tabletBuilder;
  final Widget Function(BuildContext context, BoxConstraints constraints)
      desktopBuilder;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 481;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1200 &&
      MediaQuery.of(context).size.width >= 480;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 960;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 480) {
          return mobileBuilder(context, constraints);
        } else if (constraints.maxWidth < 1200) {
          return tabletBuilder(context, constraints);
        } else {
          return desktopBuilder(context, constraints);
        }
      },
    );
  }
}
