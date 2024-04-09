import 'dart:io';

void main() {
  List<Map<String, dynamic>> recipes = [];

  while (true) {
    print('Recipe App Menu:');
    print('1. Add a Recipe');
    print('2. View All Recipes');
    print('3. Search for a Recipe');
    print('4. Exit');

    stdout.write('Enter your choice: ');
    String choice = stdin.readLineSync() ?? '';
    print('');

    switch (choice) {
      case '1':
        addRecipe(recipes);
        break;
      case '2':
        viewAllRecipes(recipes);
        break;
      case '3':
        searchRecipe(recipes);
        break;
      case '4':
        print('Exiting Recipe App. Goodbye!');
        return;
      default:
        print('Invalid choice. Please enter a valid option.');
    }

    print('');
  }
}

void addRecipe(List<Map<String, dynamic>> recipes) {
  stdout.write('Enter recipe name: ');
  String name = stdin.readLineSync() ?? '';

  stdout.write('Enter ingredients (comma-separated): ');
  String ingredients = stdin.readLineSync() ?? '';

  stdout.write('Enter instructions: ');
  String instructions = stdin.readLineSync() ?? '';

  Map<String, dynamic> recipe = {
    'name': name,
    'ingredients': ingredients.split(',').map((e) => e.trim()).toList(),
    'instructions': instructions,
  };

  recipes.add(recipe);
  print('Recipe added successfully!');
}

void viewAllRecipes(List<Map<String, dynamic>> recipes) {
  if (recipes.isEmpty) {
    print('No recipes found.');
  } else {
    for (int i = 0; i < recipes.length; i++) {
      print('Recipe ${i + 1}:');
      print('Name: ${recipes[i]['name']}');
      print('Ingredients: ${recipes[i]['ingredients'].join(', ')}');
      print('Instructions: ${recipes[i]['instructions']}');
      print('');
    }
  }
}

void searchRecipe(List<Map<String, dynamic>> recipes) {
  stdout.write('Enter search keyword: ');
  String keyword = stdin.readLineSync() ?? '';

  List<Map<String, dynamic>> searchResults = recipes
      .where((recipe) =>
          recipe['name'].toLowerCase().contains(keyword.toLowerCase()) ||
          recipe['ingredients']
              .join(' ')
              .toLowerCase()
              .contains(keyword.toLowerCase()) ||
          recipe['instructions'].toLowerCase().contains(keyword.toLowerCase()))
      .toList();

  if (searchResults.isEmpty) {
    print('No recipes found matching the search keyword.');
  } else {
    print('Search Results:');
    viewAllRecipes(searchResults);
  }
}




// Sure! Let's break down the Dart code for the recipe app:

// 1. **Imports**: The program starts with an import statement for the `dart:io` library, which allows us to interact with input and output streams in the command-line interface.

// 2. **Main Function**: The `main()` function serves as the entry point of the program. It initializes an empty list `recipes` to store recipe data.

// 3. **Menu Loop**: The program enters a while loop that displays a menu of options for the user:

  //  - Option 1: Add a Recipe
  //  - Option 2: View All Recipes
  //  - Option 3: Search for a Recipe
  //  - Option 4: Exit

  //  The user is prompted to enter their choice, and the program responds accordingly.

// 4. **Add Recipe Function**: The `addRecipe()` function prompts the user to enter details for a new recipe, including the recipe name, ingredients (comma-separated), and instructions. It then constructs a map representing the recipe and adds it to the `recipes` list.

// 5. **View All Recipes Function**: The `viewAllRecipes()` function displays all recipes currently stored in the `recipes` list. It iterates over each recipe in the list and prints its name, ingredients, and instructions.

// 6. **Search Recipe Function**: The `searchRecipe()` function prompts the user to enter a search keyword. It then filters the `recipes` list to find recipes whose name, ingredients, or instructions contain the keyword (case-insensitive). It displays the search results using the `viewAllRecipes()` function.

// 7. **Input Handling**: Throughout the program, input from the user is obtained using the `stdin.readLineSync()` method, which reads a line of text from the standard input stream. User input is sanitized and processed as needed.

// 8. **Exiting the Program**: If the user selects option 4 (Exit), the program prints a farewell message and returns from the `main()` function, effectively terminating the program.

// Overall, this Dart program provides a simple command-line interface for managing recipes, allowing users to add new recipes, view existing recipes, search for recipes, and exit the application.