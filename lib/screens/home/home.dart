import 'package:flutter/material.dart';
import 'package:resik/common/constant.dart';
import 'package:resik/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            linkedDevicesInfo(context),
            const SizedBox(height: kPadding),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.75,
              child: PageView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kPadding / 2, vertical: 0),
                  child: garbageCard(context),
                ),
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  Container garbageCard(BuildContext context) {
    final cardMore = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'more',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {},
        ),
      ],
    );

    final cardInfo = Container(
      padding: const EdgeInsets.all(kPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.subtitle2,
                children: const [
                  TextSpan(
                    text: '2.3 Kg',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '\nTotal Weight'),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
            child: VerticalDivider(thickness: 2),
          ),
          Expanded(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.subtitle2,
                children: const [
                  TextSpan(
                    text: '10',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '\nDays'),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    final storageIndicator = Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const SizedBox(
          width: 150,
          height: 150,
          child: CircularProgressIndicator(
            color: kPrimary,
            value: 0.7,
            strokeWidth: 8,
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.headline6,
            children: const [
              TextSpan(
                  text: '70%', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '\nFilled')
            ],
          ),
        ),
      ],
    );

    final cardHeader = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Garbage Bin 1',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        Switch(
          value: false,
          onChanged: (value) {},
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(kRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cardHeader,
          const SizedBox(height: kPadding),
          storageIndicator,
          const SizedBox(height: kPadding),
          const Divider(thickness: 2),
          cardInfo,
          cardMore,
        ],
      ),
    );
  }

  Container linkedDevicesInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(kRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '2 Linked Devices',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: kPrimary),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: kPrimary,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
