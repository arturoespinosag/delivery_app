import 'package:deliveryapp/src/ui/widgets/circle_button.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text('O via redes sociales'),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButton(
              onPressed: () {},
              icon: 'assets/pages/welcome/facebook.svg',
              backgroundColor: Colors.blueAccent,
            ),
            CircleButton(
              onPressed: () {},
              icon: 'assets/pages/welcome/google.svg',
              backgroundColor: Color(0xFFDD4337),
            ),
            CircleButton(
              onPressed: () {},
              icon: 'assets/pages/welcome/apple.svg',
              backgroundColor: Colors.black,
            )
          ],
        ),
      ],
    );
  }
}
