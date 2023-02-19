import 'package:app/logic/bloc/all_tockets/all_ticket_bloc.dart';
import 'package:app/presentation/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/first_heading_text.dart';

class TicketDetailsPage extends StatefulWidget {
  const TicketDetailsPage({super.key});

  @override
  State<TicketDetailsPage> createState() => _TicketDetailsPageState();
}

class _TicketDetailsPageState extends State<TicketDetailsPage> {
  int index = 0;
  bool isTotal = true;

  @override
  void initState() {
    BlocProvider.of<AllTicketBloc>(context).add(AllTicketFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: const Icon(
            Icons.menu,
            color: AppColor.white,
          ),
          actions: const [
            Icon(
              Icons.notifications_active,
              color: AppColor.white,
            ),
            SizedBox(
              width: 20,
            )
          ],
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          title: const FirstHeading(
            text: "Home",
            size: 24,
            textColor: AppColor.white,
            fontWeight: FontWeight.w600,
          )),
      body: BlocBuilder<AllTicketBloc, AllTicketState>(
        builder: (context, state) {
          if (state is AllTicketLoadedState) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const FirstHeading(
                          text: "Ticket Details",
                          size: 20,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              color: isTotal
                                  ? Colors.black
                                  : const Color.fromARGB(255, 156, 155, 155),
                              icon: const Icon(Icons.menu),
                              onPressed: () {
                                setState(() {
                                  isTotal = true;
                                });
                              },
                            ),
                            IconButton(
                              color: isTotal
                                  ? const Color.fromARGB(255, 156, 155, 155)
                                  : Colors.black,
                              icon: const Icon(Icons.signal_cellular_alt),
                              onPressed: () {
                                setState(() {
                                  isTotal = false;
                                });
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  selectedButton(width),
                  const SizedBox(
                    height: 10,
                  ),
                  isTotal
                      ? gridView(height, width, state, index)
                      : ticketStatus(state, index),
                ],
              ),
            );
          } else if (state is AllTicketLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is AllTicketErrorState) {
            return Text(state.error);
          } else {
            return const Text("An Error");
          }
        },
      ),
    );
  }

  Container selectedButton(double width) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 188, 188, 188),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                index = 0;
              });
            },
            child: Container(
                width: width * 0.2,
                height: 50,
                decoration: BoxDecoration(
                  color: index == 0 ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: FirstHeading(
                    text: "Day",
                    size: 20,
                    fontWeight: FontWeight.w600,
                    textColor: index == 0 ? Colors.white : Colors.black,
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 1;
              });
            },
            child: Container(
              width: width * 0.2,
              height: 50,
              decoration: BoxDecoration(
                color: index == 1 ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: FirstHeading(
                  text: "Week",
                  size: 20,
                  fontWeight: FontWeight.w600,
                  textColor: index == 1 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 2;
              });
            },
            child: Container(
              width: width * 0.2,
              height: 50,
              decoration: BoxDecoration(
                color: index == 2 ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: FirstHeading(
                  text: "Month",
                  size: 20,
                  fontWeight: FontWeight.w600,
                  textColor: index == 2 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 3;
              });
            },
            child: Container(
              width: width * 0.2,
              height: 50,
              decoration: BoxDecoration(
                color: index == 3 ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: FirstHeading(
                  text: "Year",
                  size: 20,
                  fontWeight: FontWeight.w600,
                  textColor: index == 3 ? Colors.white : Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  dynamic getState(int button, var state, index) {
    switch (button) {
      case 0:
        return state.dist.day[index];
      case 1:
        return state.dist.week[index];
      case 2:
        return state.dist.month[index];
      case 3:
        return state.dist.year[index];

      default:
        return state.dist.day[index];
    }
  }

  SizedBox gridView(double height, double width, var state, int buttonIndex) {
    return SizedBox(
      height: height * 0.7,
      child: GridView.count(
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children: List.generate(5, (index) {
            var days = getState(buttonIndex, state, index);
            return Container(
              height: 100,
              width: width * 0.40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColor.primaryColor,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.airplane_ticket,
                    size: 30,
                    color: AppColor.primaryColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FirstHeading(
                    text: days.label,
                    size: 20,
                    textColor: AppColor.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FirstHeading(
                    text: days.value.toString(),
                    size: 25,
                    textColor: AppColor.amberAccent,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            );
          })),
    );
  }

  dynamic getStateforChart(int button, var state, index) {
    switch (button) {
      case 0:
        return state.dist.day[index];
      case 1:
        return state.dist.week[index];
      case 2:
        return state.dist.month[index];
      case 3:
        return state.dist.year[index];

      default:
        return state.dist.day[index];
    }
  }

  Column ticketStatus(var state, int index) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BarChart(BarChartData(groupsSpace: 5, barGroups: [
              BarChartGroupData(x: 6, barRods: [
                BarChartRodData(
                    fromY: 0,
                    toY: double.tryParse(
                            getStateforChart(index, state, 0).value) ??
                        0,
                    width: 45,
                    color: Colors.amberAccent),
                BarChartRodData(
                    fromY: 0,
                    toY: double.tryParse(
                            getStateforChart(index, state, 1).value) ??
                        0,
                    width: 45,
                    color: Colors.red),
              ]),
              BarChartGroupData(x: 7, barRods: [
                BarChartRodData(
                    fromY: 0,
                    toY: double.tryParse(
                            getStateforChart(index, state, 2).value) ??
                        0,
                    width: 45,
                    color: Colors.green),
              ]),
              BarChartGroupData(x: 8, barRods: [
                BarChartRodData(
                    fromY: 0,
                    toY: double.tryParse(
                            getStateforChart(index, state, 3).value) ??
                        0,
                    width: 45,
                    color: Colors.blue),
              ]),
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(
                    fromY: 0,
                    toY: double.tryParse(
                            getStateforChart(index, state, 4).value) ??
                        0,
                    width: 45,
                    color: Colors.black),
              ]),
            ])),
          ),
        ),
        Column(
          children: const [
            FirstHeading(
              text: "Total Tickets",
              size: 20,
              fontWeight: FontWeight.w500,
              textColor: Colors.amberAccent,
            ),
            FirstHeading(
              text: "Unassigned tickets",
              size: 20,
              fontWeight: FontWeight.w500,
              textColor: Colors.red,
            ),
            FirstHeading(
              text: "Assigned tickets",
              size: 20,
              fontWeight: FontWeight.w500,
              textColor: Colors.green,
            ),
            FirstHeading(
              text: "In Progress tickets",
              size: 20,
              fontWeight: FontWeight.w500,
              textColor: Colors.blue,
            ),
            FirstHeading(
              text: "Closed tickets",
              size: 20,
              fontWeight: FontWeight.w500,
              textColor: Colors.black,
            ),
          ],
        )
      ],
    );
  }
}
