
mixin ImageMixinConfig {
  String getImageUrl(String url, {double? height, double? width}) {
    if (url.isEmpty) {
      return url;
    }
    if (url.startsWith('http') || url.startsWith('https')) {
      return url;
    }

    if (url.startsWith('imagekit:/')) {
      String tmp = url.replaceFirst('imagekit:/', 'https://ik.imagekit.io/6z4jinkib');
      if (height != null && width != null) {
        if (height > width) {
          tmp = '$tmp?tr=w-$width';
        } else {
          tmp = '$tmp?tr=h-$height';
        }
      }
      if (height != null) {
        tmp = '$tmp?tr=h-$height';
      }
      if (width != null) {
        tmp = '$tmp?tr=w-$width';
      }
      return '$tmp';
    }
    return url;
  }
}