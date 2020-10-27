class CreateVehicleDto {
  String model;
  String licensePlate;
  String colorExterior;
  String mainPicture;
  List<String> pictures;
  String year;
  String alias;
  String bodyStyle;

  CreateVehicleDto({
    this.model,
    this.licensePlate,
    this.alias,
    this.bodyStyle,
    this.colorExterior,
    this.mainPicture,
    this.pictures,
    this.year,
  });
}
