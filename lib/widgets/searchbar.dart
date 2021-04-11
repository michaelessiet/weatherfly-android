import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherfly/state%20management/state_mutation.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: TextField(
      controller: searchController,
      onSubmitted: (value) =>
          SetSearchParameter(searchvalue: value, context: context),
      cursorColor: Vx.white,
      style: TextStyle(color: Vx.white),
      decoration: InputDecoration(
        hintText: "Input city name here",
        fillColor: Vx.white,
        border: InputBorder.none,
        hintStyle: TextStyle(color: Vx.white.withOpacity(0.5), fontWeight: FontWeight.w300)
      ),
    )).border(color: Vx.white).padding(EdgeInsets.only(left: 10, right: 10)).make();
  }
}
