class Car {
  // Properties
  String brand;
  String model;
  int year;
  double milesDriven;

  // Static property to keep track of the number of Car objects
  static int numberOfCars = 0;

  // Constructor
  Car(this.brand, this.model, this.year, this.milesDriven) {
    // Increment the number of Car objects created
    numberOfCars++;
  }

  // Methods
  void drive(double miles) {
    milesDriven += miles;
  }

  double getMilesDriven() {
    return milesDriven;
  }

  String getBrand() {
    return brand;
  }

  String getModel() {
    return model;
  }

  int getYear() {
    return year;
  }

  int getAge() {
    DateTime now = DateTime.now();
    return now.year - year;
  }
}

void main() {
  // Creating Car objects
  Car car1 = Car('Toyota', 'Corolla', 2010, 50000);
  Car car2 = Car('Ford', 'Mustang', 2015, 30000);
  Car car3 = Car('Tesla', 'Model S', 2018, 10000);

  // Driving each car a different number of miles
  car1.drive(150);
  car2.drive(200);
  car3.drive(50);

  // Printing out the brand, model, year, and miles driven for each car
  print(
      'Car 1: ${car1.getBrand()} ${car1.getModel()}, Year: ${car1.getYear()}, Miles Driven: ${car1.getMilesDriven()}, Age: ${car1.getAge()} years');
  print(
      'Car 2: ${car2.getBrand()} ${car2.getModel()}, Year: ${car2.getYear()}, Miles Driven: ${car2.getMilesDriven()}, Age: ${car2.getAge()} years');
  print(
      'Car 3: ${car3.getBrand()} ${car3.getModel()}, Year: ${car3.getYear()}, Miles Driven: ${car3.getMilesDriven()}, Age: ${car3.getAge()} years');

  // Printing out the total number of Car objects created
  print('Total number of Car objects created: ${Car.numberOfCars}');
}
