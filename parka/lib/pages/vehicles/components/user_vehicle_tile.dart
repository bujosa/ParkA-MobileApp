import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:flutter/material.dart';

class VehicleTile extends StatelessWidget {
  final Vehicle vehicle;
  final Function onTapHandler;

  const VehicleTile({
    Key key,
    this.vehicle,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0),
      child: GestureDetector(
        onTap: this.onTapHandler,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(this.vehicle.mainPicture),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3.0, 14.0),
                        color: Colors.black38,
                        blurRadius: 5.0,
                      ),
                    ]),
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        height: 50,
                        child: Text(
                          this.vehicle.model.make.name,
                          style: TextStyle(
                              color: Color(0xFF077187),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        height: 40,
                        child: Text(
                          this.vehicle.model.name,
                          style: TextStyle(
                              color: Color(0xFF077187),
                              fontFamily: "Montserrat",
                              fontSize: 26),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        height: 30,
                        child: Text(
                          this.vehicle.licensePlate.toUpperCase(),
                          style: TextStyle(
                              color: Color(0xFF077187),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                      ),
                    ),
                    SizedBox(width: 30.0),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        height: 30,
                        child: Text(
                          "${this.vehicle.year}",
                          style: TextStyle(
                              color: Color(0xFF077187),
                              fontFamily: "Montserrat",
                              fontSize: 26),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
                child: Divider(
                  color: Color(0xFFA9A5A5),
                  thickness: 1.6,
                  endIndent: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
