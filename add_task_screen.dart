import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String selectedCategory = "Робота";
  String selectedPriority = "Високий";
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Нове завдання",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            /// Назва
            const Text("Назва завдання"),
            const SizedBox(height: 8),
            TextField(
              decoration: _inputDecoration("Введіть назву завдання"),
            ),

            const SizedBox(height: 16),

            /// Опис
            const Text("Опис"),
            const SizedBox(height: 8),
            TextField(
              maxLines: 4,
              decoration: _inputDecoration("Додайте детальний опис завдання"),
            ),

            const SizedBox(height: 16),

            /// Категорія
            const Text("Категорія"),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _categoryItem(Icons.work, "Робота"),
                _categoryItem(Icons.person, "Особисте"),
                _categoryItem(Icons.school, "Навчання"),
                _categoryItem(Icons.shopping_cart, "Покупки"),
              ],
            ),

            const SizedBox(height: 16),

            /// Дата
            const Text("Дата виконання"),
            const SizedBox(height: 8),
            InkWell(
              onTap: _pickDate,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: _boxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${selectedDate.day}.${selectedDate.month}.${selectedDate.year}",
                    ),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// Пріоритет
            const Text("Пріоритет"),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _priorityItem("Високий", Colors.red),
                _priorityItem("Середній", Colors.grey),
                _priorityItem("Низький", Colors.grey),
              ],
            ),

            const SizedBox(height: 24),

            /// Кнопка
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {},
              child: const Text("Створити завдання"),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------- UI Helpers ----------

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    );
  }

  Widget _categoryItem(IconData icon, String title) {
    final isSelected = selectedCategory == title;

    return GestureDetector(
      onTap: () {
        setState(() => selectedCategory = title);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.orange : Colors.transparent,
                width: 2,
              ),
              color: Colors.white,
            ),
            child: Icon(icon, color: isSelected ? Colors.orange : Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.orange : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _priorityItem(String title, Color color) {
    final isSelected = selectedPriority == title;

    return GestureDetector(
      onTap: () {
        setState(() => selectedPriority = title);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade300,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? color : Colors.grey,
          ),
        ),
      ),
    );
  }

  /// ---------- Date Picker ----------
  void _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }
}
