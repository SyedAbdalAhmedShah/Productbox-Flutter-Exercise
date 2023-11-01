import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:productbox_flutter_exercise/bloc/repositories/dashboard_repository.dart';
import 'package:productbox_flutter_exercise/models/feeds_model.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  List<FeedModel> feeds = [];
  DashboardRepository _repository = DashboardRepository();
  void getAllFeedData() {
    feeds = _repository.getUserData();
    emit(GetAllFeedsState());
  }
}
