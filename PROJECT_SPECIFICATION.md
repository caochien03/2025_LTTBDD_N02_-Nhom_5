# 📋 ĐẶC TẢ DỰ ÁN TRAVELMATE

## 🎯 **THÔNG TIN DỰ ÁN**

**Tên dự án:** TravelMate - Nhật ký & Trợ lý Du lịch Cá nhân 🧳🌍  
**Môn học:** Lập trình cho thiết bị di động  
**Khóa:** 2025*LTTBDD_N02 - Nhóm 5  
**Số thành viên:** 2 người  
**Repository:** https://github.com/caochien03/2025_LTTBDD_N02*-Nhom_5.git

---

## 📱 **MỤC TIÊU DỰ ÁN**

TravelMate là một ứng dụng nhật ký du lịch cá nhân, giúp người dùng:

-   Ghi lại hành trình du lịch với ảnh, ghi chú, cảm xúc
-   Khám phá địa điểm du lịch và tạo wishlist
-   Quản lý nhật ký theo album địa điểm (giống Locket)
-   Hỗ trợ đa ngôn ngữ (Anh - Việt) và Dark Mode

---

## 🏗️ **CẤU TRÚC DỰ ÁN**

```
btl_travelmate/
├── lib/
│   ├── main.dart                    # Entry point
│   ├── models/                      # Data models
│   │   ├── user.dart               # Thông tin nhóm/người dùng
│   │   ├── location.dart           # Địa điểm du lịch
│   │   ├── favorite.dart           # Địa điểm yêu thích
│   │   ├── diary_album.dart        # Album nhật ký
│   │   └── diary_entry.dart        # Ảnh/video trong album
│   │
│   ├── screens/                     # UI Screens
│   │   ├── profile/                # Trang thông tin cá nhân
│   │   ├── explore/                # Trang khám phá địa điểm
│   │   ├── favorites/              # Trang yêu thích
│   │   └── diary/                  # Trang nhật ký
│   │
│   ├── widgets/                     # Reusable components
│   ├── services/                    # Business logic & Firebase
│   ├── data/                        # Sample data
│   ├── utils/                       # Helper functions
│   ├── themes/                      # App theming
│   ├── localization/                # Multi-language support
│   └── providers/                   # State management
```

---

## 🎨 **4 TÍNH NĂNG CHÍNH**

### **1. 👤 Trang Thông Tin Cá Nhân (Profile)**

**Chức năng:**

-   Hiển thị thông tin nhóm (tên, thành viên, môn học, năm)
-   Thông tin liên hệ (email, phone)
-   Giới thiệu về ứng dụng TravelMate
-   Cài đặt (theme, ngôn ngữ)

**UI Components:**

-   Profile header với avatar nhóm
-   Information cards
-   Settings toggle switches
-   About section

---

### **2. 🗺️ Trang Khám Phá (Explore)**

**Chức năng:**

-   Hiển thị danh sách địa điểm du lịch
-   Filter theo tỉnh thành
-   Chi tiết địa điểm (mô tả, hình ảnh, đặc sản)
-   Thêm vào yêu thích

**UI Components:**

-   Search bar
-   Filter chips (theo tỉnh thành)
-   Location cards với ảnh
-   Detail screen với gallery

---

### **3. ❤️ Trang Yêu Thích (Favorites)**

**Chức năng:**

-   Danh sách địa điểm đã yêu thích
-   Ghi chú kế hoạch du lịch
-   Đánh dấu đã đến/chuẩn bị đi
-   Tạo trip planning

**UI Components:**

-   Tab view: Wishlist | Planned | Visited
-   Favorite cards
-   Planning form
-   Status indicators

---

### **4. 📖 Trang Nhật Ký (Diary)**

**Chức năng:**

-   Album theo địa điểm (giống Locket)
-   Upload ảnh/video từ gallery
-   Chụp ảnh trực tiếp
-   Ghi chú cho từng ảnh
-   Timeline view

**UI Components:**

-   Album grid view
-   Photo gallery
-   Camera integration
-   Timeline interface

---

## 🔧 **CÔNG NGHỆ SỬ DỤNG**

### **Frontend:**

-   **Flutter** - Cross-platform framework
-   **Material Design 3** - UI/UX guidelines
-   **Provider** - State management
-   **Go Router** - Navigation

### **Backend:**

-   **Firebase Authentication** - User management
-   **Cloud Firestore** - Database
-   **Firebase Storage** - File storage
-   **Firebase Analytics** - Usage tracking

### **Dependencies chính:**

```yaml
dependencies:
    # Firebase
    firebase_core: ^2.24.2
    firebase_auth: ^4.15.3
    cloud_firestore: ^4.13.6
    firebase_storage: ^11.6.0

    # Camera & Photos
    image_picker: ^1.0.4
    camera: ^0.10.5+5

    # UI & State
    provider: ^6.1.1
    go_router: ^12.1.3

    # Maps
    google_maps_flutter: ^2.5.0

    # Image handling
    cached_network_image: ^3.3.0
    photo_view: ^0.14.0

    # Localization
    flutter_localizations:
        sdk: flutter
```

---

## 📊 **DATA MODELS**

### **User Model:**

```dart
class User {
  final String id;
  final String groupName;
  final List<String> members;
  final String projectInfo;
  final String course;
  final String year;
  final String email;
  final String phone;
}
```

### **Location Model:**

```dart
class Location {
  final String id;
  final String name;              // "Vịnh Hạ Long"
  final String province;          // "Quảng Ninh"
  final String description;
  final List<String> images;
  final List<String> specialties; // "Chả mực, Cua biển"
  final List<String> attractions;
  final double rating;
  final String category;
  final GeoPoint coordinates;
}
```

### **Favorite Model:**

```dart
class Favorite {
  final String id;
  final String userId;
  final String locationId;
  final DateTime addedDate;
  final String notes;
  final DateTime plannedDate;
  final bool isVisited;
}
```

### **DiaryAlbum Model:**

```dart
class DiaryAlbum {
  final String id;
  final String userId;
  final String locationId;
  final String albumName;
  final DateTime createdDate;
  final List<DiaryEntry> entries;
  final String coverImage;
}
```

### **DiaryEntry Model:**

```dart
class DiaryEntry {
  final String id;
  final String albumId;
  final String mediaType;         // 'image' hoặc 'video'
  final String mediaUrl;
  final String caption;
  final DateTime takenDate;
  final GeoPoint location;
}
```

---

## 🔥 **FIREBASE STRUCTURE**

### **Collections:**

```javascript
users/{userId}/
  ├── profile: User data
  ├── favorites/{favoriteId}/
  │   ├── locationId: string
  │   ├── addedDate: timestamp
  │   ├── notes: string
  │   └── plannedDate: timestamp
  │
  └── diary_albums/{albumId}/
      ├── locationId: string
      ├── albumName: string
      ├── createdDate: timestamp
      └── entries/{entryId}/
          ├── mediaType: string
          ├── mediaUrl: string
          ├── caption: string
          └── takenDate: timestamp

locations/{locationId}/
  ├── name: string
  ├── province: string
  ├── description: string
  ├── images: array<string>
  ├── specialties: array<string>
  ├── attractions: array<string>
  ├── rating: number
  ├── category: string
  └── coordinates: GeoPoint
```

---

## 📱 **UI/UX DESIGN**

### **Color Scheme:**

-   **Primary:** Travel-themed colors (Ocean Blue, Sunset Orange)
-   **Secondary:** Nature colors (Forest Green, Sand Beige)
-   **Accent:** Vibrant colors for highlights
-   **Support:** Dark/Light mode variants

### **Typography:**

-   **Headings:** Roboto Bold
-   **Body:** Roboto Regular
-   **Captions:** Roboto Light

### **Navigation:**

-   **Bottom Navigation Bar** với 4 tabs:
    -   Profile (👤)
    -   Explore (🗺️)
    -   Favorites (❤️)
    -   Diary (📖)

### **Responsive Design:**

-   Support multiple screen sizes
-   Phone: 360x640, 375x667, 414x896
-   Tablet: 768x1024, 834x1194

---

## 🌍 **LOCALIZATION**

### **Languages:**

-   **English (en)** - Default
-   **Vietnamese (vi)** - Native

### **Key Strings:**

```dart
// Profile
"group_info" -> "Thông tin nhóm" / "Group Information"
"about_app" -> "Giới thiệu ứng dụng" / "About App"

// Explore
"discover_locations" -> "Khám phá địa điểm" / "Discover Locations"
"filter_by_province" -> "Lọc theo tỉnh thành" / "Filter by Province"

// Favorites
"my_favorites" -> "Yêu thích của tôi" / "My Favorites"
"plan_trip" -> "Lên kế hoạch" / "Plan Trip"

// Diary
"travel_diary" -> "Nhật ký du lịch" / "Travel Diary"
"add_photo" -> "Thêm ảnh" / "Add Photo"
```

---

## 📋 **SAMPLE DATA**

### **Locations (50+ địa điểm):**

```dart
final List<Location> sampleLocations = [
  Location(
    id: "1",
    name: "Vịnh Hạ Long",
    province: "Quảng Ninh",
    description: "Di sản thế giới với hàng nghìn đảo đá vôi...",
    specialties: ["Chả mực", "Cua biển", "Tôm tít"],
    attractions: ["Đảo Tuần Châu", "Hang Sửng Sốt", "Làng chài Cửa Vạn"],
    images: ["halong1.jpg", "halong2.jpg", "halong3.jpg"],
    rating: 4.8,
    category: "Biển đảo",
    coordinates: GeoPoint(20.9101, 107.1839),
  ),
  // ... more locations
];
```

### **Provinces (15+ tỉnh thành):**

```dart
final List<String> provinces = [
  "Hà Nội", "TP. Hồ Chí Minh", "Đà Nẵng", "Quảng Ninh",
  "Lào Cai", "Nghệ An", "Thừa Thiên Huế", "Quảng Nam",
  "Khánh Hòa", "Lâm Đồng", "An Giang", "Kiên Giang",
  "Cà Mau", "Phú Quốc", "Côn Đảo"
];
```

---

## 🚀 **DEVELOPMENT PHASES**

### **Phase 1: Foundation (Tuần 1)**

-   [x] Setup project structure
-   [ ] Add dependencies to pubspec.yaml
-   [ ] Create data models
-   [ ] Setup Firebase project
-   [ ] Create basic navigation

### **Phase 2: Core Features (Tuần 2)**

-   [ ] Profile screen với thông tin nhóm
-   [ ] Explore screen với sample data
-   [ ] Filter functionality
-   [ ] Favorites management
-   [ ] Basic diary functionality

### **Phase 3: Advanced Features (Tuần 3)**

-   [ ] Camera integration
-   [ ] Photo/video upload to Firebase
-   [ ] Album management
-   [ ] Trip planning features
-   [ ] Localization (Anh/Việt)
-   [ ] Dark/Light theme
-   [ ] Polish UI/UX

---

### **Chung:**

-   Code review
-   Testing
-   Documentation
-   Demo preparation

---

## 📝 **REPORT REQUIREMENTS**

### **Báo cáo (10 điểm):**

1. **Tính năng (2 điểm):** 4 tính năng chính hoạt động
2. **Giao diện (4 điểm):** Đẹp, nhất quán, responsive
3. **Báo cáo (4 điểm):** Tài liệu chi tiết

### **Nội dung báo cáo:**

1. Giới thiệu dự án
2. Phân tích yêu cầu
3. Thiết kế UI/UX
4. Kiến trúc ứng dụng
5. Tính năng chính
6. Demo & Screenshots
7. Kết luận

### **Slide presentation (10 slides):**

1. Title slide
2. Problem & Solution
3. UI/UX Design (3 slides)
4. Features Demo (3 slides)
5. Technical Implementation
6. Results & Demo
7. Conclusion

---

## 🎯 **SUCCESS CRITERIA**

### **Minimum Viable Product (MVP):**

-   ✅ 4 tính năng chính hoạt động
-   ✅ Firebase integration
-   ✅ Camera functionality
-   ✅ Responsive UI
-   ✅ Multi-language support

### **Nice to Have:**

-   ✅ Offline support
-   ✅ Push notifications
-   ✅ Advanced filtering
-   ✅ Export features
-   ✅ Social sharing

---

## 📞 **LIÊN HỆ & HỖ TRỢ**

**GitHub Repository:** https://github.com/caochien03/2025_LTTBDD_N02_-Nhom_5.git  
**Email:** [Email của nhóm]  
**Deadline:** [Ngày nộp bài]

**Tài liệu tham khảo:**

-   Flutter Documentation: https://docs.flutter.dev/
-   Firebase Documentation: https://firebase.google.com/docs
-   Material Design: https://material.io/design

---

**📅 Ngày tạo:** [Ngày hiện tại]  
**👥 Nhóm:** 2025_LTTBDD_N02 - Nhóm 5  
**🎓 Môn học:** Lập trình cho thiết bị di động
