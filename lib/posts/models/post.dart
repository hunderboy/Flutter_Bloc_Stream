import 'package:equatable/equatable.dart';


/**
 * 1. 가장 먼저 작성해야하는 것은 Model
 */
final class Post extends Equatable {
  const Post({required this.id, required this.title, required this.body});

  final int id;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, title, body];
}
