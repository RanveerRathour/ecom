import 'package:ecom/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final int index;
  final void Function() onPress;
  const GridCard({Key? key, required this.index, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index % 2 == 0
          ? const EdgeInsets.only(left: 22, right: 22)
          : const EdgeInsets.only(right: 22, left: 22),
      decoration: CustomTheme.getCardDecoration(),
      child: GestureDetector(
        onTap: onPress,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Expanded(
                  flex: 7,
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/img.jpg',

                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                          child: Text(
                            "4 BHK, Vatika, sec-82, Gurugram | Home Interior",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        Text(
                          "₹ 399",
                          style: Theme.of(context).textTheme.headlineLarge,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
