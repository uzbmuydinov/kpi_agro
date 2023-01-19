import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';

class UpdateService {

  Future<void> _tartUpdateService() async {
    try {

      if (Platform.isAndroid) {
        //Here, the user is asked and could decide if they want to start the update or ignore it
        await UpdateService.checkForImmediateUpdate();

        //After this is done, we'll show a dialog telling the user
        //that the update is done, and ask them to complete it.
        //For this case, we'll use a simple dialog to demonstrate this


      }
    } catch (e) {
      //The user choosing to ignore the flexible update should trigger an exception
      //Your preferred method of showing the user erros
    }
  }


  static Future<AppUpdateInfo?> _checkForUpdate() async {
    try {
      return await InAppUpdate.checkForUpdate();
    } catch (e) {
      //Throwing the exception so we can catch it on our UI layer
      throw e.toString();
    }
  }

  static Future<void> checkForImmediateUpdate() async {
    try {
      //Call and get the result from the initial function
      final AppUpdateInfo? info = await _checkForUpdate();

      //Because info could be null
      if (info != null) {
        if (info.updateAvailability == UpdateAvailability.updateAvailable) {
          InAppUpdate.performImmediateUpdate();
        }
      }
    } catch (e) {
      throw e.toString();
    }
  }

}

