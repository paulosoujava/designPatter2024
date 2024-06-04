//----------------------------------------------------
abstract interface class IMealComposite {
  double getPrice();
}

//----------------------------------------------------
abstract class Meal implements IMealComposite {
  String name;
  double price;

  Meal(this.name, this.price);

  @override
  double getPrice() {
    return price;
  }
}

//----------------------------------------------------
class Rice extends Meal {
  Rice(super.name, super.price);
}

class Beans extends Meal {
  Beans(super.name, super.price);
}

class Meat extends Meal {
  Meat(super.name, super.price);
}

class Vegetables extends Meal {
  Vegetables(super.name, super.price);
}

class Sauce extends Meal {
  Sauce(super.name, super.price);
}
//----------------------------------------------------

class MealBox implements IMealComposite {
  final List<IMealComposite> _meals = [];

  void add(List<IMealComposite> meals) {
    _meals.addAll(meals);
  }

  @override
  double getPrice() {
    double total = 0.0;
    //assim
    //total = _meals.map((meal) => meal.getPrice()).reduce((value, element) => value + element);
    //ou assim:
    for (var meal in _meals) {
      total += meal.getPrice();
    }
    return total;
  }
}
//----------------------------------------------------
main() {

  final mealBox = MealBox();
  final rice = Rice("Rice", 10.0);
  final beans = Beans("Beans", 20.0);
  final meat = Meat("Meat", 30.0);
  final vegetables = Vegetables("Vegetables", 40.0);
  final sauce = Sauce("Sauce", 50.0);
  mealBox.add([rice, beans, meat, vegetables, sauce]);
  print(mealBox.getPrice());

  // com o builder eu nao preciso fazer nada do que esta acima para ter uma refeicao,
  // com o builder eu crio pratos prontos
  final mealBuilder = MainDishBuilder();
  mealBuilder.makeBasic();
  mealBuilder.addMoreRice();
  mealBuilder.addMoreRice();
  mealBuilder.addMoreRice();

  //mealBuilder.makeTheFucking();
  //mealBuilder.makeTop();
  final meal = mealBuilder.getMeal();
  print(meal.getPrice());
  mealBuilder.reset();
  print(mealBuilder.getMeal().getPrice());
}

//----------------------------------------------------
//BUILDER
abstract interface class IMealBuilder{
  void makeTop();
  void makeBasic();
  void makeTheFucking();
}
//----------------------------------------------------
class MainDishBuilder implements IMealBuilder{
   MealBox _meal = MealBox();

  @override
  void makeBasic() {
    _meal.add([Beans("Beans", 20.0), Meat("Meat", 30.0)]);
  }

  @override
  void makeTheFucking() {
    _meal.add([Vegetables("Vegetables", 40.0), Sauce("Sauce", 50.0)]);
  }

  @override
  void makeTop() {
    _meal.add([Rice("Rice", 10.0)]);
  }
  void addMoreRice(){
    _meal.add([Rice("Rice", 10.0)]);
  }

  MealBox getMeal(){
    return _meal;
  }
  void reset(){
    _meal = MealBox();
  }
}