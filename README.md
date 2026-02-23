# Lập trình Thiết bị Di động: Nhắc Thuốc (Pill Reminder App) 💊

Ứng dụng hỗ trợ nhắc nhở thời gian uống thuốc cho người dùng, thiết kế đặc biệt tập trung vào **Giao diện (UI) đẹp, trực quan, độ tương phản cao** và trải nghiệm thân thiện cho người lớn tuổi. Hỗ trợ đa ngôn ngữ Anh - Việt.

## Thông tin Nhóm Phát triển (Bắt buộc)

- **Đề tài:** Phần mềm Nhắc Thuốc (Pill Reminder App).
- **Môn học:** Lập trình cho thiết bị di động.
- **Giảng viên hướng dẫn:** Thầy que.nguyenxuan@phenikaa-uni.edu.vn.
- **Kho lưu trữ (Repository):** `2025_2_LTTBDD_N0x_Nhom_i`.

### Thành viên nhóm

| STT | Họ và Tên | Mã số Sinh viên | Vai trò | Tỉ lệ đóng góp |
| :--- | :--- | :--- | :--- | :--- |
| 1 | [Tên Thành Viên 1] | [MSSV 1] | Nhóm trưởng / Developer | 100% |
| 2 | [Tên Thành Viên 2] | [MSSV 2] | Developer / Designer | 100% |
*(Ghi chú: Vui lòng thay thế mã nhóm N0x, Nhom_i, và thông tin thành viên bằng thông tin thật của nhóm bạn)*

## Tính năng Chính (Features)

*   **Đa ngôn ngữ (i18n):** Chuyển đổi mượt mà giữa Tiếng Anh và Tiếng Việt.
*   **Danh sách Nhắc thuốc:** Liệt kê các cữ thuốc trong ngày bằng các thẻ thân thiện, chữ to, rõ ràng.
*   **Thêm Lịch Nhắc:** Thêm các cữ thuốc mới thông qua giao diện dễ sử dụng (chọn icon viên thuốc, chọn giờ).
*   **Thông báo (Local Notification):** Popup nhắc nhở người dùng khi đến giờ. (Các tính năng xử lý Logic có thể chạy qua dữ liệu ảo để phục vụ việc Demo UI).
*   **Trang thông tin Nhóm:** Trang tĩnh giới thiệu ngắn gọn thông tin sinh viên làm đề tài.

## Yêu cầu Kỹ thuật (Technical Requirements)

*   **Framework:** Flutter (Hỗ trợ Build iOS & Android).
*   **Cơ sở dữ liệu:** Không (Lưu tạm vào biến / Mảng trong RAM để dễ dàng demo UI).
*   **Thư viện:** 
    *   Đa ngôn ngữ: `intl`
    *   Giao diện: `google_fonts` (nếu dùng font ngoài), icon set tuỳ chỉnh.

## Hướng dẫn Chạy Ứng dụng (Getting Started)

Dự án này là điểm khởi đầu cho một ứng dụng Flutter. Để chạy source code này trên máy của bạn:

1. Đảm bảo bạn đã cài đặt Flutter SDK và cấu hình đúng biến môi trường.
2. Clone repository này về máy.
3. Chạy lệnh để cài đặt các package:
   ```bash
   flutter pub get
   ```
4. Chọn máy ảo (Emulator) hoặc thiết bị vật lý thật.
5. Chạy ứng dụng:
   ```bash
   flutter run
   ```

Tài nguyên tham khảo dành cho người mới:
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
