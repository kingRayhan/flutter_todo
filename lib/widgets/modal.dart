import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  Modal({
    Key? key,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  Function(String taskName) onSave;
  VoidCallback onCancel;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 180.0,
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    onSave(_controller.text);
                    _controller.text = "";
                  },
                  child: const Text("Save")),
              TextButton(
                  onPressed: onCancel,
                  child: const Text(
                    "Close",
                    style: TextStyle(color: Colors.redAccent),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
