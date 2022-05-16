import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductSlidableWidget extends StatelessWidget {
  final Widget child;
  final Function(BuildContext) onDelete;
  final Function(BuildContext) onEdit;
  const ProductSlidableWidget(
      {Key? key,
      required this.child,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: onEdit,
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            icon: Icons.edit_note,
            label: 'Editar',
          ),
          SlidableAction(
            onPressed: onDelete,
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Apagar',
          ),
        ],
      ),
      child: child,
    );
  }
}
