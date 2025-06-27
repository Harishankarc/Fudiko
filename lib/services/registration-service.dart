import 'package:fudiko/api/dio_client.dart';
import 'package:fudiko/models/registration/registration-model.dart';
import 'package:fudiko/models/registration/registration-response-model.dart';

class RegistrationAuthService {
  Future<RegResponseModel> registerUser(UserRegistrationModel user) async {
    try {
      final formData = user.toFormData();

      final response = await DioClient.dio.post(
        '/register',
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        return RegResponseModel.fromJson(response.data);
      } else {
        return RegResponseModel(
          status: false,
          message: 'Registration failed: ${response.statusCode}',
          token: null,
        );
      }
    } catch (e) {
      return RegResponseModel(
        status: false,
        message: 'Something went wrong: $e',
        token: null,
      );
    }
  }
}
