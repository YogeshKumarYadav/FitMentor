import 'package:flutter/material.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  final List<Map<String, String>> _suggestions = [
    {
      "title": "Hydration Reminder",
      "description": "You're under-hydrated today. Try drinking at least 2.5 liters of water."
    },
    {
      "title": "Sleep Improvement",
      "description": "Your deep sleep duration was low. Consider avoiding screens 1 hour before bed."
    },
    {
      "title": "Cardio Exercise",
      "description": "Add 30 minutes of moderate-intensity cardio to your routine."
    },
    {
      "title": "Mindfulness Break",
      "description": "Your stress levels are high. Try a 10-minute meditation session."
    },
    {
      "title": "Nutrition Tip",
      "description": "You're low on protein intake. Include more eggs, lentils, or lean meat in meals."
    },
  ];

  void _removeSuggestion(BuildContext context, int index) {
    // Store the item and its original index so it can be restored if 'Undo' is pressed.
    final dismissedItem = _suggestions[index];
    final dismissedIndex = index;

    // Update the UI by removing the item from the list.
    // setState notifies Flutter that the internal state has changed,
    // prompting a rebuild of the widget tree.
    setState(() {
      _suggestions.removeAt(index);
    });

    // Display a SnackBar at the bottom of the screen to confirm dismissal
    // and provide an undo action.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${dismissedItem['title']} dismissed'), // Message displayed
        action: SnackBarAction(
          label: 'Undo', // Label for the undo button
          onPressed: () {
            // If 'Undo' is pressed, re-insert the item at its original position.
            setState(() {
              _suggestions.insert(dismissedIndex, dismissedItem);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text("Insights", style: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: _suggestions.length,
            itemBuilder: (context, index) {
              final suggestion = _suggestions[index];
              return Dismissible(
                // A unique key is required for Dismissible to correctly identify
                // and manage the lifecycle of the widget being dismissed.
                // ValueKey is suitable here as the title is unique for each suggestion.
                key: ValueKey(suggestion['title']!),
                // Specifies the direction(s) in which the item can be dismissed.
                // Here, it's set to allow swiping only from left to right.
                direction: DismissDirection.startToEnd,
                // The widget to display behind the item when it is being swiped.
                background: Container(
                  color: Colors.red, // Background color when swiping
                  alignment: Alignment.centerLeft, // Aligns the icon to the left
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Icon(Icons.delete, color: Colors.white, size: 30), // Delete icon
                ),
                // Callback function executed when the item has been dismissed.
                onDismissed: (direction) {
                  // Call the shared function to handle removal and SnackBar display.
                  _removeSuggestion(context, index);
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 2, // Adds a subtle shadow to the cards
                  child: ListTile(
                    title: Text(
                      suggestion['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(suggestion['description']!),
                    leading: const Icon(Icons.favorite, color: Colors.redAccent),
                    // Adds an IconButton to the trailing (right) end of the ListTile.
                    trailing: IconButton(
                      icon: const Icon(Icons.close), // Close icon
                      onPressed: () {
                        // Call the shared function to handle removal and SnackBar display.
                        _removeSuggestion(context, index);
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
