// ...existing code...
enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address({
    required this.street,
    required this.city,
    required this.zipCode,
  });
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final int _yearOfExperience;
  final Address _address;

  Employee(
    this._name,
    this._baseSalary, {
    List<Skill> skills = const [Skill.OTHER],
    int yearOfExperience = 0,
    Address address = const Address(
      street: 'Unknown',
      city: 'Unknown',
      zipCode: '00000',
    ),
  }) : _skills = skills,
       _yearOfExperience = yearOfExperience,
       _address = address;

  Employee.mobileDeveloper(
    String name,
    double baseSalary, {
    int yearOfExperience = 0,
    Address address = const Address(
      street: 'Unknown',
      city: 'Unknown',
      zipCode: '00000',
    ),
  }) : this(
         name,
         baseSalary,
         skills: const [Skill.FLUTTER, Skill.DART],
         yearOfExperience: yearOfExperience,
         address: address,
       );

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  int get yearsOfExperience => _yearOfExperience;
  Address get address => _address;

  double computeSalary() {
    double salary = _baseSalary;
    salary += _yearOfExperience * 2000;
    for (var s in _skills) {
      switch (s) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }

  void printDetails() {
    // For this part i use AI generated code
    final skillsStr = _skills
        .map((s) => s.toString().split('.').last)
        .join(', ');
    print(
      'Employee: $_name, Base Salary: \$${_baseSalary.toStringAsFixed(2)}, Skills: $skillsStr, Experience: ${_yearOfExperience} years, Address: ${_address.street}, ${_address.city} ${_address.zipCode}',
    );
    print('Computed Total Salary: \$${computeSalary().toStringAsFixed(2)}');
  }
}

void main() {
  var emp1 = Employee('Sokea', 40000);
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper(
    'Ronan',
    45000,
    yearOfExperience: 10,
    address: const Address(street: '6A', city: 'Phnom Penh', zipCode: '121001'),
  );
  emp2.printDetails();
}
