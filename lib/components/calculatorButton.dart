import "package:flutter/material.dart";

class CalculatorButton extends StatelessWidget {
  final String type;
  final String value;
  final Function() func;
  const CalculatorButton(
      {required this.type, required this.value, required this.func});

  @override
  Widget build(BuildContext context) {
    if (type == 'digit') {
      return ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(45, 45),
          backgroundColor: Colors.grey[900],
          shape: const CircleBorder(),
          elevation: 0,
        ),
        child: Text(
          value,
          style: const TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      );
    } else if (type == 'arithmeticOperator') {
      return ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(45, 45),
          backgroundColor: Colors.grey,
          shape: const CircleBorder(),
          elevation: 0,
        ),
        child: Text(
          value,
          style: TextStyle(fontSize: 17.0, color: Colors.grey[900]),
        ),
      );
    } else if (type == 'calculationOperator') {
      return ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(45, 45),
          backgroundColor: Colors.amber,
          shape: const CircleBorder(),
          elevation: 0,
        ),
        child: Text(
          value,
          style: const TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      );
    } else if (type == 'delete') {
      return ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(45, 45),
          backgroundColor: Colors.grey[900],
          shape: const CircleBorder(),
          elevation: 0,
        ),
        child: Text(
          value,
          style: const TextStyle(fontSize: 18.0, color: Colors.amber),
        ),
      );
    }

    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(45, 45),
        backgroundColor: Colors.grey,
        shape: const CircleBorder(),
        elevation: 0,
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }
}
