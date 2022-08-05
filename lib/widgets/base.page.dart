import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

class BasePage extends StatefulWidget {
  const BasePage(
      {Key? key,
      required this.title,
      required this.body,
      this.isLoading = false,
      this.extendBodyBehindAppBar = false, required this.drawerMenu})
      : super(key: key);

  final String title;
  final Widget body;
  final Widget drawerMenu;
  final bool isLoading;
  final bool extendBodyBehindAppBar;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Image.asset("assets/images/brand_text_white.png", fit: BoxFit.contain,).w(120).h(50),
      ),
      body: VStack([
        widget.isLoading
            ? const LinearProgressIndicator()
            : UiSpacer.emptySpace(),
        widget.body.expand()
      ]),
      drawer: widget.drawerMenu,
    );
  }
}
