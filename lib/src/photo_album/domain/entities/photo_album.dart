import 'package:equatable/equatable.dart';

class PhotoAlbum extends Equatable {

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const PhotoAlbum({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,

  });

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];

}