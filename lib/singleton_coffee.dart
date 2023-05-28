enum CoffeeMilk { regular, oat, almond, without}
enum CoffeeSugar {white, brown}
enum CoffeeCinnamon { regularPortion, doublePortion}
enum CoffeeCream {low, middle, high}
enum CoffeeSize {regular, double}
enum CoffeeType {brown, black}

class CoffeeBase{
  final CoffeeType coffeeType;
  final CoffeeSize coffeeSize;

  const CoffeeBase(this.coffeeSize, this.coffeeType);

  @override
  String toString() {
    var typeStr = coffeeType.toString().split('.')[1];
    var coffeeSizeStr = coffeeSize.toString().split('.')[1];
    return 'coffee type: $typeStr & $coffeeSizeStr \n';
  }
}

class Coffee {
  String name;
  CoffeeBase typeOfCOffee;
  CoffeeSugar sugar;
  // CoffeeCinnamon cinnamon;
  CoffeeMilk milk;

  Coffee(
      {
        this.name = 'Cappucino Regular',
        // this.cinnamon = CoffeeCinnamon.regularPortion,
        this.milk = CoffeeMilk.regular,
        this.sugar = CoffeeSugar.white,
        this.typeOfCOffee = const CoffeeBase(CoffeeSize.regular, CoffeeType.brown)});


}

class CoffeeSingleton {
  static CoffeeSingleton? _instance;

  String name = 'Cappucino Regular';
  CoffeeMilk milk = CoffeeMilk.regular;
  CoffeeSugar sugar = CoffeeSugar.white;
  CoffeeBase base = CoffeeBase(CoffeeSize.regular, CoffeeType.brown);

  CoffeeSingleton._();

  static CoffeeSingleton getInstance() {
    return _instance ??= CoffeeSingleton._();
  }

  @override
  String toString() {
    var infoStr = 'Coffee name: $name \n';
    infoStr += base.toString();
    infoStr += 'milk:  ${milk.toString().split('.')[1]}\n';
    infoStr += 'sugar: ${sugar.toString().split('.')[1]}\n';
    return infoStr;
  }
}

void main(List<String> arguments){
  var coffee = CoffeeSingleton.getInstance();
  print(coffee);

  print('---' * 20);

  coffee.name = '0_0';
  var newCofee = CoffeeSingleton.getInstance();
  print(identical(coffee,newCofee));

  print('---' * 20);

  print(coffee);
}
