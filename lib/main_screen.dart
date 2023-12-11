import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  HtmlEditorController _controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          "Text Edditor",
          style: TextStyle(
              color: Color(0xFF314BCE),
              fontWeight: FontWeight.bold,
              fontSize: 35),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF5F6FA),
                    borderRadius: BorderRadius.circular(10)),
                child: HtmlEditor(
                  controller: _controller,
                  htmlEditorOptions: HtmlEditorOptions(
                      shouldEnsureVisible: true,
                      spellCheck: true,
                      autoAdjustHeight: true,
                      adjustHeightForKeyboard: false,
                      hint: "Enter your text here"),
                  otherOptions: OtherOptions(
                    height: 400,
                  ),
                  htmlToolbarOptions: HtmlToolbarOptions(
                      toolbarType: ToolbarType.nativeScrollable,
                      toolbarPosition: ToolbarPosition.aboveEditor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  print(await _controller.getText());
                },
                child: Container(
                  width: 185,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: Color(0xFF314BCE),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                      child: Text(
                    "Click ME !!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
