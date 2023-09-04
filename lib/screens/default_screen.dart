import "dart:async";
import "dart:ui";
import "package:html/parser.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_html/flutter_html.dart";
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
    return Html(
      data: """
<div id="e055703c-a710-4dd5-9818-f8ec5ec09d58" data-component-type="layout" name="Juurielementti" style="display: flex; flex-direction: column; width: 100%; height: 100%; background-color: rgb(173, 160, 160);"><div class="ylarivi" id="55deb0aa77334d7fbc1b4418bb83cbcd" data-component-type="layout" name="Ylärivi" style="display: flex; flex-direction: column; background-color: rgb(246, 97, 97); width: 100%; height: 10%; align-content: center; justify-content: center; align-items: center; justify-items: center;"><h4 id="f1e7b056-5bb1-4c8b-87b5-53b467bd28b4" data-component-type="text" name="Ylärivin teksti">@resources/024fe541-e3bb-41be-a840-f006b971de14</h4><button id="506d3c27-e925-4a79-a477-bdc74aa64785" data-component-type="button" name="Ylärivin nappula" style="height: 30px; width: 75%;">@resources/bf42bb04-669e-4023-ae65-a485c954977a</button></div><div id="a8196003-ad28-4f36-9a58-eed145571502" data-component-type="layout" name="Keskirivi" style="display: flex; flex-direction: row; width: 100%; height: 80%; background-color: rgb(68, 23, 23); align-content: center; justify-content: center; align-items: center; justify-items: center;"><img id="9417075c-89bd-46f2-9b27-59bf1cc8de33" data-component-type="image" name="Keskirivin kuva" src="https://t3.ftcdn.net/jpg/04/85/49/84/360_F_485498470_HPZ4hpLnyZdLqNs6r1nFsUz2Wvd50wXt.jpg" style="width: 540px; height: 630px;"></div><div id="b43e36bf-e73e-44a9-b533-006615450297" data-component-type="layout" name="Alarivi" style="display: flex; flex-direction: row; width: 100%; height: 10%; background-color: rgb(87, 21, 223); align-content: flex-end; justify-content: flex-end; align-items: flex-end; justify-items: flex-end;"><p id="a8c080dd-50d0-4eda-8188-50599b332ce7" data-component-type="text" name="Alarivin teksti">@resources/b0e2a023-4189-4c39-bd9c-48f2e98db264</p></div></div>
""",
      style: {
        "body": Style(
            margin: Margins.zero,
            padding: HtmlPaddings.zero,
            textDecoration: TextDecoration.none,
            textTransform: ),
      },
    );
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Text(_isDeviceApproved
    //         ? AppLocalizations.of(context)!.deviceIsApproved
    //         : AppLocalizations.of(context)!.deviceNotYetApproved),
    //   ],
    // ),
  }
}
