import 'package:get/get_connect/http/src/response/response.dart';

abstract class CommandersCallServiceInterface {

  Future<Response> getAllCommandersCall();
  Future<Response> getSpecificCommandersCall(String _id );
  Future<Response> getAllContact();

  Future<Response> giveCommentUnderBlog( String blogId, String name, String email, String comment);

}