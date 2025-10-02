part of 'bascket_add_bloc.dart';

abstract class BascketAddEvent {}

class BascketAddItemEvent extends BascketAddEvent {
  final MealDetailes subList; // rename this to 'item' if it's a single item
  BascketAddItemEvent(this.subList);
}

class RemoveItemFromBascketEvent extends BascketAddEvent {
  final int itemToRemove;
  RemoveItemFromBascketEvent(this.itemToRemove);
}
class EmptyBascketEvent extends BascketAddEvent {
  EmptyBascketEvent();
}