import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/cache_manager.dart';
import '../config/constants.dart';

class CustomImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final int imageDim;
  const CustomImage(
      {Key? key, required this.url, this.height = 70, this.width = 70, this.imageDim = 150})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    String url = this.url;
    if (url.startsWith('imagekit:/')) {
      url = url.replaceFirst('imagekit:/', 'https://ik.imagekit.io/6z4jinkib');

      // Based on the size build the url
      if (width > 0 && height > 0) {
        if (width > height) {
          url = '$url?tr=w-$imageDim';
        } else {
          url = '$url?tr=h-$imageDim';
        }
      }
    }

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _CustomImage(url: url, width: width, height: height),
          if (url.startsWith('https:/'))
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                child: Icon(
                  Icons.cloud_done_outlined,
                  size: 12,
                  color: Colors.green.withOpacity(0.4),
                ),
              ),
            ),
          if (url.startsWith('file:/'))
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                child: Icon(
                  Icons.file_present,
                  size: 14,
                  color: Colors.black87.withOpacity(0.4),
                ),
              ),
            ),
          if (url.startsWith('fileRaw:/'))
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                child: Icon(
                  Icons.image,
                  size: 15,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class _CustomImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  const _CustomImage(
      {Key? key, required this.url, this.height = 70, this.width = 70})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String imageUrl;
    // Check if url is file image or network image
    if (url.startsWith('http:') || url.startsWith('https:')) {
      imageUrl = url;
      return CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.contain,
          height: height,
          width: width,
          cacheManager: ParchiImageCacheManger(),
          progressIndicatorBuilder: (context, url, progress) => Center(
            child: CircularProgressIndicator(
              value: progress.progress,
            ),
          ),
          errorWidget: (context, obj, trace) {
            return SizedBox(
              height: height,
              width: width,
              child: const Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            );
          },
        );
    } else if (url.startsWith('file:')) {
      imageUrl = Constants.baseImagePath + url.substring(6);
      return Image.file(File(imageUrl),
          fit: BoxFit.cover,
          height: height,
          width: width, errorBuilder: (context, obj, trace) {
        return SizedBox(
          height: height,
          width: width,
          child: const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        );
      });
    } else if (url.startsWith('fileRaw:/')) {
      imageUrl = url.substring(9);
      return Image.file(File(imageUrl),
          fit: BoxFit.cover,
          height: height,
          width: width, errorBuilder: (context, obj, trace) {
        return SizedBox(
          height: height,
          width: width,
          child: const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        );
      });
    }

    return SizedBox(
      height: height,
      width: width,
      child: const Center(
        child: Icon(
          Icons.warning,
          color: Colors.orange,
        ),
      ),
    );
  }
}
