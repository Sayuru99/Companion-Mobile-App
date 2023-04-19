import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(243, 224, 224, 219),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                iconSize: 18,
                onPressed: () {
                  // Perform search action here
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
