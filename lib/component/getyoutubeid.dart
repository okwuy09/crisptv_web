String getYoutubeThumbnail(String videoUrl) {
  final Uri? uri = Uri.tryParse(videoUrl);
  if (uri == null) {
    return '';
  }

  return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
}

// final String thumbnail =
//     getYoutubeThumbnail('https://www.youtube.com/watch?v=ISPK_eWX3ls');
  //print(thumbnail);