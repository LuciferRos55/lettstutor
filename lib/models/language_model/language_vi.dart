import 'package:lettstutor/models/language_model/language.dart';

class VietNamese extends Language {
  VietNamese() {
    name = "VI";
  }

  // Login Page
  @override
  get email => "Email";
  @override
  get password => "Mật khẩu";
  @override
  get signUpQuestion => "Chưa có tài khoản? ";
  @override
  get signUp => "Đăng ký";
  @override
  get signIn => "Đăng nhập";
  @override
  get forgotPassword => "Quên mật khẩu ?";
  @override
  get continueWith => "Đăng nhập với";
  @override
  get invalidEmail => "Email không hợp lệ.";
  @override
  get emptyField => "Vui lòng điền đầy đủ thông tin.";
  @override
  get passwordTooShort => "Mật khẩu ít nhất 6 ký tự.";
  @override
  get forgotPasswordFail => "Reset mật khẩu không thành công.";
  @override
  get forgotPasswordSuccess => "Reset mật khẩu thành công, vui lòng kiểm tra email.";

  // Sign Up Page
  @override
  get confirmPassword => "Xác nhận mật khẩu";
  @override
  get loginQuestion => "Đã có tài khoản? ";
  @override
  get errEnterAllFields => "Vui lòng nhập đầy đủ thông tin";
  @override
  get errPasswordMismatch => "Mật khẩu không khớp";

  // Reset Password Page
  @override
  get resetPassword => "Đặt lại mật khẩu";
  @override
  get gobackLogin => "Quay lại đăng nhập";

  // Home Page
  @override
  get home => "Trang chủ";
  @override
  get totalLessonTime => "Tổng thời gian học là ";
  @override
  get enterRoom => "Vào phòng học";
  @override
  get recommendTutor => "Gợi ý gia sư";
  @override
  get seeAll => "Xem tất cả";
  @override
  get welcome => "Chào mừng đến với LetTutor";
  @override
  get nextLesson => "Buổi học tiếp theo";
  @override
  get bookAlesson => "Đặt lịch học";

  // Profile page
  @override
  get profile => "Hồ sơ";
  @override
  get fullName => "Họ tên";
  @override
  get birthday => "Ngày sinh";
  @override
  get phone => "Số điện thoại";
  @override
  get country => "Quốc gia";
  @override
  get level => "Trình độ";
  @override
  get wantToLearn => "Muốn học";
  @override
  get save => "Lưu";
  @override
  get errGetNewProfile => "Không thể cập nhật mới hồ sơ.";
  @override
  get errUploadAvatar => "Thay đổi ảnh đại diện không thành công";
  @override
  get successUploadAvatar => "Thay đổi ảnh đại diện thành công";
  @override
  get errUpdateProfile => "Cập nhật hồ sơ không thành công";
  @override
  get successUpdateProfile => "Cập nhật hồ sơ thành công";
  @override
  get errPhoneNumber => "Số điện thoại không hợp lệ";
  @override
  get errEnterName => "Vui lòng nhập họ tên";
  @override
  get errBirthday => "Ngày sinh không hợp lệ";

  // Course page
  @override
  get course => "Khoá học";
  @override
  get searchCourse => "Tìm kiếm khoá học...";
  @override
  get lesson => " Bài học";
  @override
  get errNotAnyResult => "Không tìm thấy kết quả tương ứng...";

  // Course Detail
  @override
  get aboutCourse => "Thông tin";
  @override
  get overview => "Tổng quan";
  @override
  get why => "Tại sao bạn nên học khóa học này?";
  @override
  get what => "Bạn có thể làm gì?";
  @override
  get topic => "Chủ đề";
  @override
  get tutor => "Gia sư";

  // Ebook tab
  @override
  get ebook => "Giáo trình";
  @override
  get searchEbook => "Tìm kiếm giáo trình...";

  // Upcoming Page
  @override
  get upcoming => "Sắp diễn ra";
  @override
  get cancel => "Huỷ bỏ";
  @override
  get goToMeeting => "Vào phòng học";
  @override
  get dontHaveUpcoming => "Hiện tại bạn không có buổi học nào sắp diễn ra";
  @override
  get removeUpcomingSuccess => "Huỷ buổi học thành công";
  @override
  get removeUpcomingFail => "Bạn chỉ có thể huỷ buổi học trước giờ học 2 tiếng";

  // Tutor search page and Tutor detail page
  @override
  get tutors => "Gia sư";
  @override
  get searchTutor => "Tìm kiếm gia sư...";
  @override
  get booking => "Đặt lịch học";
  @override
  get languages => "Ngôn ngữ";
  @override
  get interests => "Sở thích";
  @override
  get specialties => "Chuyên ngành";
  @override
  get rateAndComment => "Đánh giá và bình luận";
  @override
  get selectSchedule => "Chọn lịch học";
  @override
  get selectScheduleDetail => "Chọn giờ học";
  @override
  get bookingSuccess => "Đặt lịch học thành công";

  // Setting page
  @override
  get setting => "Cài đặt";
  @override
  get changePassword => "Đổi mật khẩu";
  @override
  get sessionHistory => "Lịch sử các buổi học";
  @override
  get advancedSetting => "Cài đặt nâng cao";
  @override
  get ourWebsite => "Trang web của chúng tôi";
  @override
  get logout => "Đăng xuất";

  // Change password page
  @override
  get newPassword => "Mật khẩu mới";
  @override
  get confirmNewPassword => "Nhập lại mật khẩu mới";
  @override
  get passwordAtLeast => "Mật khẩu phải có ít nhất 6 ký tự";
  @override
  get changePasswordSuccess => "Đổi mật khẩu thành công";

  // Session history page
  @override
  get giveFeedback => "Đánh giá";
  @override
  get watchRecord => "Xem lại buổi học";
  @override
  get mark => "Điểm số: ";
  @override
  get tutorNotMark => "Gia sư chưa chấm điểm";
  @override
  get emptySession => "Bạn chưa tham gia buổi học nào !";

  // Feedback page
  @override
  get feedback => "Đánh giá";
  @override
  get hintFeedback => "Nhập nội dung đánh giá của bạn...";
  @override
  get errEnterFeedback => "Vui lòng nhập nội dung đánh giá";
  @override
  get errFeedbackLength => "Nội dung đánh giá phải có ít nhất 3 từ";
  @override
  get successFeedback => "Đánh giá thành công";
}
