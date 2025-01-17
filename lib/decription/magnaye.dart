import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:pili_variety_classification/screens/result_description.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';
import 'package:pili_variety_classification/utils/app_text_styles.dart';
import 'package:pili_variety_classification/widgets/result_circle_avatar.dart';
import 'package:pili_variety_classification/widgets/sub_section.dart';

class MagnayeDescription extends StatelessWidget {
  const MagnayeDescription({
    super.key,
    required this.width,
    required this.widget,
    required this.input,
  });

  final double width;
  final ResultDescriptionScreen widget;
  final String input;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              width: width * 1,
              color: secondarybgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ResultCircleAvatar(
                    height: height,
                    imgPath: (input == 'MPF')
                        ? 'assets/imgs/magnaye.png'
                        : 'assets/imgs/magnaye_shell.png',
                  ),
                  Text(
                    widget.label!,
                    style: t1(),
                  ),
                  Text(
                    "NSIC Registration No: NSIC 1999-PI-02",
                    style: t2(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              width: width * 1,
              color: secondarybgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SubSection(
                    iconData: Icons.description_outlined,
                    sectionTitle: 'Description',
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "This variety is relatively short with spreading canopy, high yielding, produces large fruits.",
                    style: h2(fontBold: false),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              width: width * 1,
              color: secondarybgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SubSection(
                    iconData: Icons.eco_outlined,
                    sectionTitle: 'Characteristics',
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: primarybgColor,
                        borderRadius: BorderRadius.circular(13)),
                    width: width * 1,
                    height: height * 0.33,
                    child: ContainedTabBarView(
                      tabBarProperties: const TabBarProperties(
                        indicatorColor: white,
                        labelColor: white,
                      ),
                      tabs: [
                        Text('Tree', style: proximaNova()),
                        Text('Fruit', style: proximaNova()),
                        Text('Pulp', style: proximaNova()),
                        Text('Shell', style: proximaNova()),
                        Text('Kernel', style: proximaNova()),
                      ],
                      views: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                charContent(
                                    c1: 'Planting Years', c2: '16 years'),
                                const Divider(color: white),
                                charContent(c1: 'Height', c2: '7.5 m'),
                                const Divider(color: white),
                                charContent(
                                    c1: 'Fruiting Season',
                                    c2: 'July-September'),
                                const Divider(color: white),
                                charContent(c1: 'Yield', c2: '18.61 kg'),
                                const Divider(color: white),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                charContent(c1: 'Weight', c2: '39.49 g'),
                                const Divider(color: white),
                                charContent(c1: 'Length', c2: '62.93 mm'),
                                const Divider(color: white),
                                charContent(c1: 'Width', c2: '32.16 mm'),
                                const Divider(color: white),
                                charContent(c1: 'Fruit Shape', c2: 'Oblong'),
                                const Divider(color: white),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                charContent(c1: 'Color', c2: 'Black'),
                                const Divider(color: white),
                                charContent(c1: 'Weight', c2: '25.44 mm'),
                                const Divider(color: white),
                                charContent(c1: 'Thickness', c2: '4 mm'),
                                const Divider(color: white),
                                charContent(
                                    c1: '% Based on Fruit Weight', c2: 'N/A'),
                                const Divider(color: white),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                charContent(c1: 'Weight', c2: 'N/A'),
                                const Divider(color: white),
                                charContent(c1: 'Thickness', c2: 'N/A'),
                                const Divider(color: white),
                                charContent(
                                    c1: '% Based on Fruit Weight', c2: 'N/A'),
                                const Divider(color: white),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                charContent(c1: 'Weight', c2: '3.35 g'),
                                const Divider(color: white),
                                charContent(c1: 'Color', c2: 'white'),
                                const Divider(color: white),
                                charContent(
                                    c1: '% Based on Fruit Weight', c2: 'N/A'),
                                const Divider(color: white),
                              ],
                            ),
                          ),
                        ),
                      ],
                      onChange: (index) => print(index),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row charContent({required String c1, required String c2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          c1,
          style: h2(fontBold: false),
        ),
        Text(
          c2,
          style: h2(fontBold: true),
        )
      ],
    );
  }
}
