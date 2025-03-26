import 'dart:convert';
import 'package:al_busayra_project/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get i => Get.find();

  String? email, password, confirmPassword, firstName, lastName;

  // Load users from JSON
  Future<List<UserModel>> loadUsers() async {
    try {
      final String response =
          await rootBundle.loadString('assets/response/users.json');
      final List<dynamic> data = jsonDecode(response);

      return data.map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      print("Error loading users: $e");
      return [];
    }
  }

  // Validate employee ID (Business Logic)
  Future<bool> validateEmployeeId(String employeeId) async {
    print("employeeId: $employeeId");
    try {
      List<UserModel> users = await loadUsers();

      // Simulate a loading delay (3 seconds)
      await Future.delayed(const Duration(seconds: 3));

      // Check if Employee ID exists
      return users
          .any((user) => user.employeeId.toString() == employeeId.toString());
    } catch (e) {
      print("Error validating employee ID: $e");
      return false;
    }
  }

  Future<bool> verifyOtp(String employeeId, String enteredOtp) async {
    try {
      // Load users from JSON
      List<UserModel> users = await loadUsers();

      // Find the user with the matching employeeId
      UserModel? user = users.firstWhere(
        (user) => user.employeeId == employeeId,
        orElse: () => UserModel(),
      );

      // If user is found and OTP matches, return true
      if (user.employeeId != null && user.otpCode == enteredOtp) {
        print("✅ OTP verified successfully for user: ${user.firstName}");
        return true;
      }

      print("❌ OTP verification failed.");
      return false;
    } catch (e) {
      print("Error verifying OTP: $e");
      return false;
    }
  }
}
