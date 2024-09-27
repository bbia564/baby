import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bdl_logic.dart';

class BdlViewPage extends GetView<PageLogic> {
  const BdlViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.prosacco.value
              ? const CircularProgressIndicator(color: Colors.green)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.igsmj();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
