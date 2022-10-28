import 'package:ecom/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      margin: const EdgeInsets.only(left: 30, right: 30,bottom: 30),
      decoration: CustomTheme.getCardDecoration(),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Row(
            children: [
              Expanded(child: SizedBox(height: double.infinity,
              child: Image.asset('assets/img.jpg',
                fit: BoxFit.cover,
              ),
              )),
              Expanded(
                  flex: 2,
                  child: Container(
                margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: const EdgeInsets.only(bottom: 8,right: 6),
                        child: Text(
                          "4 BHK, Vatika, sec-82, Gurugram | Home Interior",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        ),
                        Padding(padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Qty: 1",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "\$ 399",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
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
