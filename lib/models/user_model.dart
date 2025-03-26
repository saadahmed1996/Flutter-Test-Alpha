class UserModel {
  final String? id;
  final int? userId;
  final String? role;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileImage;
  final String? phoneNumber;
  final String? location;
  final String? latitude;
  final String? longitude;
  final String? notification;
  final dynamic averageRating;
  int? accountActive;
  final int? isProfileComplete;
  final String? deviceType;
  final String? deviceToken;
  final int? isVerified;
  final int? isSocial;
  final dynamic socialType;
  final int? isApproved;
  final String? isAvailable;
  int? completedRides;
  final String? employeeId;
  final String? otpCode;
  final String? company;
  final String? platform;

  UserModel(
      {this.id,
      this.userId,
      this.role,
      this.firstName,
      this.lastName,
      this.email,
      this.profileImage,
      this.phoneNumber,
      this.location,
      this.latitude,
      this.longitude,
      this.notification,
      this.averageRating,
      this.accountActive,
      this.isProfileComplete,
      this.deviceType,
      this.deviceToken,
      this.isVerified,
      this.isSocial,
      this.socialType,
      this.isApproved,
      this.isAvailable,
      this.completedRides,
      this.employeeId,
      this.otpCode,
      this.company,
      this.platform});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"]?.toString() ?? '0',
      userId: json["user_id"],
      role: json["role"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      profileImage: json["profile_image"],
      phoneNumber: json["phone_number"],
      location: json["location"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      notification: json["notification"]?.toString() ?? '1',
      averageRating: double.parse((json["average_rating"] ?? '0').toString()),
      // json["average_rating"],
      accountActive: json["account_active"],
      isProfileComplete: json["is_profile_complete"],
      deviceType: json["device_type"],
      deviceToken: json["device_token"],
      isVerified: json["is_verified"],
      isSocial: json["is_social"],
      socialType: json["social_type"],
      isApproved: json["isApproved"],
      isAvailable: json['isAvailable'].toString() ?? '0',
      completedRides:
          json['completed_rides'] != null ? json['completed_rides'] : 0,
      employeeId: json['employee_id'],
      otpCode: json['otp_code'],
      company: json['company'],
      platform: json['platform']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "role": role,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_image": profileImage,
        "phone_number": phoneNumber,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "notification": notification,
        "average_rating": averageRating,
        "account_active": accountActive,
        "is_profile_complete": isProfileComplete,
        "device_type": deviceType,
        "device_token": deviceToken,
        "is_verified": isVerified,
        "is_social": isSocial,
        "social_type": socialType,
        "isApproved": isApproved,
        "isAvailable": isAvailable,
        "completedRides": completedRides,
        "employee_id": employeeId,
        "otp_code": otpCode,
        "company": company,
        "platform": platform
      };
}
