import 'package:flutter/cupertino.dart';

class ResuableCard extends StatelessWidget {
  final Color colour;
  // By making cardChild nullable with the ? symbol, the variable is not required
  // to have a value assigned to it. This makes it optional, allowing instances of
  // ReusableCard to be created without providing a value for cardChild.
  final Widget? cardChild;
  const ResuableCard({required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colour,

        ),
      ),
    );
  }
}
