import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

class BasePage extends StatefulWidget {
  const BasePage(
      {Key? key,
      this.title,
      required this.body,
      this.isLoading = false,
      this.extendBodyBehindAppBar = false,
      this.drawerMenu, this.noAppBar = false, this.floatingActionWidget, this.floatingActionButtonLocation,})
      : super(key: key);

  final String? title;
  final Widget body;
  final Widget? drawerMenu;
  final Widget? floatingActionWidget;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool noAppBar;
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
      appBar: widget.noAppBar ? null : AppBar(
        title: widget.title == null ? Image.asset(
          "assets/images/brand_text_white.png",
          fit: BoxFit.contain,
        ).w(120).h(50) : Text(widget.title ?? "", style: TextStyle(fontSize: 15), overflow: TextOverflow.clip),
      ),
      body: VStack([
        widget.isLoading
            ? const LinearProgressIndicator()
            : UiSpacer.emptySpace(),
        widget.body.expand()
      ]),
      floatingActionButton: widget.floatingActionWidget,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      drawer: widget.drawerMenu,
    );
  }
}
