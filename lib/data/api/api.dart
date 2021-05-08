class Api{
  static String mainRoute = "http://10.0.2.2:3000";

  static Uri getUri(String slug){
    return Uri.parse(mainRoute + slug);
  }
}