
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants/appcolor.dart';


class TlCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  const TlCachedNetworkImage({Key? key, required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
          ),
        );
      },
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: AppColor.appColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error,color: AppColor.red,),
    );
  }
}

