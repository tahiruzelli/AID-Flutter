import 'package:AID/Controllers/VideoController/video_controller.dart';
import 'package:AID/Models/tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AutoCompletTF extends StatefulWidget {
  late List<Tag> tags;
  AutoCompletTF(this.tags);
  @override
  State<StatefulWidget> createState() => _AutoCompletTF();
}

class _AutoCompletTF extends State<AutoCompletTF> {
  VideoController videoController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Autocomplete<Tag>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return widget.tags
            .where((Tag county) => county.name!
                .toLowerCase()
                .startsWith(textEditingValue.text.toLowerCase()))
            .toList();
      },
      displayStringForOption: (Tag option) => option.name!,
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return TextField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          style: const TextStyle(fontWeight: FontWeight.bold),
        );
      },
      onSelected: (Tag selection) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<Tag> onSelected, Iterable<Tag> options) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            child: Container(
              decoration: const BoxDecoration(),
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final Tag option = options.elementAt(index);

                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                      videoController.selectedTag = option;
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? Colors.black12 : Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          option.name!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
