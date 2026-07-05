import "dart:io";

class Employee {
  String employeeId;
  String employeeName;
  String department;

  Employee(this.employeeId, this.employeeName, this.department);

  void displayEmployeeInfo() {
    print("\nEmployee ID : $employeeId");
    print("Name        : $employeeName");
    print("Department  : $department");
  }
}

class Payroll extends Employee {
  double basicSalary;
  double hra;
  double da;
  double bonus;

  Payroll(
    String employeeId,
    String employeeName,
    String department,
    this.basicSalary,
    this.hra,
    this.da,
    this.bonus,
  ) : super(employeeId, employeeName, department);

  double calculateGrossSalary() {
    return basicSalary + hra + da + bonus;
  }

  double calculateTax() {
    double grossSalary = calculateGrossSalary();

    if (grossSalary > 80000) {
      return grossSalary * 0.20;
    } else if (grossSalary > 50000) {
      return grossSalary * 0.10;
    } else {
      return 0;
    }
  }

  double calculateNetSalary() {
    return calculateGrossSalary() - calculateTax();
  }

  void displaySalarySlip() {
    print("\n==========================================");
    print("         EMPLOYEE SALARY SLIP");
    print("==========================================");

    displayEmployeeInfo();

    print("\nBasic Salary : ₹$basicSalary");
    print("HRA          : ₹$hra");
    print("DA           : ₹$da");
    print("Bonus        : ₹$bonus");

    print("\nGross Salary : ₹${calculateGrossSalary()}");
    print("Tax          : ₹${calculateTax()}");
    print("Net Salary   : ₹${calculateNetSalary()}");

    print("==========================================");
  }
}

class Manager extends Payroll {
  double performanceIncentive;

  Manager(
    String employeeId,
    String employeeName,
    String department,
    double basicSalary,
    double hra,
    double da,
    double bonus,
    this.performanceIncentive,
  ) : super(
          employeeId,
          employeeName,
          department,
          basicSalary,
          hra,
          da,
          bonus,
        );

  @override
  double calculateGrossSalary() {
    return basicSalary + hra + da + bonus + performanceIncentive;
  }

  @override
  void displaySalarySlip() {
    print("\n==========================================");
    print("          MANAGER SALARY SLIP");
    print("==========================================");

    displayEmployeeInfo();

    print("\nBasic Salary          : ₹$basicSalary");
    print("HRA                   : ₹$hra");
    print("DA                    : ₹$da");
    print("Bonus                 : ₹$bonus");
    print("Performance Incentive : ₹$performanceIncentive");

    print("\nGross Salary : ₹${calculateGrossSalary()}");
    print("Tax          : ₹${calculateTax()}");
    print("Net Salary   : ₹${calculateNetSalary()}");

    print("==========================================");
  }
}

void main() {
  print("Enter Employee ID: ");
  String employeeId = stdin.readLineSync()!;

  print("Enter Employee Name: ");
  String employeeName = stdin.readLineSync()!;

  print("Enter Department: ");
  String department = stdin.readLineSync()!;

  print("Enter Basic Salary: ");
  double basicSalary = double.parse(stdin.readLineSync()!);

  print("Enter HRA: ");
  double hra = double.parse(stdin.readLineSync()!);

  print("Enter DA: ");
  double da = double.parse(stdin.readLineSync()!);

  print("Enter Bonus: ");
  double bonus = double.parse(stdin.readLineSync()!);

  print("Enter Performance Incentive: ");
  double performanceIncentive = double.parse(stdin.readLineSync()!);

  Manager manager = Manager(
    employeeId,
    employeeName,
    department,
    basicSalary,
    hra,
    da,
    bonus,
    performanceIncentive,
  );

  manager.displaySalarySlip();
}