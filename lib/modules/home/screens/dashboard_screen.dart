import 'package:al_busayra_project/controllers/global_controller.dart';
import 'package:al_busayra_project/custom_widgets/common_scaffold.dart';
import 'package:al_busayra_project/custom_widgets/custom_text.dart';
import 'package:al_busayra_project/routes/app_routes_name.dart';
import 'package:al_busayra_project/services/local_storage.dart';
import 'package:al_busayra_project/utils/app_assets_path.dart';
import 'package:al_busayra_project/utils/app_colors.dart';
import 'package:al_busayra_project/utils/app_dialogs.dart';
import 'package:al_busayra_project/utils/app_fonts.dart';
import 'package:al_busayra_project/utils/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      extentBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kPrimaryColor,
        onPressed: () {
          AppNavigation.navigateToRemovingAll(
              context, AppRouteName.LOGIN_SCREEN_ROUTE);
          SharedPreference().clear();
          AppDialogs.showToast(message: "Logout Successfully");
        },
        child: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
      child: Column(
        children: [
          //User Profile Detail
          Stack(
            children: [
              Container(
                height: 280.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetPaths.DASHBOARD_HEADER_IMAGE),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              GlobalController
                                      .i.currentUser.value?.profileImage ??
                                  '',
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: GlobalController
                                      .i.currentUser.value?.employeeId ??
                                  '',
                              fontsize: 14.sp,
                              color: AppColors.whiteColor,
                              fontFamily: AppFonts.publicSansRegular,
                            ),
                            CustomText(
                              text:
                                  '${GlobalController.i.currentUser.value?.firstName ?? ''} ${GlobalController.i.currentUser.value?.lastName ?? ''}',
                              fontsize: 16.sp,
                              color: AppColors.whiteColor,
                              fontFamily: AppFonts.publicSansBold,
                            ),
                            CustomText(
                              text:
                                  GlobalController.i.currentUser.value?.email ??
                                      '',
                              fontsize: 12.sp,
                              color: AppColors.whiteColor,
                              fontFamily: AppFonts.publicSansMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Container(
                      height: 1.2,
                      width: Get.width,
                      color: Colors.white,
                      padding: const EdgeInsets.all(20),
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Company: ',
                          fontsize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                        CustomText(
                          text: GlobalController.i.currentUser.value?.company ??
                              '',
                          fontsize: 14.sp,
                          fontFamily: AppFonts.publicSansRegular,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Platform:  ',
                          fontsize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                        CustomText(
                          text:
                              GlobalController.i.currentUser.value?.platform ??
                                  '',
                          fontsize: 14.sp,
                          fontFamily: AppFonts.publicSansRegular,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                // image: DecorationImage(
                //   image: AssetImage(AssetPaths.BACKGROUND_IMAGE),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Key functions',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 20),
                  GridView.count(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    children: [
                      _buildIcon(AssetPaths.REQUEST_ICON, 'Request'),
                      _buildIcon(AssetPaths.COMPLAINT_ICON, 'Complaint'),
                      _buildIcon(AssetPaths.SALARY_SLIP_ICON, 'Salary Slip'),
                      _buildIcon(AssetPaths.CHAT_ICON, 'Chat'),
                      _buildIcon(AssetPaths.BALANCE_ICON, 'Loan Balance'),
                      _buildIcon(
                          AssetPaths.ACCEPTANCE_ICON, 'Asset Acceptance'),
                      _buildIcon(AssetPaths.INFORMATION_ICON, 'Update Info'),
                      _buildIcon(AssetPaths.EMERGENCY_ICON, 'Emergency'),
                    ],
                  ),
                  20.verticalSpace,
                  CustomText(
                    text: "Announcement",
                    fontsize: 14.sp,
                    fontFamily: AppFonts.openSansBold,
                  ),
                  20.verticalSpace,
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetPaths.ANNOUCEMENT_ICON,
                          width: 60,
                          height: 60,
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Title here",
                                fontsize: 14.sp,
                                fontFamily: AppFonts.openSansBold,
                              ),
                              5.verticalSpace,
                              CustomText(
                                text:
                                    "Description of the announcement in details will come here",
                                fontsize: 12.sp,
                                fontFamily: AppFonts.publicSansRegular,
                              ),
                              5.verticalSpace,
                              CustomText(
                                text: "Posted on: 12/08/2025",
                                fontsize: 10.sp,
                                fontFamily: AppFonts.publicSansBold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String assetImage, String label) {
    return Column(
      children: [
        Image.asset(assetImage, width: 30, height: 30),
        10.verticalSpace,
        CustomText(
          text: label,
          fontsize: 10.sp,
          fontFamily: AppFonts.openSansRegular,
          isLeftAlign: false,
        )
      ],
    );
  }
}
