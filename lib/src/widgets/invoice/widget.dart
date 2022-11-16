import 'package:flutter/material.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/report_config_entity.dart';
import '../custom_text_field.dart';

class MultiChoiceReportColumnConfigSelection extends StatelessWidget {
  final List<ReportFieldConfigEntity> options;
  final List<ReportFieldConfigEntity> selectedOptions;
  final void Function(ReportFieldConfigEntity) onSelect;
  final void Function(ReportFieldConfigEntity) onDeselect;
  final void Function(ReportFieldConfigEntity) onUpdateOption;
  final String label;
  const MultiChoiceReportColumnConfigSelection(
      {Key? key,
      required this.options,
      this.selectedOptions = const [],
      required this.onSelect,
      required this.onDeselect,
      required this.onUpdateOption,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(label,
              style:
                  const TextStyle(fontSize: 14, color: AppColor.formInputText)),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.subtitleColorPrimary),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: selectedOptions
                      .map(
                        (e) => Draggable<ReportFieldConfigEntity>(
                          data: e,
                          feedback: Material(
                            child: SettingChoiceChip(
                              columnConfig: e,
                              onActionTap: () {

                              },
                              onUpdateOption: (val) {},
                            ),
                          ),
                          child: SettingChoiceChip(
                            columnConfig: e,
                            onActionTap: () {
                              onDeselect(e);
                            },
                            onUpdateOption: onUpdateOption,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: options
                      .map(
                        (e) => SettingChoiceChip(
                          canOpen: false,
                          columnConfig: e,
                          onUpdateOption: onUpdateOption,
                          onActionTap: () {
                            onSelect(e);
                          },
                          actionIcon: const Icon(
                            Icons.add,
                            size: 16,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SettingChoiceChip extends StatefulWidget {
  final ReportFieldConfigEntity columnConfig;
  final bool selected;
  final bool canOpen;
  final void Function()? onActionTap;
  final Widget? actionIcon;
  final void Function(ReportFieldConfigEntity) onUpdateOption;
  const SettingChoiceChip(
      {Key? key,
      required this.columnConfig,
      this.canOpen = true,
      this.selected = false,
      this.onActionTap,
      this.actionIcon,
      required this.onUpdateOption})
      : super(key: key);

  @override
  State<SettingChoiceChip> createState() => _SettingChoiceChipState();
}

class _SettingChoiceChipState extends State<SettingChoiceChip> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.canOpen
          ? () {
              setState(() {
                _open = !_open;
              });
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.subtitleColorPrimary),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.columnConfig.toString()),
                const SizedBox(
                  width: 12,
                ),
                if (widget.onActionTap != null)
                  InkWell(
                    onTap: widget.onActionTap,
                    child: widget.actionIcon ??
                        const Icon(
                          Icons.close,
                          size: 16,
                        ),
                  ),
              ],
            ),
            if (_open)
              SettingChoiceConfig(
                config: widget.columnConfig,
                onUpdateOption: widget.onUpdateOption,
              ),
          ],
        ),
      ),
    );
  }
}

class SettingChoiceConfig extends StatelessWidget {
  final ReportFieldConfigEntity config;
  final void Function(ReportFieldConfigEntity) onUpdateOption;
  const SettingChoiceConfig(
      {Key? key, required this.config, required this.onUpdateOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: Colors.grey.shade500)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomTextField(
                  label: 'Label',
                  minLines: 1,
                  maxLines: 4,
                  initialValue: config.title,
                  onValueChange: (value) {
                    config.title = value;
                    onUpdateOption(config);
                  },
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: CustomTextField(
                  label: 'Default Value',
                  minLines: 1,
                  maxLines: 4,
                  labelAlign: TextAlign.end,
                  initialValue: config.defaultValue ?? '',
                  onValueChange: (value) {
                    config.defaultValue = value;
                    onUpdateOption(config);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      onUpdateOption(
                          config.copyWith(align: ColumnAlignment.left));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: config.align == ColumnAlignment.left
                            ? Border.all(color: Colors.grey.shade500)
                            : const Border(),
                      ),
                      child: const Icon(Icons.format_align_left),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onUpdateOption(
                          config.copyWith(align: ColumnAlignment.center));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: config.align == ColumnAlignment.center
                            ? Border.all(color: Colors.grey.shade500)
                            : const Border(),
                      ),
                      child: const Icon(Icons.format_align_center),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onUpdateOption(
                          config.copyWith(align: ColumnAlignment.right));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: config.align == ColumnAlignment.right
                            ? Border.all(color: Colors.grey.shade500)
                            : const Border(),
                      ),
                      child: const Icon(Icons.format_align_right),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onUpdateOption(
                          config.copyWith(align: ColumnAlignment.justify));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: config.align == ColumnAlignment.justify
                            ? Border.all(color: Colors.grey.shade500)
                            : const Border(),
                      ),
                      child: const Icon(Icons.format_align_justify),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: config.align == ColumnAlignment.right
                            ? Border.all(color: Colors.grey.shade500)
                            : const Border(),
                      ),
                      child: const Icon(Icons.format_bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: config.align == ColumnAlignment.right
                            ? Border.all(color: Colors.grey.shade500)
                            : const Border(),
                      ),
                      child: const Icon(Icons.format_italic),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: config.align == ColumnAlignment.right
                            ? Border.all(color: Colors.grey.shade500)
                            : const Border(),
                      ),
                      child: const Icon(Icons.format_underline),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
