import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import '../../data/repositories/profile_repository_impl.dart';

part 'profile_list_controller.g.dart';

@riverpod
class ProfileListController extends _$ProfileListController {
  String _searchQuery = '';

  @override
  Stream<List<ProfileEntity>> build() {
    final profilesStream = ref.watch(profileRepositoryProvider).watchProfiles();
    if (_searchQuery.isEmpty) {
      return profilesStream;
    }
    return profilesStream.map((profiles) =>
      profiles.where((profile) => 
        profile.username.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList()
    );
  }

  void updateSearchQuery(String searchQuery) {
    _searchQuery = searchQuery;
    ref.invalidateSelf();
  }
}