import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_dashboard_project_management/app/constants/app_constants.dart';

class SelectionButtonData {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  final int? totalNotif;

  SelectionButtonData({
    required this.activeIcon,
    required this.icon,
    required this.label,
    this.totalNotif,
  });
}

class SelectionButton extends StatefulWidget {
  const SelectionButton(
      {this.initialSelected = 0,
      required this.data,
      required this.onSelected,
      Key? key})
      : super(key: key);

  final int initialSelected;
  final List<SelectionButtonData> data;
  final Function(int index, SelectionButtonData value) onSelected;

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  late int selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.data.asMap().entries.map((e) {
        final index = e.key;
        final data = e.value;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _Button(
            selected: selected == index,
            data: data,
            onPressed: () {
              widget.onSelected(index, data);
              setState(() => selected = index);
            },
          ),
        );
      }).toList(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
      {required this.selected,
      required this.data,
      required this.onPressed,
      Key? key})
      : super(key: key);

  final bool selected;
  final SelectionButtonData data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: Row(
            children: [
              _icon((!selected) ? data.icon : data.activeIcon),
              const SizedBox(width: kSpacing / 2),
              Expanded(child: _labelText(data.label)),
              if (data.totalNotif != null)
                Padding(
                  padding: const EdgeInsets.only(left: kSpacing / 2),
                  child: _notif(data.totalNotif!),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon(IconData iconData) {
    return Icon(
      iconData,
      size: 40,
      color: !selected
          ? kFontColorPallets[1]
          : Theme.of(Get.context!).primaryColor,
    );
  }

  Widget _labelText(String data) {
    return Text(
      data,
      style: TextStyle(
        color: (!selected)
            ? kFontColorPallets[1]
            : Theme.of(Get.context!).primaryColor,
        fontWeight: FontWeight.w600,
        letterSpacing: .8,
        fontSize: 20,
      ),
    );
  }

  Widget _notif(int total) {
    return (total <= 0)
        ? Container()
        : Container(
            width: 30,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kNotifColor,
            ),
            alignment: Alignment.center,
            child: Text(
              (total > 99) ? '99+' : '$total',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}
