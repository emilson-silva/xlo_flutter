class Address {
  Address({
    this.postalCode,
    this.city,
    this.district,
    this.federativeUnit,
    this.place,
  });

  String place;
  String district;
  String city;
  String postalCode;
  String federativeUnit;

  @override
  String toString() {
    return '$place, $district, $city, $postalCode, $federativeUnit';
  }
}
