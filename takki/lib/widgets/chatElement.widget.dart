import 'package:flutter/material.dart';

class ChatElementCard extends StatelessWidget {
  final String sender;
  final String time;
  final String message;
  final VoidCallback? onSwipeLeft;
  final VoidCallback? onSwipeRight;
  final bool isRead;

  const ChatElementCard({
    super.key,
    required this.sender,
    required this.time,
    required this.message,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.isRead = true,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);
    return Dismissible(
      key: ValueKey('$sender-$time'),
      background: swipeRightBackground(),
      secondaryBackground: swipeLeftBackground(),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          onSwipeRight?.call();
        } else if (direction == DismissDirection.endToStart) {
          onSwipeLeft?.call();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: myTheme.colorScheme.primary,
          border: Border.all(
            color: isRead ? Colors.grey.shade300 : Color(0xFF43B3AE),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    sender,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      // color: Colors.black87,
                    ),
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                // color: Colors.black54
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget swipeRightBackground() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20.0),
      color: Colors.green.shade400,
      child: const Icon(Icons.reply, color: Colors.white),
    );
  }

  Widget swipeLeftBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20.0),
      color: Colors.red.shade400,
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}
