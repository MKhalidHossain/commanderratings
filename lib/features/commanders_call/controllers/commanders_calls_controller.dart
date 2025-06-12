import 'package:commanderratings/features/commanders_call/domain/model/get_all_blog_service_model.dart';
import 'package:commanderratings/features/commanders_call/domain/model/get_all_category_blog_response_model.dart';
import 'package:commanderratings/features/commanders_call/domain/model/get_all_contact.dart';
import 'package:commanderratings/features/commanders_call/service/commaders_call_service_interface.dart';
import 'package:get/get.dart';
import '../domain/model/get_one_blog_response_model.dart';
import '../domain/model/post_comment_under_blog.dart';

class CommandersCallsController extends GetxController implements GetxService {
  final CommandersCallServiceInterface commandersCallServiceInterface;

  CommandersCallsController(this.commandersCallServiceInterface);

  late GetAllBlogResponseModel getAllBlogResponseModel;
  late GetOneBlog getOneBlog;
  late GetAllContactResponse getAllContactResponse;
  late GetAllCategoryBlogResponseModel getAllCategoryBlogResponseModel;
  late PostCommentUnderBlogResponceModel postCommentUnderBlogResponceModel;

  bool isLoading = false;

  Future<void> getAllCommandersCall() async {
    try {
      isLoading = true;
      print("Getting all commanders Calls\n\n\n");

      var response =
          await commandersCallServiceInterface.getAllCommandersCall();
      if (response.statusCode == 200) {
        print('All Commander Call are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        getAllBlogResponseModel = GetAllBlogResponseModel.fromJson(
          response.body,
        );

        print('Call from Controller after model calls.');
      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

  Future<void> getACommandersCall(String _id) async {
    try {
      isLoading = true;
      print("Getting all commanders Calls\n\n\n");

      var response = await commandersCallServiceInterface
          .getSpecificCommandersCall(_id);

      if (response.statusCode == 200) {
        print('All Commander Call are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        getOneBlog = GetOneBlog.fromJson(response.body);

        print('Call from Controller after model calls.');
      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

  Future<void> getAllContact() async {
    try {
      isLoading = true;
      print("Getting all commanders Calls\n\n\n");

      var response = await commandersCallServiceInterface.getAllContact();

      if (response.statusCode == 200) {
        print('All Commander Call are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        getAllContactResponse = GetAllContactResponse.fromJson(response.body);

        print('Call from Controller after model calls.');
      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

  Future<void> getAllCategoryBlogs() async {
    try {
      isLoading = true;
      print("Getting all commanders Calls\n\n\n");

      var response = await commandersCallServiceInterface.getAllCategoryBlogs();

      if (response.statusCode == 200) {
        print('All Commander Call are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        getAllCategoryBlogResponseModel =
            GetAllCategoryBlogResponseModel.fromJson(response.body);

        print('Call from Controller after model calls of all category blog.');
      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

  Future<void> createCommentUnderBlog(
    String blogId,
    String name,
    String email,
    String comment,
  ) async {
    try {
      isLoading = true;
      print("Getting all commanders\n\n\n");

      var response = await commandersCallServiceInterface.giveCommentUnderBlog(
        blogId,
        name,
        email,
        comment,
      );

      if (response.statusCode == 201) {
        print('Create comment of a post are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        postCommentUnderBlogResponceModel =
            PostCommentUnderBlogResponceModel.fromJson(response.body);
        print('Call from Controller after model calls.');
      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }
}
