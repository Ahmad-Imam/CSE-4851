//You can directly run the code at : https://dartpad.dev/21762c15889eed9ab3325f933490f43a?



abstract class Thing {
  String name;
  void doSomething();
}

class CompositeThing implements Thing {
  String name;
  Set<Thing> _childThings = Set();

  CompositeThing(this.name) {
    //print('ca');
  }

  void addChild(Thing child) {
    _childThings.add(child);
  }

  void doSomething() {
    print("** $name is loading! **\n");
    _childThings.forEach((thing) => thing.doSomething());
    print("\r** $name completed loading. **\n");
  }
}

class Shape implements Thing {
  String name;

  Shape(this.name);

  void doSomething() {
    print("* Creating  $name!");
  }
}

void main() {

  var mainGame = CompositeThing("Age of Villagers");
  var createVillage = CompositeThing("Create Village");
  var house = CompositeThing("house");
  var water_pump = CompositeThing("water pump");
  var tree = CompositeThing("tree");

  var player1 = CompositeThing("Player 1");
  var player2 = CompositeThing("Player 2");

  var player1Village = CompositeThing("Player 1 village");
  var player2Village = CompositeThing("Player 2 village");

  var rectangle_1 = Shape("rectangle 1");
  var rectangle_2 = Shape("rectangle 2");
  var circle_1 = Shape("circle 1");
  var circle_2 = Shape("circle 2");
  var line = Shape("line");
  var triangle = Shape("triangle");

  
  player1.addChild(player1Village);
  player2.addChild(player2Village);
  
  player1Village.addChild(house);
  player1Village.addChild(tree);
  
  player2Village.addChild(house);
  player2Village.addChild(water_pump);
  
  house.addChild(rectangle_1);
  house.addChild(rectangle_2);
  house.addChild(triangle);
  
  tree.addChild(rectangle_1);
  tree.addChild(line);
  tree.addChild(circle_2);
  
  water_pump.addChild(rectangle_2);
  water_pump.addChild(circle_1);
  
  mainGame.addChild(createVillage);

  createVillage.addChild(player1);
  createVillage.addChild(player2);

  mainGame.doSomething();
}
