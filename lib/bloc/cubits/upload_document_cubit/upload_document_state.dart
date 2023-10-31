part of 'upload_document_cubit.dart';

@immutable
abstract class UploadDocumentState {}

class UploadDocumentInitial extends UploadDocumentState {}

class CaptureProfilePhotoState extends UploadDocumentState {}

class UploadDocumentFailureState extends UploadDocumentState {
  final String message;

  UploadDocumentFailureState({required this.message});
}
