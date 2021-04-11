import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Background extends StatelessWidget {
  final Widget child;
  Background({this.child});
  @override
  Widget build(BuildContext context) {
    return ZStack([
      CachedNetworkImage(
        imageUrl:
            'https://images.pexels.com/photos/3389536/pexels-photo-3389536.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) =>
            'Weatherfly'.text.xl3.semiBold.make(),
      ),
      VxBox()
          .withDecoration(BoxDecoration(
            color: Vx.black.withOpacity(0.8),
          ))
          .make(),
      child
    ]);
  }
}
