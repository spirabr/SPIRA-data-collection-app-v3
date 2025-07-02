import 'package:flutter/material.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/widgets/save_form_bottombar.dart';

class ManageEditListButton<T> extends StatelessWidget {
  const ManageEditListButton({
    super.key,
    required this.hint,
    required this.items,
    required this.displayProperty,
    required this.updateList,
  });

  final String hint;
  final Map<T, bool> items;
  final String Function(T) displayProperty;
  final Function(dynamic) updateList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGenericDialog(context, items, displayProperty).then((value) {
          if (value != null) return updateList(value);
        });
      },
      child: AbsorbPointer(
        child: CollectionDropdown(
            label: "Opções disponíveis",
            required: false,
            hintText: hint,
            items: const []),
      ),
    );
  }

  Future<Map<T, bool>?> showGenericDialog<T>(BuildContext context,
      Map<T, bool> items, String Function(T) displayProperty) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: ListBody(
                  children: items.keys.map((T key) {
                    return CheckboxListTile(
                      title: Text(displayProperty(key)),
                      value: items[key],
                      onChanged: (bool? value) {
                        setState(() {
                          items[key] = value!;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                SaveFormBottomBar(
                  onSavePressed: () {
                    Navigator.of(context).pop(items);
                  },
                  onCancelPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
