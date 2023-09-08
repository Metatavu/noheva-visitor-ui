import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:noheva_visitor_ui/database/dao/keys_dao.dart";
import "package:simple_logger/simple_logger.dart";

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  bool _isDeviceApproved = false;

  @override
  void initState() {
    super.initState();
    keysDao.checkIsDeviceApproved().then(
      (value) {
        if (!value) {
          Timer.periodic(const Duration(seconds: 5), (timer) async {
            SimpleLogger().info("Checking whether device has been approved...");
            bool isApproved = await keysDao.checkIsDeviceApproved();
            setState(() => _isDeviceApproved = isApproved);
            if (isApproved) {
              SimpleLogger().info("Device is approved!");
              timer.cancel();
            }
          });
        }
        setState(() => _isDeviceApproved = value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_isDeviceApproved
            ? AppLocalizations.of(context)!.deviceIsApproved
            : AppLocalizations.of(context)!.deviceNotYetApproved),
      ],
    );
  }
}
