class ServerException implements Exception{
  final String message;
  final int statusCode;
  ServerException(this.message,this.statusCode);
}

class NetworkException implements Exception{
  final String message;
  final int statusCode;
  NetworkException(this.message,this.statusCode);
}