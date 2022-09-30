# Sample Clean Architecture

## Cấu trúc

### 1. Thư mục CORE

| Thư mục | Mô tả |
| ------ | ---------- |
| [base](lib/core/base) | Chứa các lớp trừu tượng, tổng quát |
| [constants](lib/core/constants) | Khai báo hằng, enum,... |
| [network](lib/core/network) | Liên quan tới network |
| [utils/extensions](lib/core/utils/extensions) | Chứa các method mở rộng cho các lớp |
| [utils/log](lib/core/utils/log) | Quản lý logger |
| [utils/navigation](lib/core/utils/navigation) | Quản lý route, deeplink |
| [utils/tracking](lib/core/utils/tracking) | Quản lý tracking |
| [utils/utilities.dart](lib/core/utils/utilities.dart) | Chứa các hàm hỗ trợ không biết đặt vào thư mục nào* |
| [widgets](lib/core/widgets) | Các widget dùng chung |

\* Có thể thêm thư mục khác trong [utils](lib/core/utils)

### 2. Thư mục FEATURES
- Chứa các tính năng của app được thiết kế theo 3 tầng: data, domain, presentation

### 3. Tập tin [injection_container.dart](lib/injection_container.dart)
- Đăng ký singleton instance cho các class (usecase, repository, data source)

## Lệnh
- Generate code:
`fvm flutter packages pub run build_runner build --delete-conflicting-outputs`