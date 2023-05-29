import 'package:get/get.dart' show GetPage, Transition;
import 'package:stardriver/app/bindings/activation_binding.dart';
import 'package:stardriver/app/bindings/annual_binding.dart';
import 'package:stardriver/app/bindings/annualbindingdetail.dart';
import 'package:stardriver/app/bindings/attendance_binding.dart';
import 'package:stardriver/app/bindings/auth_binding.dart';
import 'package:stardriver/app/bindings/base_bindings.dart';
import 'package:stardriver/app/bindings/bus_detail_binding.dart';
import 'package:stardriver/app/bindings/call_binding.dart';
import 'package:stardriver/app/bindings/card_and_tags_binding.dart';
import 'package:stardriver/app/bindings/cart_binding.dart';
import 'package:stardriver/app/bindings/complain_binding.dart';
import 'package:stardriver/app/bindings/early_leave_binding.dart';
import 'package:stardriver/app/bindings/edit_profile_binding.dart';
import 'package:stardriver/app/bindings/events_binding.dart';
import 'package:stardriver/app/bindings/feedback_binding.dart';
import 'package:stardriver/app/bindings/language_select_binding.dart';
import 'package:stardriver/app/bindings/leave_request_binding.dart';
import 'package:stardriver/app/bindings/medical_record_binding.dart';
import 'package:stardriver/app/bindings/message_binding.dart';
import 'package:stardriver/app/bindings/news_binding.dart';
import 'package:stardriver/app/bindings/notification_binding.dart';
import 'package:stardriver/app/bindings/performance_binding.dart';
import 'package:stardriver/app/bindings/rating_binding.dart';
import 'package:stardriver/app/bindings/rules_binding.dart';
import 'package:stardriver/app/bindings/salary_slip_binding.dart';
import 'package:stardriver/app/bindings/schedule_meeeting_binding.dart';
import 'package:stardriver/app/bindings/shop_binding.dart';
import 'package:stardriver/app/bindings/sos_binding.dart';
import 'package:stardriver/app/bindings/star_detail_binding.dart';
import 'package:stardriver/app/bindings/task_and_reminder_binding.dart';
import 'package:stardriver/app/bindings/trip_record_history_binding.dart';
import 'package:stardriver/app/bindings/wallet_binding.dart';
import 'package:stardriver/app/modules/about_app/about_app_view.dart';
import 'package:stardriver/app/modules/activation_deactivation/activation_request_view.dart';
import 'package:stardriver/app/modules/activation_deactivation/deactivation_details_view.dart';
import 'package:stardriver/app/modules/annual_schedule/annual_schedule.dart';
import 'package:stardriver/app/modules/annual_schedule/annual_schedule_detail.dart';
import 'package:stardriver/app/modules/auth/account_activation_view.dart';
import 'package:stardriver/app/modules/auth/login_as_view.dart';
import 'package:stardriver/app/modules/auth/login_view.dart';
import 'package:stardriver/app/modules/auth/select_user_type_view.dart';
import 'package:stardriver/app/modules/auth/verification_view.dart';
import 'package:stardriver/app/modules/base_view/base_view.dart';
import 'package:stardriver/app/modules/card_and_tags/card_and_tag_view.dart';
import 'package:stardriver/app/modules/card_and_tags/request_card_tag_view.dart';
import 'package:stardriver/app/modules/cart/cart_view.dart';
import 'package:stardriver/app/modules/cart/tray_view.dart';
import 'package:stardriver/app/modules/complains_and_reports/complain_view.dart';
import 'package:stardriver/app/modules/complains_and_reports/raise_complain_view.dart';
import 'package:stardriver/app/modules/early_leave_and_permissions/early_leave_view.dart';
import 'package:stardriver/app/modules/early_leave_and_permissions/leave_permission_view.dart';
import 'package:stardriver/app/modules/events/event_details_view.dart';
import 'package:stardriver/app/modules/events/events_view.dart';
import 'package:stardriver/app/modules/feedback_and_help/add_feedback_view.dart';
import 'package:stardriver/app/modules/feedback_and_help/feedback_view.dart';
import 'package:stardriver/app/modules/leave_request/leave_request_view.dart';
import 'package:stardriver/app/modules/leave_request/request_leave.dart';
import 'package:stardriver/app/modules/medical_records/medical_record_view.dart';
import 'package:stardriver/app/modules/meeting/audio_call/audio_call_view.dart';
import 'package:stardriver/app/modules/meeting/video_call/video_call_view.dart';
import 'package:stardriver/app/modules/message/message_view.dart';
import 'package:stardriver/app/modules/my_attendance/attendance_view.dart';
import 'package:stardriver/app/modules/my_attendance/calendar_view.dart';
import 'package:stardriver/app/modules/my_performance/performance_view.dart';

import 'package:stardriver/app/modules/my_profile/sub_pages/details/add_family_member.dart';
import 'package:stardriver/app/modules/my_profile/sub_pages/details/edit_profile/edit_profile_view.dart';
import 'package:stardriver/app/modules/my_profile/sub_pages/details/salary_slip_view.dart';
import 'package:stardriver/app/modules/my_profile/sub_pages/trips/bus_details/bus_detail_view.dart';
import 'package:stardriver/app/modules/my_profile/sub_pages/trips/bus_details/sub_pages/add_record_view.dart';
import 'package:stardriver/app/modules/my_profile/sub_pages/trips/trip_details/trip_detail_view.dart';
import 'package:stardriver/app/modules/my_profile/sub_pages/trips/trip_route/trip_route_view.dart';
import 'package:stardriver/app/modules/my_route/my_route_view.dart';
import 'package:stardriver/app/modules/news/news_view.dart';
import 'package:stardriver/app/modules/notifications/notification_settings_view.dart';
import 'package:stardriver/app/modules/notifications/notification_view.dart';
import 'package:stardriver/app/modules/rating/bus_rating_view.dart';
import 'package:stardriver/app/modules/rating/staff_rating_view.dart';
import 'package:stardriver/app/modules/rating/supervisor_rating_view.dart';
import 'package:stardriver/app/modules/rules_regulations/code_of_conduct_view.dart';
import 'package:stardriver/app/modules/rules_regulations/rules_view.dart';
import 'package:stardriver/app/modules/schedule_meeting/create_meeting.dart';
import 'package:stardriver/app/modules/schedule_meeting/schedule_meeting_view.dart';
import 'package:stardriver/app/modules/select_language/language_select.dart';
import 'package:stardriver/app/modules/shop/shop_view.dart';
import 'package:stardriver/app/modules/shop/sub_pages/orders/edit_order.dart';
import 'package:stardriver/app/modules/shop/sub_pages/orders/return_order_view.dart';
import 'package:stardriver/app/modules/sos/ask_for_help_view.dart';
import 'package:stardriver/app/modules/sos/fire_emergency_view.dart';
import 'package:stardriver/app/modules/sos/qr_scanner_view.dart';
import 'package:stardriver/app/modules/sos/sos_assembly_view.dart';
import 'package:stardriver/app/modules/sos/sos_view.dart';
import 'package:stardriver/app/modules/splash/splash_view.dart';
import 'package:stardriver/app/modules/star_details/star_detail_view.dart';
import 'package:stardriver/app/modules/task_and_reminders/set_reminder_screen.dart';
import 'package:stardriver/app/modules/task_and_reminders/task_and_reminder_view.dart';
import 'package:stardriver/app/modules/trip_history_record/trip_history_record_view.dart';
import 'package:stardriver/app/modules/trip_location_page.dart';
import 'package:stardriver/app/modules/trip_operation/sub_pages/trip_direction_view.dart';
import 'package:stardriver/app/modules/wallet/wallet_view.dart';
import 'package:stardriver/app/modules/worksheet/worksheet_quiz_view.dart';
import 'package:stardriver/app/modules/worksheet/worksheet_view.dart';

import '../bindings/my_route_binding.dart';
import '../bindings/worksheetQuizBinding.dart';
import '../modules/my_profile/sub_pages/trips/bus_details/sub_pages/Edit_record_view.dart';
import '../modules/my_route/my_route_description_view.dart';
import '../modules/trip_operation/trip_operation_view.dart';
import 'app_routes.dart';

class Theme1AppPages {
  // static const initial = Routes.editProfileView;
  static const initial = Routes.splash;
  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashView()),
    GetPage(
        name: Routes.selectLanguageView,
        page: () => const LanguageSelectView(),
        binding: LanguageSelectBinding()),
    GetPage(
        name: Routes.loginView,
        page: () => const LoginView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.verificationView,
        page: () => VerificationView(mobile: '8596741230',),
        binding: AuthBinding()),
    GetPage(
        name: Routes.loginAsView,
        page: () => const LoginAsView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.selectUserType,
        page: () => const SelectUserTypeView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.accountActivationView,
        page: () => const AccountActivationView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.rulesView,
        page: () => const RulesView(),
        binding: RulesBinding()),
    GetPage(
        name: Routes.codeOfConductView,
        page: () => const CodeOfConductView(),
        binding: RulesBinding()),
    GetPage(
        name: Routes.baseView,
        page: () => const BaseView(),
        binding: BaseBinding()),
    GetPage(
        name: Routes.addFamilyMember,
        page: () => const AddFamilyMember(),
        binding: BaseBinding()),
    GetPage(
        name: Routes.salarySlipView,
        page: () => SalarySlipView(),
        binding: SalarySlipBinding()),
    GetPage(
        name: Routes.busDetailView,
        page: () => const BusDetailView(),
        binding: BusDetailBinding()),
    GetPage(
        name: Routes.addRecordView,
        page: () => const AddRecordView(),
        binding: BusDetailBinding()),
    GetPage(
        name: Routes.editRecordView,
        page: () => const EditRecordView(),
        binding: BusDetailBinding()),
    GetPage(
        name: Routes.tripRouteView,
        page: () => const TripRouteView(),
        binding: BusDetailBinding()),
    GetPage(
      name: Routes.tripLocationView,
      page: () => const TripLocationView(),
    ),
    GetPage(
        name: Routes.tripDetailView,
        page: () => const TripDetailView(),
        binding: BusDetailBinding()),
    GetPage(
        name: Routes.editProfileView,
        page: () =>  EditProfileView(),
        binding: EditProfileBinding()),
    GetPage(
        name: Routes.notificationView,
        page: () => const NotificationView(),
        binding: NotificationBinding()),
    GetPage(
        name: Routes.notificationSettings,
        page: () => const NotificationSettingsView(),
        binding: NotificationBinding()),
    GetPage(
        name: Routes.cardTagsView,
        page: () => const CardAndTagsView(),
        binding: CardAndTagsBinding()),
    GetPage(
        name: Routes.requestCardTagsView,
        page: () => const RequestCardAndTagsView(),
        binding: CardAndTagsBinding()),
    GetPage(
        name: Routes.medicalRecordView,
        page: () => const MedicalRecordView(),
        binding: MedicalRecordBinding()),
    GetPage(
        name: Routes.sosView,
        page: () => const SOSView(),
        binding: SOSBinding()),
    GetPage(
        name: Routes.askForHelpView,
        page: () => const AskForHelpView(),
        binding: SOSBinding()),
    GetPage(
        name: Routes.attendanceView,
        page: () => const AttendanceView(),
        binding: AttendanceBinding()),
    GetPage(
        name: Routes.tripDirectionView,
        page: () => const TripDirectionView(),
        binding: BaseBinding()),
    GetPage(
        name: Routes.calendarView,
        page: () => const CalendarView(),
        binding: AttendanceBinding()),
    GetPage(
        name: Routes.leaveRequestView,
        page: () => const LeaveRequestView(),
        binding: LeaveRequestBinding()),
    GetPage(
        name: Routes.requestLeave,
        page: () => const RequestLeave(),
        binding: LeaveRequestBinding()),
    GetPage(
        name: Routes.earlyLeave,
        page: () => const EarlyLeaveView(),
        binding: EarlyLeaveBinding()),
    GetPage(
        name: Routes.leavePermission,
        page: () => const LeavePermissionView(),
        binding: EarlyLeaveBinding()),
    GetPage(
        name: Routes.performanceView,
        page: () => const PerformanceView(),
        binding: PerformanceBinding()),
    GetPage(
        name: Routes.complainView,
        page: () => const ComplainView(),
        binding: ComplainBinding()),
    GetPage(
        name: Routes.raiseComplain,
        page: () => const RaiseComplainView(),
        binding: ComplainBinding()),
    GetPage(
        name: Routes.feedbackView,
        page: () => const FeedbackView(),
        binding: FeedbackBinding()),
    GetPage(
        name: Routes.addFeedbackView,
        page: () => const AddFeedbackView(),
        binding: FeedbackBinding()),
    GetPage(
        name: Routes.walletView,
        page: () => const WalletView(),
        binding: WalletBinding()),
    GetPage(
        name: Routes.starDetailView,
        page: () => const StarDetailView(),
        binding: StarDetailBinding()),
    GetPage(
        name: Routes.tripHistoryRecord,
        page: () => const TripHistoryRecordBaseView(),
        binding: TripHistoryRecordBinding()),
    GetPage(
        name: Routes.shop,
        page: () => const ShopView(),
        binding: ShopBinding()),
    GetPage(
        name: Routes.editOrderView,
        page: () => const EditOrderView(),
        binding: ShopBinding()),
    GetPage(
        name: Routes.returnOrderView,
        page: () => const ReturnOrderView(),
        binding: ShopBinding()),
    GetPage(
        name: Routes.cartView,
        page: () => const CartView(),
        binding: CartBinding()),
    GetPage(
        name: Routes.trayView,
        page: () => const TrayView(),
        binding: CartBinding()),
    GetPage(
        name: Routes.messageView,
        page: () => const MessageView(),
        binding: MessageBinding()),
    GetPage(
        name: Routes.audioCall,
        page: () => const AudioCallView(),
        binding: CallBinding()),
    GetPage(
        name: Routes.videoCall,
        page: () => const VideoCallView(),
        binding: CallBinding()),
    GetPage(
        name: Routes.scheduleMeeting,
        page: () => const ScheduleMeetingView(),
        binding: ScheduleMeetingBinding()),
    GetPage(
        name: Routes.createMeeting,
        page: () => const CreateMeeting(),
        binding: ScheduleMeetingBinding()),
    GetPage(
        name: Routes.busRating,
        page: () => const BusRatingView(),
        binding: RatingBinding()),
    GetPage(
        name: Routes.staffRating,
        page: () => const StaffRatingView(),
        binding: RatingBinding()),
    GetPage(
        name: Routes.supervisorRating,
        page: () => const SupervisorRatingView(),
        binding: RatingBinding()),
    GetPage(
        name: Routes.newsView,
        page: () => const NewsView(),
        binding: NewsBinding()),
    GetPage(
        name: Routes.deactivationDetails,
        page: () => const DeactivationDetailsView(),
        binding: ActivationBinding()),
    GetPage(
        name: Routes.activationRequest,
        page: () => const ActivationRequestView(),
        binding: ActivationBinding()),
    GetPage(
        name: Routes.fireEmergency,
        page: () => const FireEmergencyView(),
        binding: SOSBinding()),
    GetPage(
        name: Routes.sosAssembly,
        page: () => const SosAssemblyView(),
        binding: SOSBinding()),
    GetPage(
        name: Routes.qrScanner,
        page: () => const QrScannerView(),
        binding: SOSBinding()),
    GetPage(
        name: Routes.taskReminderView,
        page: () => const TaskAndReminderView(),
        binding: TaskAndReminderBinding()),
    GetPage(
        name: Routes.addTaskReminder,
        page: () => const SetReminderView(),
        binding: TaskAndReminderBinding()),
    GetPage(
        name: Routes.eventsView,
        page: () => const EventsView(),
        binding: EventsBinding()),
    GetPage(
        name: Routes.eventDetailsView,
        page: () => const EventDetailsView(),
        binding: EventsBinding()),
    GetPage(
        name: Routes.annualSchedule,
        page: () => const AnnualSchedule(),
        binding: AnnualBinding()),
    GetPage(
        name: Routes.annualScheduledetail,
        page: () => const AnnualScheduleDetail(),
        binding: AnnualDetailBinding()),
    GetPage(
      name: Routes.aboutApp,
      page: () => const AboutAppView(),
    ),
    GetPage(
      name: Routes.tripView,
      page: () => const TripOperationView(),
    ),
    GetPage(
      name: Routes.myRouteView,
      page: () => const MyRoute(),
        binding: MyRouteBinding()
    ),
    GetPage(
      name: Routes.myRouteDescriptionView,
      page: () => const MyRouteDescriptionView(),
      binding: MyRouteBinding()

    ),
    GetPage(
        name: Routes.workSheetView,
        page: () => const WorkSheetView(),
        binding: MyRouteBinding()

    ),
    GetPage(
        name: Routes.workSheetQuizView,
        page: () => const WorksheetQuizView(),
        binding: WorksheetQuizBinding()

    ),
  ];
}
