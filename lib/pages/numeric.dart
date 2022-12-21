import 'package:flutter/material.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;

  final ValueChanged<int> onChanged;

  const NumericStepButton({Key? key, this.minValue = 0, this.maxValue = 10, required this.onChanged}): super(key: key);

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {

  int counter= 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(
            Icons.remove,
            color: (counter>widget.minValue)?Colors.black: Colors.black38,
          ),
          padding: const EdgeInsets.only(left:14),
          iconSize: 25.0,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              if (counter > widget.minValue) {
                counter--;
              }
              widget.onChanged(counter);
            });
          },
        ),
        SizedBox(
          width: 25,
          child: Text(
            '$counter',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: (counter<widget.maxValue)?Colors.black: Colors.black38,
          ),
          padding: const EdgeInsets.only(right:14),
          iconSize: 25.0,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              if (counter < widget.maxValue) {
                counter++;
              }
              widget.onChanged(counter);
            });
          },
        ),
      ],
    );
  }
}