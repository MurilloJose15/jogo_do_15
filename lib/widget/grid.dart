import 'package:flutter/material.dart';

class grid extends StatelessWidget {
  grid(this.number, this.onClick);

  var number = [];

  Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.2,
      child: GridView.builder(
          itemCount: number.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return number[index] != 0
                ? GestureDetector(
                    onTap: () {
                      onClick(index);
                    },
                    child: Card(
                      elevation: 10,
                      color: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: FittedBox(
                            child: Text(number[index].toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          }),
    );
  }
}
