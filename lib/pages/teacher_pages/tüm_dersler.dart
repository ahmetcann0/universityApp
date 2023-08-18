import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_appbar.dart';
import 'package:flutter_deneme_projem/pages/data.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_listview_text.dart';

import '../login_page.dart';

class akademisyen_sinif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global_theme.colorScheme.background,
      appBar: CustomAppBar(
        title: 'My Courses',
        color: global_theme.colorScheme.background,
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                custom_listview_text(
                  text: lectures1.kod,
                ),
                custom_listview_text(
                  text: lectures2.kod,
                ),
                custom_listview_text(
                  text: lectures3.kod,
                ),
                custom_listview_text(
                  text: lectures4.kod,
                ),
                custom_listview_text(
                  text: 'EMPTY1',
                ),
                custom_listview_text(
                  text: 'EMPTY2',
                ),
                custom_listview_text(
                  text: 'EMPTY3',
                ),
                custom_listview_text(
                  text: 'EMPTY4',
                ),
                custom_listview_text(
                  text: 'EMPTY5',
                ),
                custom_listview_text(
                  text: 'EMPTY6',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
