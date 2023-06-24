import 'package:cached_network_image/cached_network_image.dart';
import 'package:fittrix_application/presentation/login/login_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final screenViewModel = Get.find<LoginScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Obx(
          () => screenViewModel.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : screenViewModel.isLoggined
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('로그인 완료됨'),
                          Obx(
                            () => CachedNetworkImage(imageUrl: screenViewModel.userRecord.avatar),
                          ),
                          Obx(
                            () => Text(
                              screenViewModel.userRecord.userId.toString(),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await screenViewModel.logout();
                            },
                            child: Text('로그아웃'),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Center(
                          child: Text('Login Screen'),
                        ),
                        TextField(
                          controller: screenViewModel.textEditingController,
                          keyboardType: TextInputType.number,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await screenViewModel.signInWithPassword(screenViewModel.textEditingController.value.text);
                          },
                          child: Text('로그인하기'),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
