import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vmenu_reports/Fonts.dart';

class InformationRow extends StatelessWidget {
  const InformationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1,
      runSpacing: 1,
      children: <Widget>[
        _InformationBox(
          icon: Icon(LineIcons.rocket),
          backgroundColor: Colors.orange.withOpacity(0.1),
          number: 21343,
          haveIncreased: true,
          percent: 3.9,
          text: 'Total Installation',
          showPercent: true,
        ),
        _InformationBox(
          icon: Icon(LineIcons.facebookMessenger),
          backgroundColor: Colors.purpleAccent.withOpacity(0.8),
          number: 22424,
          haveIncreased: true,
          percent: 3.9,
          text: 'Total Active Users',
        ),
        _InformationBox(
          icon: Icon(LineIcons.userAlt),
          backgroundColor: Colors.lightBlue.withOpacity(0.1),
          number: 353,
          haveIncreased: true,
          percent: 3.9,
          text: 'New Users',
        ),
        _InformationBox(
          icon: Icon(LineIcons.bell),
          backgroundColor: Colors.yellow.withOpacity(0.2),
          number: 34,
          showPercent: true,
          haveIncreased: true,
          percent: 3.9,
          text: 'Retention Rate',
        ),
      ],
    );
  }
}

class _InformationBox extends StatelessWidget {
  const _InformationBox({
    required this.icon,
    required this.backgroundColor,
    required this.number,
    required this.percent,
    required this.text,
    required this.haveIncreased,
    this.showPercent = false,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final Color backgroundColor;

  final int number;

  final bool showPercent;

  final double percent;

  final bool haveIncreased;

  final String text;

  String _formatNumber(int number) {
    if (number.toString().length >= 10) {
      return NumberFormat.compact().format(number);
    } else {
      return NumberFormat.decimalPattern().format(number).replaceAll(',', ' ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height:200,
      padding: const EdgeInsets.only(top: 22, bottom: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 24,
            backgroundColor: backgroundColor,
            child: icon,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                showPercent ? number.toString() + '%' : _formatNumber(number),
                style: TextStyle(),
              ),
              const SizedBox(width: 5),
              Icon(
                haveIncreased ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 20,
                color: haveIncreased ? Colors.green : Colors.red,
              ),
              Text(
                percent.toString() + '%',
                style: haveIncreased
                    ? TextStyle(color: Colors.green)
                    // TextStyles.myriadProSemiBold12Green
                    : TextStyle(color: Colors.red)
                    // TextStyles.myriadProSemiBold12Red,
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(text, style:TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
