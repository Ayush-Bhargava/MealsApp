import 'package:flutter/material.dart';
import '../dummy_data.dart';
//import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildHeading(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildHeading(context, 'Steps'),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(child: Text('${(index + 1)}',)),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Container buildContainer(Widget child) {
    return Container(
      height: 150,
      width: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      //color: Colors.white,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: child,
    );
  }

  Container buildHeading(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
