import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/domain/entities/comorbidity_entity.dart';

class CollectionComorbiditiesSelector extends StatelessWidget {
  const CollectionComorbiditiesSelector(
      {super.key,
      required this.comorbidities,
      this.onSaved,
      this.initialValue});

  final List<ComorbidityEntity> comorbidities;
  final FormFieldSetter<List<ComorbidityEntity>>? onSaved;
  final List<ComorbidityEntity>? initialValue;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "* Comorbidades",
          style: TextStyle(
            color: AppColors.neutral600,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        ComorbiditiesFormField(
          comorbidities: comorbidities,
          onSaved: onSaved,
          initialValue: initialValue,
        ),
      ],
    );
  }
}

class ComorbiditiesFormField extends FormField<List<ComorbidityEntity>> {
  ComorbiditiesFormField({
    super.key,
    required List<ComorbidityEntity> comorbidities,
    super.onSaved,
    List<ComorbidityEntity>? initialValue,
  }) : super(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, selecione pelo menos uma comorbidade';
            }
            return null;
          },
          initialValue: initialValue ?? [],
          builder: (FormFieldState<List<ComorbidityEntity>> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    final selectedValues =
                        await showDialog<List<ComorbidityEntity>>(
                      context: state.context,
                      builder: (BuildContext context) {
                        return ComorbiditiesDialog(
                          comorbidities: comorbidities,
                          selectedComorbidities: state.value ?? [],
                        );
                      },
                    );
                    if (selectedValues != null) {
                      state.didChange(selectedValues);
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        color: AppColors.neutral500,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: AppColors.slate200,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: AppColors.slate200,
                          width: 2,
                        ),
                      ),
                      errorText: state.errorText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: AppColors.slate200,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                    isEmpty: state.value == null || state.value!.isEmpty,
                    child: Text(
                      state.value!.isEmpty
                          ? 'Selecione'
                          : state.value!.map((e) => e.name).join(", "),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            );
          },
        );
}

class ComorbiditiesDialog extends StatefulWidget {
  final List<ComorbidityEntity> comorbidities;
  final List<ComorbidityEntity> selectedComorbidities;

  const ComorbiditiesDialog({
    super.key,
    required this.comorbidities,
    required this.selectedComorbidities,
  });

  @override
  _ComorbiditiesDialogState createState() => _ComorbiditiesDialogState();
}

class _ComorbiditiesDialogState extends State<ComorbiditiesDialog> {
  late List<ComorbidityEntity> _tempSelectedComorbidities;
  late List<ComorbidityEntity> reorderedList;

  @override
  void initState() {
    super.initState();
    _tempSelectedComorbidities = List.from(widget.selectedComorbidities);
    reorderedList = List.from(widget.comorbidities);
    reorderList(reorderedList);
  }

  void reorderList(List<ComorbidityEntity> comorbidities) {
    ComorbidityEntity? comorbidityWithId1;
    for (var comorbidity in comorbidities) {
      if (comorbidity.id == 0) {
        comorbidityWithId1 = comorbidity;
        break;
      }
    }
    if (comorbidityWithId1 != null) {
      comorbidities.remove(comorbidityWithId1);
      comorbidities.insert(0, comorbidityWithId1);
    }
  }

  void _onComorbiditySelected(ComorbidityEntity comorbidity) {
    setState(() {
      if (comorbidity.id == 0) {
        _tempSelectedComorbidities = [comorbidity];
      } else {
        _tempSelectedComorbidities.removeWhere((element) => element.id == 0);
        if (_tempSelectedComorbidities.contains(comorbidity)) {
          _tempSelectedComorbidities.remove(comorbidity);
        } else if (_tempSelectedComorbidities.length < 23) {
          _tempSelectedComorbidities.add(comorbidity);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.neutral300,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: AppColors.neutral300,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(
                            color: AppColors.red600,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    TextButton(
                        onPressed: () => Navigator.of(context)
                            .pop(_tempSelectedComorbidities),
                        child: const Text(
                          "Confirmar",
                          style: TextStyle(
                            color: AppColors.blue500,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Selecione a(s) comorbidade(s)',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.neutral800,
                      fontSize: 16.0),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),


          const Divider(height: 1, thickness: 1, color: AppColors.neutral400),


          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...reorderedList.map((comorbidity) {
                    bool isSelected =
                    _tempSelectedComorbidities.contains(comorbidity);
                    return Flex(
                      direction: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            tileColor: AppColors.neutral50,
                            onTap: () => _onComorbiditySelected(comorbidity),
                            title: Row(
                              children: [
                                Icon(Icons.check,
                                    color: isSelected
                                        ? AppColors.blue500
                                        : Colors.transparent),
                                Expanded(
                                  child: Text(
                                    comorbidity.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: isSelected
                                          ? AppColors.blue500
                                          : AppColors.neutral800,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
