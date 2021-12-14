import 'package:budget_tracker/json/day_month.dart';
import 'package:budget_tracker/theme/colors.dart';
import 'package:budget_tracker/widget/chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int activeMonth = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [_getBoxShadow()],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, bottom: 25, left: 20, right: 20),
              child: Column(
                children: [
                  _buildTitle(),
                  const SizedBox(height: 20),
                  _buildMonths(size.width),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildStatsBody(size.width),
          const SizedBox(height: 20),
          _buildCards(size.width),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Stats',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
          Icon(Icons.search),
        ],
      ),
    );
  }

  Widget _buildMonths(double sizeWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        months.length,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                activeMonth = index;
              });
            },
            child: Column(
              children: [
                Text(
                  months[index]['label'],
                  style: const TextStyle(fontSize: 10),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: activeMonth == index ? primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: activeMonth == index
                          ? primary
                          : black.withOpacity(0.1),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 7, bottom: 7, right: 12, left: 12),
                    child: Text(
                      months[index]['month'],
                      style: TextStyle(
                        fontSize: 10,
                        color: activeMonth == index ? white : black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatsBody(double sizeWidth) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [_getBoxShadow()]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Net balance',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: black.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '\$2446.90',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: sizeWidth - 20,
                  height: 150,
                  child: LineChart(mainData()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCards(double sizeWidth) {
    List expenses = [
      {
        "icon": Icons.arrow_back,
        "color": blue,
        "label": "Income",
        "cost": "\$6593.75"
      },
      {
        "icon": Icons.arrow_forward,
        "color": red,
        "label": "Expense",
        "cost": "\$2445.50"
      }
    ];

    return Wrap(
      spacing: 20,
      children: List.generate(
        expenses.length,
        (index) {
          return Container(
            width: (sizeWidth - 60) / 2,
            height: 170,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [_getBoxShadow()],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: expenses[index]['color'],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        expenses[index]['icon'], //Icons.arrow_back,
                        color: white,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expenses[index]['label'],
                        style: TextStyle(
                            fontSize: 13, color: black.withOpacity(0.5)),
                      ),
                      Text(
                        expenses[index]['cost'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BoxShadow _getBoxShadow() =>
      BoxShadow(color: grey.withOpacity(0.01), spreadRadius: 10, blurRadius: 3);
}
