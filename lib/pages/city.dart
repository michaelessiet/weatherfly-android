import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherfly/api/api_request.dart';
import 'package:weatherfly/state%20management/state.dart';
import 'package:weatherfly/widgets/background_widget.dart';
import 'package:weatherfly/widgets/rotatinglist.dart';
import 'package:weatherfly/widgets/search_temp_widget.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StateStore store = VxState.store;
    return Scaffold(
        appBar: null,
        body: Background(
          child: SafeArea(
            child: VStack(
              [
                HStack(
                  [
                    HStack([
                      Icon(
                        Icons.location_pin,
                        color: Vx.white,
                      ),
                      store.searchedLocation
                          .toString()
                          .text
                          .capitalize
                          .color(Vx.white.withOpacity(0.6))
                          .semiBold
                          .make()
                    ]),
                    TempStack(),
                  ],
                  alignment: MainAxisAlignment.spaceBetween,
                  crossAlignment: CrossAxisAlignment.start,
                ).wFull(context).px24().py20(),
                RotatingList()
              ],
              alignment: MainAxisAlignment.spaceBetween,
            ).hFull(context).centered(),
          ),
        ));
  }
}
