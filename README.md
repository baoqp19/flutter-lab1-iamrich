# I Am Rich

Ứng dụng Flutter nhập môn: hiển thị chữ **I Am Rich**, hình kim cương từ
`images/diamond.png`, biểu tượng Material và Cupertino trên nền xanh đậm.
Ứng dụng hoạt động ngoại tuyến, không cần tài khoản hoặc API.

## Chạy ứng dụng

Cài Flutter SDK (Dart >= 3.8), thêm `flutter/bin` vào PATH rồi chạy:

```sh
flutter doctor
flutter pub get
flutter devices
flutter run
flutter emulators --launch Pixel_10
flutter run -d emulator-5554
```

Mở Android Emulator hoặc kết nối điện thoại Android đã bật USB debugging trước
khi chạy. Có thể chạy bản web bằng `flutter run -d chrome`.
Để chạy iOS cần macOS, Xcode và iOS Simulator hoặc thiết bị iOS.

## Cấu trúc dự án

```text
lib/main.dart             Điểm khởi chạy, theme và giao diện
images/diamond.png        Hình kim cương có nền trong suốt
tools/create_diamond.ps1  Mã vẽ và tạo lại ảnh trên Windows
test/widget_test.dart    Kiểm tra giao diện và kích thước màn hình
pubspec.yaml             Phiên bản, dependencies và tài nguyên
android/                 Cấu hình ứng dụng Android
ios/                     Cấu hình ứng dụng iOS
web/                     Cấu hình ứng dụng web
```

## Các kiến thức chính

- `main()` gọi `runApp()` để chạy `IAmRichApp`.
- `MaterialApp`, `ThemeData`, `Scaffold` và `AppBar` tạo cấu trúc Material Design.
- `Column`, `SizedBox`, `Container` và `Text` sắp xếp nội dung.
- `Image.asset` đọc ảnh đã khai báo trong `pubspec.yaml`.
- `Icons.diamond_outlined` thuộc Material Icons; `CupertinoIcons.sparkles`
  thuộc package `cupertino_icons`.
- `SafeArea` tránh vùng camera/thanh hệ thống; `SingleChildScrollView`
  cho phép cuộn khi màn hình thấp hoặc cỡ chữ lớn.
- `semanticLabel` mô tả hình ảnh cho trình đọc màn hình.

## Quản lý tài nguyên với pubspec.yaml

Giữ đúng thụt lề bằng dấu cách, đặt tệp ảnh trong `images/` rồi khai báo:

```yaml
flutter:
  uses-material-design: true
  assets:
    - images/diamond.png
```

Sau khi sửa dependencies hoặc assets, chạy `flutter pub get`. Nếu thêm ảnh mới
trong khi ứng dụng đang chạy, thực hiện hot restart.
Ảnh kim cương được vẽ bằng mã trong dự án; không phụ thuộc nguồn ảnh bên ngoài.
Tạo lại ảnh trên Windows bằng:

```powershell
powershell -ExecutionPolicy Bypass -File tools/create_diamond.ps1
```

Ứng dụng hiện dùng font mặc định của Flutter. Để học cách dùng font riêng,
đặt tệp font được cấp phép trong `fonts/`, thêm khai báo dưới `flutter:`:

```yaml
  fonts:
    - family: MyFont
      fonts:
        - asset: fonts/MyFont-Regular.ttf
```

Sau đó dùng `TextStyle(fontFamily: 'MyFont')` hoặc
`ThemeData(fontFamily: 'MyFont')`. Đây là ví dụ mở rộng; chỉ khai báo khi có tệp
font thực tế.

## Kiểm tra và build

```sh
flutter analyze
flutter test
flutter build apk --debug
flutter build web
```

Build Android cần Android SDK/JDK theo hướng dẫn của `flutter doctor`.
Các bài kiểm tra xác nhận nội dung, giải mã ảnh, biểu tượng Cupertino và bố cục
ở màn hình nhỏ, màn hình ngang, màn hình lớn và cỡ chữ tăng.
