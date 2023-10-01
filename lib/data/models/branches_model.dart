
class Branch {
  String address;
  String phoneNumber;

  Branch({
    this.address = "",
    this.phoneNumber = "",
  });

  factory Branch.fromMap(Map<String, dynamic> map) {
    return Branch(
      address: map['address'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  static Map<String, dynamic> toMap(Branch restaurantDetails) => {
    "address": restaurantDetails.address,
    "imageUrl": restaurantDetails.phoneNumber,
  };

  static List<Map<String, dynamic>> encode(List<Branch> categoryList) =>
      categoryList.map<Map<String, dynamic>>((category) => Branch.toMap(category)).toList();

  static List<Branch> decode(List<Map<String, dynamic>> categoryMap) =>
      categoryMap.map<Branch>((item) => Branch.fromMap(item)).toList();
}