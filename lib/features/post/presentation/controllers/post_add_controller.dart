import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsi/core/models/app_file.dart';
import '../../data/repositories/post_repository_impl.dart';
import 'post_list_controller.dart';

part 'post_add_controller.g.dart';
part 'post_add_controller.freezed.dart';

@freezed
abstract class PostAddState with _$PostAddState {
  const factory PostAddState({
    @Default(false) bool isValid
  }) = _PostAddState;
}

@riverpod
class PostAddController extends _$PostAddController {
  String _caption = '';

  @override
  PostAddState build(AppFile file) =>
    const PostAddState();

  void onCaptionChanged(String caption) {
    _caption = caption;
    state = state.copyWith(
      isValid: _caption.isNotEmpty
    );
  }

  Future<void> onSharePressed({required Function(double) onProgress}) async {
    await ref.read(postRepositoryProvider).addPost(
      caption: _caption,
      file: file,
      onProgress: onProgress
    );
    return ref.read(postListControllerProvider.notifier).initPosts();
  }
}