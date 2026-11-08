import 'package:flutter/material.dart';
import '../modeli/post.dart';
import 'oznaka_widget.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  final bool pinned;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onDismissed;
  const PostWidget({
    super.key,
    required this.post,
    required this.pinned,
    required this.onTap,
    required this.onLongPress,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(post.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) => onDismissed(),
      child: ListTile(
        leading: Hero(
          tag: 'post_${post.id}',
          child: OznakaWidget(id: post.id),
        ),
        title: Text(post.title),
        trailing: AnimatedScale(
          scale: pinned ? 1 : 0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutBack,
          child: const Icon(Icons.push_pin),
        ),
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}