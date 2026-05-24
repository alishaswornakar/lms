import 'package:flutter/material.dart';

class CreateCoursePage extends StatefulWidget {
  const CreateCoursePage({super.key});

  static const String routeName = "/create-course";

  @override
  State<CreateCoursePage> createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<CreateCoursePage> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PageController(viewportFraction: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create your course")),
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            color: Colors.red,

            child: Center(
              child: FilledButton(
                onPressed: () {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Text("Next"),
              ),
            ),
          ),
          Container(color: Colors.blue),
        ],
      ),
    );
  }
}
