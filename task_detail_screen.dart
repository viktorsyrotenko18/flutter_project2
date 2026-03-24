import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  // 🔹 Тексти (локалізація)
  final String title = "Підготувати звіт для клієнта";
  final String description =
      "Підготувати квартальний звіт для компанії \"Технології майбутнього\". "
      "Включити всі ключові показники, графіки продажів та аналіз конкурентів.";
  final String createdDate = "10.03.2026 14:30";
  final String deadline = "15.03.2026 18:00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),

      /// 🔹 AppBar
      appBar: AppBar(
        title: const Text("Деталі завдання"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.edit),
          )
        ],
      ),

      /// 🔹 Основний контент
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔹 Іконка + назва
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.work, size: 40, color: Colors.orange),
            ),

            const SizedBox(height: 16),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            /// 🔹 Категорія + пріоритет
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _chip("Робота", Colors.orange),
                const SizedBox(width: 8),
                _chip("Високий пріоритет", Colors.red),
              ],
            ),

            const SizedBox(height: 16),

            /// 🔹 Опис
            _card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.description, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(child: Text(description)),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// 🔹 Дати
            _card(
              child: Column(
                children: [
                  _rowItem(Icons.edit, "Створено", createdDate),
                  const Divider(),
                  _rowItem(Icons.calendar_today, "Дедлайн", deadline),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// 🔹 Статус
            _card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.blue),
                      SizedBox(width: 8),
                      Text("Статус виконання"),
                    ],
                  ),
                  Switch(value: false, onChanged: null),
                ],
              ),
            ),

            const Spacer(),

            /// 🔹 Кнопки
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text("Редагувати"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                    label: const Text("Видалити"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// ---------- UI Widgets ----------

  Widget _chip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: color)),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
          )
        ],
      ),
      child: child,
    );
  }

  Widget _rowItem(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text("$title: "),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
