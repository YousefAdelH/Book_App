import 'package:book_app/core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key,required this.urlImage});
final String urlImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: AspectRatio(
        aspectRatio: 4 / 6,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            placeholderFadeInDuration: Duration.zero,
            fit: BoxFit.fill,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),

            imageUrl:urlImage ,),
        )
    ));
  }
}
