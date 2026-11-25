import 'dart:async';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:video_compress/video_compress.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../providers/supabase_provider.dart';

part 'storage_service.g.dart';

@riverpod
StorageService storageService(Ref ref) =>
  StorageService(ref.watch(supabaseClientProvider));

class StorageService {
  final SupabaseClient _supabaseClient;
  
  StorageService(this._supabaseClient);

  Future<String> saveImage({
    required String bucket,
    required String bucketPath,
    required String imagePath,
    Function(double)? onProgress
  }) async {
    return _trackFuture(
      future: () async {
        final compressedFile = await FlutterImageCompress.compressWithFile(
          imagePath,
          quality: 100,
          format: CompressFormat.png
        );
        await _supabaseClient.storage.from(bucket).uploadBinary(
          bucketPath,
          compressedFile!
        );
        return _supabaseClient.storage.from(bucket).getPublicUrl(bucketPath);
      },
      onProgress: onProgress
    );
  }

  Future<(String, String)> saveVideo({
    required String bucket,
    required String videoBucketPath,
    required String thumbBucketPath,
    required String videoPath,
    required Function(double) onProgress
  }) {
    return _trackFuture(
      future: () async {
        final compressedVideo = await VideoCompress.compressVideo(
          videoPath,
          quality: VideoQuality.MediumQuality
        );
        await _supabaseClient.storage.from(bucket).upload(
          videoBucketPath,
          compressedVideo!.file!
        );
        final thumbFile = await VideoCompress.getFileThumbnail(
          videoPath,
          quality: 60
        );
        final thumbUrl = await saveImage(
          bucket: bucket,
          bucketPath: thumbBucketPath,
          imagePath: thumbFile.path
        );
        return (
          _supabaseClient.storage.from(bucket).getPublicUrl(videoBucketPath),
          thumbUrl
        );
      },
      onProgress: onProgress
    );
  }

  Future<void> deleteFile({
    required String bucket,
    required String bucketPath
  }) {
    return _supabaseClient.storage.from(bucket).remove([bucketPath]);
  }

  Future<T> _trackFuture<T>({
    required Future<T> Function() future,
    Function(double)? onProgress
  }) async {
    if (onProgress == null) return future();
    final updateDuration = const Duration(milliseconds: 200);
    var currentProgress = 0.0;
    final timer = Timer.periodic(updateDuration, (_) {
      currentProgress += (0.95 - currentProgress) * 0.08;
      onProgress(currentProgress);
    });
    try {
      final result = await future();
      timer.cancel();
      onProgress(1.0);
      return result;
    } catch (e) {
      timer.cancel();
      rethrow;
    }
  }
}