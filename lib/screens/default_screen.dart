import "dart:async";
import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:noheva_visitor_ui/database/dao/device_exhibition_mapping_dao.dart';
import 'package:noheva_visitor_ui/database/dao/key_dao.dart';
import "package:noheva_visitor_ui/database/dao/layout_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/screens/exhibition_screen.dart";
import "package:noheva_visitor_ui/utils/layout_controller.dart";
import "package:noheva_visitor_ui/utils/offline_file_controller.dart";
import "package:simple_logger/simple_logger.dart";
import "package:noheva_visitor_ui/utils/page_controller.dart"
    as page_controller;

/// Default Screen
class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

/// Default Screen State
class _DefaultScreenState extends State<DefaultScreen> {
  bool _isDeviceApproved = false;

  @override
  void initState() {
    super.initState();
    streamController.stream.listen((event) {
      if (event != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExhibitionScreen(exhibitionId: event),
          ),
        );
      }
    });
    keyDao.checkIsDeviceApproved().then(
      (value) {
        if (!value) {
          Timer.periodic(const Duration(seconds: 5), (timer) async {
            SimpleLogger().info("Checking whether device has been approved...");
            bool isApproved = await keyDao.checkIsDeviceApproved();
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

    exhibitionDao.getExhibition().then((value) async {
      if (value != null) {
        print("Value: $value");
        final exhibitionDeviceId = value.exhibitionDeviceId;
        final deviceDataApi = await apiFactory.getDeviceDataApi();
        final pages = await deviceDataApi
            .listDeviceDataPages(
              exhibitionDeviceId: exhibitionDeviceId,
            )
            .then((value) => value.data!);
        final existingPages = await pageDao.listPages(value.exhibitionId);
        for (var page in pages) {
          final existingPage = existingPages.firstWhereOrNull(
            (element) => element.id == page.id,
          );
          if (existingPage == null) continue;
          final pageIsModified = page_controller.PageController.isPageModified(
            existingPage,
            page,
          );
          if (pageIsModified) {
            SimpleLogger().info("Page is modified, updating...");
            final existingResources = existingPage.resources;
            final newResources = page.resources;

            for (var existingResource in existingResources) {
              final newResource = newResources.firstWhereOrNull(
                (element) => element.id == existingResource.id,
              );
              final resourceIsChanged =
                  existingResource.data != newResource?.data;
              final resourceIsOfflineable = page_controller
                  .PageController.offlineMediaTypes
                  .contains(existingResource.type);

              if (resourceIsOfflineable && resourceIsChanged) {
                SimpleLogger().info(
                  "Resource ${existingResource.id} is modified, deleting...",
                );
                await offlineFileController
                    .deleteOfflineFile(existingResource.data);
              }
            }
            await page_controller.PageController.persistPage(page);
          } else {
            SimpleLogger().info("Page is not modified. Not updating!");
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_isDeviceApproved
                ? AppLocalizations.of(context)!.deviceIsApproved
                : AppLocalizations.of(context)!.deviceNotYetApproved),
          ],
        ),
      ),
    );
  }
}
