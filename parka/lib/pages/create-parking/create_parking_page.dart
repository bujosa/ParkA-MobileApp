import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/controllers/create-parking-form/create_parking_form_controller.dart';
import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';
import 'package:ParkA/data/use-cases/feature/feature_use_cases.dart';
import 'package:ParkA/pages/create-parking/steps/parking_position_selector_page.dart';
import 'package:ParkA/pages/create-vehicle/components/parka-input/parka_input.dart';
import 'package:ParkA/pages/filter/components/featureFilterWidget/feature_filter_widget.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'components/stepper_widget.dart';

class CreateParkingPage extends StatefulWidget {
  static String routeName = 'create-parking-page';

  @override
  _CreateParkingPageState createState() => _CreateParkingPageState();
}

class _CreateParkingPageState extends State<CreateParkingPage> {
  final createParkingFormController = Get.put(CreateParkingFormController());

  List<Feature> features;
  bool _loadingData;

  void getFormData() async {
    this.features = await FeatureUseCases.getAllFeatures();

    setState(() {
      this._loadingData = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this._loadingData = true;
    getFormData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          color: ParkaColors.parkaGreen,
          inAsyncCall: this._loadingData,
          child: this._loadingData
              ? Container()
              : Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: ParkaHeader(
                          color: Colors.white,
                          leading: TransparentButton(
                            label: "Atras",
                            buttonTextStyle: kParkaInputDefaultSyle,
                            color: Colors.white,
                            leadingIconData: Icons.keyboard_arrow_left,
                            onTapHandler: () {
                              Get.find<CreateParkingFormController>()
                                  .decrement();
                              Get.back();
                            },
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: ParkaColors.parkaGreen,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 24.0,
                              horizontal: 16.0,
                            ),
                            child: AutoSizeText(
                              "Hablanos sobre tu parqueo",
                              maxLines: 1,
                              style: kParkaPageTitleTextStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 36.0),
                            child: Column(
                              children: [
                                ParkaEditInput(
                                  type: ParkaInputType.textField,
                                  label: "Nombre del parqueo",
                                ),
                                ParkaEditInput(
                                  type: ParkaInputType.textField,
                                  label: "Numero de parqueos",
                                ),
                                ParkaEditInput(
                                  type: ParkaInputType.textField,
                                  label: "Precio por hora",
                                ),
                                ParkaEditInput(
                                  type: ParkaInputType.textField,
                                  label: "Detalles adicionales",
                                ),
                                ExpansionTile(
                                  title: Text(
                                    "Caracteristicas",
                                    style: TextStyle(
                                        color: Color(0xFF0B768C),
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FeatureTab(),
                                        FeatureTab(),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: ParkaStepperWidget(
                        stepsNumber: 3,
                        onTapHandler: () {
                          Get.find<CreateParkingFormController>().increment();
                          Get.toNamed(ParkingPositionSelectorPage.routeName);
                        },
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class FeatureTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      color: Colors.red,
      height: 100,
      width: 100,
      child: Column(),
    );
  }
}
