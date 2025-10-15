# 👥 PHÂN CHIA CÔNG VIỆC - TRAVELMATE PROJECT

## 🎯 **NGUYÊN TẮC PHÂN CHIA**

**Thành viên A (Bạn - Leader):** Các task phức tạp, architecture, Firebase  
**Thành viên B (Cộng sự):** Các task đơn giản, UI components, data mẫu

---

## 📋 **CHI TIẾT PHÂN CHIA CÔNG VIỆC**

### **🏗️ PHASE 1: FOUNDATION (Tuần 1)**

#### **👨‍💻 THÀNH VIÊN A (Bạn - Leader):**

**Độ khó: ⭐⭐⭐⭐**

1. **Setup Firebase Project**

    - Tạo Firebase project
    - Cấu hình Authentication
    - Setup Firestore database
    - Cấu hình Storage
    - **Thời gian:** 1-2 ngày

2. **Setup Dependencies**

    - Cập nhật pubspec.yaml
    - Add Firebase packages
    - Add camera, image picker
    - **Thời gian:** 0.5 ngày

3. **Create Data Models**

    - User model
    - Location model
    - Favorite model
    - DiaryAlbum model
    - DiaryEntry model
    - **Thời gian:** 1 ngày

4. **Setup Navigation**
    - Bottom navigation bar
    - Route configuration
    - Basic routing
    - **Thời gian:** 1 ngày

#### **👨‍💻 THÀNH VIÊN B (Cộng sự):**

**Độ khó: ⭐⭐**

1. **Create Sample Data**

    - Tạo 50+ địa điểm du lịch
    - Thông tin tỉnh thành
    - Đặc sản, điểm nổi bật
    - **Thời gian:** 2 ngày

2. **Basic UI Components**

    - Custom buttons
    - Loading widgets
    - Error widgets
    - **Thời gian:** 1 ngày

3. **Theme Setup**
    - Color palette
    - Text styles
    - Basic theme
    - **Thời gian:** 1 ngày

---

### **🎨 PHASE 2: CORE FEATURES (Tuần 2)**

#### **👨‍💻 THÀNH VIÊN A (Bạn - Leader):**

**Độ khó: ⭐⭐⭐⭐**

1. **Firebase Services**

    - Auth service (login/register)
    - Firestore service
    - Storage service
    - **Thời gian:** 2 ngày

2. **Explore Screen Logic**

    - Location filtering
    - Search functionality
    - Firebase integration
    - **Thời gian:** 2 ngày

3. **Favorites Management**
    - Add/remove favorites
    - Firebase CRUD operations
    - **Thời gian:** 1 ngày

#### **👨‍💻 THÀNH VIÊN B (Cộng sự):**

**Độ khó: ⭐⭐**

1. **Profile Screen UI**

    - Thông tin nhóm
    - About section
    - Settings toggles
    - **Thời gian:** 2 ngày

2. **Location Cards**

    - Location card widget
    - Favorite card widget
    - Basic animations
    - **Thời gian:** 2 ngày

3. **Explore Screen UI**
    - Grid/list view
    - Filter chips
    - Search bar UI
    - **Thời gian:** 1 ngày

---

### **🚀 PHASE 3: ADVANCED FEATURES (Tuần 3)**

#### **👨‍💻 THÀNH VIÊN A (Bạn - Leader):**

**Độ khó: ⭐⭐⭐⭐⭐**

1. **Camera Integration**

    - Camera service
    - Photo/video capture
    - Image processing
    - **Thời gian:** 2 ngày

2. **Diary Management**

    - Album CRUD operations
    - Photo upload to Firebase
    - Timeline functionality
    - **Thời gian:** 2 ngày

3. **Localization**
    - i18n setup
    - English/Vietnamese strings
    - Language switching
    - **Thời gian:** 1 ngày

#### **👨‍💻 THÀNH VIÊN B (Cộng sự):**

**Độ khó: ⭐⭐**

1. **Diary UI Components**

    - Album grid view
    - Photo gallery
    - Timeline UI
    - **Thời gian:** 2 ngày

2. **Favorites UI**

    - Tab view
    - Planning form
    - Status indicators
    - **Thời gian:** 2 ngày

3. **Polish & Testing**
    - UI improvements
    - Basic testing
    - Bug fixes
    - **Thời gian:** 1 ngày

---

## 📊 **TỔNG QUAN PHÂN CHIA**

### **🎯 Thành viên A (Bạn - Leader):**

**Tổng thời gian:** ~12 ngày  
**Độ khó trung bình:** ⭐⭐⭐⭐  
**Trách nhiệm:**

-   Architecture & Firebase
-   Complex logic & services
-   Camera & file handling
-   Integration & debugging

### **🎯 Thành viên B (Cộng sự):**

**Tổng thời gian:** ~12 ngày  
**Độ khó trung bình:** ⭐⭐  
**Trách nhiệm:**

-   UI components
-   Sample data
-   Basic screens
-   Testing & polish

---

## 📋 **CHECKLIST CHO THÀNH VIÊN B (Cộng sự)**

### **✅ Tuần 1:**

-   [ ] Tạo file `lib/data/sample_locations.dart`
-   [ ] Tạo file `lib/data/provinces_data.dart`
-   [ ] Tạo file `lib/widgets/custom_button.dart`
-   [ ] Tạo file `lib/widgets/loading_widget.dart`
-   [ ] Tạo file `lib/themes/app_colors.dart`
-   [ ] Tạo file `lib/themes/app_text_styles.dart`

### **✅ Tuần 2:**

-   [ ] Tạo file `lib/screens/profile/profile_screen.dart`
-   [ ] Tạo file `lib/widgets/location_card.dart`
-   [ ] Tạo file `lib/widgets/favorite_card.dart`
-   [ ] Tạo file `lib/screens/explore/explore_screen.dart`
-   [ ] Tạo file `lib/widgets/filter_chips.dart`

### **✅ Tuần 3:**

-   [ ] Tạo file `lib/screens/diary/diary_screen.dart`
-   [ ] Tạo file `lib/widgets/album_card.dart`
-   [ ] Tạo file `lib/widgets/photo_grid.dart`
-   [ ] Tạo file `lib/screens/favorites/favorites_screen.dart`
-   [ ] Testing và bug fixes

---

## 🎯 **HƯỚNG DẪN CHO THÀNH VIÊN B**

### **📚 Resources cần đọc:**

1. **Flutter Basics:** https://docs.flutter.dev/get-started/codelab
2. **Widget Catalog:** https://docs.flutter.dev/development/ui/widgets
3. **Material Design:** https://material.io/design

### **🛠️ Tools cần cài:**

1. **VS Code** hoặc **Android Studio**
2. **Flutter SDK**
3. **Git** để sync code

### **📖 Coding Guidelines:**

```dart
// 1. Luôn comment code
class LocationCard extends StatelessWidget {
  // Widget hiển thị thông tin địa điểm
  const LocationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return UI widget
  }
}

// 2. Đặt tên biến rõ ràng
final String locationName = "Vịnh Hạ Long";
final List<String> imageUrls = ["url1", "url2"];

// 3. Sử dụng const khi có thể
const EdgeInsets padding = EdgeInsets.all(16.0);
```

### **🚨 Khi gặp khó khăn:**

1. **Đọc error message** kỹ
2. **Search Google** với error message
3. **Hỏi thành viên A** (bạn)
4. **Commit code** thường xuyên

---

## 📅 **TIMELINE CHI TIẾT**

### **📅 Tuần 1:**

```
Thứ 2: Thành viên A - Firebase setup
       Thành viên B - Sample data

Thứ 3: Thành viên A - Dependencies & Models
       Thành viên B - Sample data (tiếp)

Thứ 4: Thành viên A - Navigation setup
       Thành viên B - Basic UI components

Thứ 5: Thành viên A - Testing & debugging
       Thành viên B - Theme setup

Thứ 6: Review & integration
```

### **📅 Tuần 2:**

```
Thứ 2: Thành viên A - Firebase services
       Thành viên B - Profile screen UI

Thứ 3: Thành viên A - Explore logic
       Thành viên B - Location cards

Thứ 4: Thành viên A - Favorites logic
       Thành viên B - Explore UI

Thứ 5: Integration & testing
Thứ 6: Review & polish
```

### **📅 Tuần 3:**

```
Thứ 2: Thành viên A - Camera integration
       Thành viên B - Diary UI

Thứ 3: Thành viên A - Diary logic
       Thành viên B - Favorites UI

Thứ 4: Thành viên A - Localization
       Thành viên B - Polish & testing

Thứ 5: Final integration
Thứ 6: Demo preparation
```

---

## 🎯 **SUCCESS METRICS**

### **✅ Thành viên A hoàn thành:**

-   Firebase hoạt động ổn định
-   4 tính năng chính có logic
-   Camera integration
-   App có thể demo

### **✅ Thành viên B hoàn thành:**

-   Tất cả UI screens đẹp
-   Sample data đầy đủ
-   Components tái sử dụng được
-   App responsive

### **✅ Cả nhóm:**

-   App chạy được trên device
-   Không crash
-   UI/UX đẹp
-   Demo smooth

---

## 📞 **COMMUNICATION PLAN**

### **Daily Check-in:**

-   **Thời gian:** 9:00 AM mỗi ngày
-   **Nội dung:** Progress update, blockers, next steps
-   **Tools:** Discord/Telegram

### **Code Review:**

-   **Thời gian:** Cuối mỗi ngày
-   **Process:** Pull request review
-   **Focus:** Code quality, functionality

### **Weekly Sync:**

-   **Thời gian:** Thứ 6 mỗi tuần
-   **Nội dung:** Week summary, next week planning
-   **Tools:** Video call

---

**📅 Ngày tạo:** [Ngày hiện tại]  
**👥 Nhóm:** 2025_LTTBDD_N02 - Nhóm 5  
**📧 Contact:** [Email của bạn]
