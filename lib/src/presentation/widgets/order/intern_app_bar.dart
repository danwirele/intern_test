import 'package:flutter/material.dart';

class InternAppBar extends StatelessWidget {
  static const Color appBarBackgroundColor = Color(0xFFFBFBFB);

  static const double leadingSize = 20.0;

  static const double dividerThickness = 0.2;

  const InternAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: appBarBackgroundColor,
      leading: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: leadingSize,
      ),
      centerTitle: true,
      title: Text(
        'Ordering',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 0),
        child: Divider(
          thickness: dividerThickness,
          height: 0,
          color: Colors.black,
          indent: 1,
          endIndent: 1,
        ),
      ),
    );
  }
}
