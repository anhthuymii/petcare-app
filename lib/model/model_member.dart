class ProductDataModel {
  String? id;
  String? name;
  String? type;
  String? breed;
  String? sex;
  String? descs;
  String? age;
  String? weight;
  String? image;


  ProductDataModel(
      {this.id,
        this.name,
        this.type,
       this.breed,
        this.sex,
        this.descs,
        this.age,
        this.weight,
        this.image,


       });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
        id : json['id'],
        name: json['name'],
        type: json['type'],
        breed: json['breed'],
        sex: json['sex'],
        descs: json['descs'],
        age: json['age'],
        weight: json['weight'],
        image : json['image'],



    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "type": type,
      "breed": breed,
      "sex": sex,
      "descs": descs,
      "age": age,
      "weight": weight,
     // "image": image,
    };
  }
  Map<String, dynamic> toJsonupdate() {
    return {
      "id" :id,
      "name": name,
      "type": type,
      "breed": breed,
      "sex": sex,
      "descs": descs,
      "age": age,
      "weight": weight,
      "image":image,
      // "image": image,
    };
  }
}
