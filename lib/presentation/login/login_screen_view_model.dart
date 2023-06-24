import 'package:fittrix_application/core/f_secure_storage.dart';
import 'package:fittrix_application/domain/model/login/user_record.dart';
import 'package:fittrix_application/domain/use_case/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenViewModel extends GetxController {
  final LoginUseCase loginUseCase;

  LoginScreenViewModel({required this.loginUseCase});

  final _userRecord = UserRecord(
    createdAt: '',
    avatar: '',
    userId: 0,
    id: '',
  ).obs;
  get userRecord => _userRecord.value;

  final _textEditingController = TextEditingController();
  get textEditingController => _textEditingController;

  final _isBlankTextField = true.obs;
  get isBlankTextField => _isBlankTextField.value;

  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  final _isLoggined = false.obs;
  get isLoggined => _isLoggined.value;

  changeLoadingStatus(bool value) {
    _isLoading.value = value;
  }

  changeLoggedInStatus({bool? init}) async {
    final password = await FSecureStorage.getPassword();
    _isLoggined.value = password.isNotEmpty;

    if (password.isNotEmpty && init != null && init) {
      await signInWithPassword(password);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await changeLoggedInStatus(init: true);

    _textEditingController.addListener(() {
      _isBlankTextField.value = _textEditingController.value.text.trim().isEmpty;
    });
  }

  Future<bool> signInWithPassword(String password) async {
    changeLoadingStatus(true);
    final result = await loginUseCase(int.parse(password));

    return result.when(success: (success) async {
      _userRecord.value = success!;
      await FSecureStorage.setPassword(password);
      await changeLoggedInStatus();

      changeLoadingStatus(false);

      return true;
    }, error: (error) {
      changeLoadingStatus(false);
      return false;
    });
  }

  Future<void> logout() async {
    await FSecureStorage.deleteAll();
    _textEditingController.text = '';
    await changeLoggedInStatus();
  }
}
