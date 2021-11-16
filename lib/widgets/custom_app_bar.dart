import 'package:flutter/material.dart';
import 'package:resik/common/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(200.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = kRadius * 4;
    return Container(
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        color: kPrimary,
        borderRadius:
            BorderRadius.only(bottomLeft: radius, bottomRight: radius),
      ),
      child: SafeArea(
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Garbage Bin',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              backgroundColor: kPrimary,
              elevation: 0,
              actions: const [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(kPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(kRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    flex: 11,
                    child: Text(
                      'Don\'t forget to pay the garbage collector on July 10thaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.notifications_none_outlined,
                      color: kPrimary,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
