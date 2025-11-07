import 'package:flutter/material.dart';

/// Helper class to provide localized location data
class LocationTranslations {
  static Map<String, Map<String, String>> _translations = {
    'ha_long_bay': {
      'name_vi': 'Vịnh Hạ Long',
      'name_en': 'Ha Long Bay',
      'description_vi': 'Di sản thiên nhiên thế giới với hàng nghìn hòn đảo đá vôi kỳ vĩ, một trong những kỳ quan thiên nhiên đẹp nhất Việt Nam.',
      'description_en': 'World natural heritage with thousands of majestic limestone islands, one of Vietnam\'s most beautiful natural wonders.',
      'province_vi': 'Quảng Ninh',
      'province_en': 'Quang Ninh',
    },
    'hoi_an': {
      'name_vi': 'Phố Cổ Hội An',
      'name_en': 'Hoi An Ancient Town',
      'description_vi': 'Thành phố cổ với kiến trúc độc đáo, đèn lồng rực rỡ và văn hóa đa dạng. Di sản văn hóa thế giới UNESCO.',
      'description_en': 'Ancient town with unique architecture, vibrant lanterns and diverse culture. UNESCO World Cultural Heritage.',
      'province_vi': 'Quảng Nam',
      'province_en': 'Quang Nam',
    },
    'sapa': {
      'name_vi': 'Ruộng Bậc Thang Sapa',
      'name_en': 'Sapa Terraced Rice Fields',
      'description_vi': 'Thung lũng ruộng bậc thang tuyệt đẹp, nơi gặp gỡ các dân tộc thiểu số và khám phá văn hóa độc đáo.',
      'description_en': 'Beautiful terraced rice valley, where ethnic minorities meet and unique culture is explored.',
      'province_vi': 'Lào Cai',
      'province_en': 'Lao Cai',
    },
    'da_lat': {
      'name_vi': 'Đà Lạt',
      'name_en': 'Da Lat',
      'description_vi': 'Thành phố ngàn hoa với khí hậu mát mẻ quanh năm, thác nước, hồ và vườn dâu tây.',
      'description_en': 'City of a thousand flowers with cool climate year-round, waterfalls, lakes and strawberry gardens.',
      'province_vi': 'Lâm Đồng',
      'province_en': 'Lam Dong',
    },
    'phu_quoc': {
      'name_vi': 'Phú Quốc',
      'name_en': 'Phu Quoc',
      'description_vi': 'Đảo ngọc với bãi biển cát trắng, nước biển trong xanh, và hải sản tươi ngon.',
      'description_en': 'Pearl island with white sand beaches, crystal clear sea water, and fresh seafood.',
      'province_vi': 'Kiên Giang',
      'province_en': 'Kien Giang',
    },
    'ha_noi': {
      'name_vi': 'Khu Phố Cổ Hà Nội',
      'name_en': 'Hanoi Old Quarter',
      'description_vi': 'Trung tâm lịch sử với 36 phố phường cổ, ẩm thực đường phố phong phú và văn hóa đặc sắc.',
      'description_en': 'Historic center with 36 old streets, rich street food and unique culture.',
      'province_vi': 'Hà Nội',
      'province_en': 'Hanoi',
    },
    'ho_chi_minh': {
      'name_vi': 'Thành phố Hồ Chí Minh',
      'name_en': 'Ho Chi Minh City',
      'description_vi': 'Thành phố năng động với sự pha trộn giữa hiện đại và truyền thống, ẩm thực đa dạng.',
      'description_en': 'Dynamic city with a blend of modern and traditional, diverse cuisine.',
      'province_vi': 'TP. Hồ Chí Minh',
      'province_en': 'Ho Chi Minh City',
    },
    'nha_trang': {
      'name_vi': 'Nha Trang',
      'name_en': 'Nha Trang',
      'description_vi': 'Thành phố biển với bãi tắm đẹp, hoạt động lặn biển và các khu nghỉ dưỡng cao cấp.',
      'description_en': 'Coastal city with beautiful beaches, diving activities and luxury resorts.',
      'province_vi': 'Khánh Hòa',
      'province_en': 'Khanh Hoa',
    },
  };

  static Map<String, Map<String, List<String>>> _specialtiesTranslations = {
    'ha_long_bay': {
      'vi': ['Chả mực', 'Ngán', 'Hải sản tươi sống'],
      'en': ['Squid Cake', 'Ngán Clam', 'Fresh Seafood'],
    },
    'hoi_an': {
      'vi': ['Cao lầu', 'Bánh mì', 'Cơm gà'],
      'en': ['Cao Lau', 'Banh Mi', 'Chicken Rice'],
    },
    'sapa': {
      'vi': ['Thịt trâu gác bếp', 'Cá tầm', 'Rượu ngô'],
      'en': ['Buffalo Jerky', 'Sturgeon', 'Corn Wine'],
    },
    'da_lat': {
      'vi': ['Dâu tây', 'Bánh tráng nướng', 'Sữa đậu nành'],
      'en': ['Strawberry', 'Grilled Rice Paper', 'Soybean Milk'],
    },
    'phu_quoc': {
      'vi': ['Nước mắm', 'Ghẹ hấp', 'Hải sản nướng'],
      'en': ['Fish Sauce', 'Steamed Crab', 'Grilled Seafood'],
    },
    'ha_noi': {
      'vi': ['Phở', 'Bún chả', 'Cà phê trứng'],
      'en': ['Pho', 'Bun Cha', 'Egg Coffee'],
    },
    'ho_chi_minh': {
      'vi': ['Bánh mì Sài Gòn', 'Hủ tiếu', 'Cơm tấm'],
      'en': ['Saigon Banh Mi', 'Hu Tieu', 'Broken Rice'],
    },
    'nha_trang': {
      'vi': ['Bún chả cá', 'Nem nướng', 'Yến sào'],
      'en': ['Fish Cake Noodle Soup', 'Grilled Pork Sausage', 'Bird\'s Nest'],
    },
  };

  static Map<String, List<String>> _provincesTranslations = {
    'vi': ['Hà Nội', 'TP. Hồ Chí Minh', 'Quảng Ninh', 'Quảng Nam', 'Lào Cai', 'Lâm Đồng', 'Kiên Giang', 'Khánh Hòa'],
    'en': ['Hanoi', 'Ho Chi Minh City', 'Quang Ninh', 'Quang Nam', 'Lao Cai', 'Lam Dong', 'Kien Giang', 'Khanh Hoa'],
  };

  static String getName(String locationKey, Locale locale) {
    final lang = locale.languageCode;
    return _translations[locationKey]?['name_$lang'] ?? _translations[locationKey]?['name_vi'] ?? '';
  }

  static String getDescription(String locationKey, Locale locale) {
    final lang = locale.languageCode;
    return _translations[locationKey]?['description_$lang'] ?? _translations[locationKey]?['description_vi'] ?? '';
  }

  static String getProvince(String locationKey, Locale locale) {
    final lang = locale.languageCode;
    return _translations[locationKey]?['province_$lang'] ?? _translations[locationKey]?['province_vi'] ?? '';
  }

  static List<String> getSpecialties(String locationKey, Locale locale) {
    final lang = locale.languageCode;
    return _specialtiesTranslations[locationKey]?[lang] ?? _specialtiesTranslations[locationKey]?['vi'] ?? [];
  }

  static List<String> getProvinces(Locale locale) {
    final lang = locale.languageCode;
    return _provincesTranslations[lang] ?? _provincesTranslations['vi'] ?? [];
  }
}

