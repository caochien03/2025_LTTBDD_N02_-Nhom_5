import '../models/location.dart';

List<Location> getLocations() {
  return [
    Location(
      id: '1',
      name: 'Vịnh Hạ Long',
      province: 'Quảng Ninh',
      description:
          'Di sản thiên nhiên thế giới với hàng nghìn hòn đảo đá vôi kỳ vĩ, một trong những kỳ quan thiên nhiên đẹp nhất Việt Nam.',
      image:
          'https://images.unsplash.com/photo-1703555853329-b9fab31e92ad?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxIYSUyMExvbmclMjBCYXklMjBWaWV0bmFtfGVufDF8fHx8MTc2MTcwNTg1N3ww&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: ['Chả mực', 'Ngán', 'Hải sản tươi sống'],
      isFavorite: true,
      status: 'visited',
    ),
    Location(
      id: '2',
      name: 'Phố Cổ Hội An',
      province: 'Quảng Nam',
      description:
          'Thành phố cổ với kiến trúc độc đáo, đèn lồng rực rỡ và văn hóa đa dạng. Di sản văn hóa thế giới UNESCO.',
      image:
          'https://images.unsplash.com/photo-1664650440553-ab53804814b3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxIb2klMjBBbiUyMGFuY2llbnQlMjB0b3dufGVufDF8fHx8MTc2MTcyODY3OXww&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: ['Cao lầu', 'Bánh mì', 'Cơm gà'],
      isFavorite: true,
      status: 'planned',
    ),
    Location(
      id: '3',
      name: 'Ruộng Bậc Thang Sapa',
      province: 'Lào Cai',
      description:
          'Thung lũng ruộng bậc thang tuyệt đẹp, nơi gặp gỡ các dân tộc thiểu số và khám phá văn hóa độc đáo.',
      image:
          'https://images.unsplash.com/photo-1694152362587-99d77d21793b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxTYXBhJTIwcmljZSUyMHRlcnJhY2VzfGVufDF8fHx8MTc2MTcyODY3OXww&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: ['Thịt trâu gác bếp', 'Cá tầm', 'Rượu ngô'],
      isFavorite: false,
    ),
    Location(
      id: '4',
      name: 'Đà Lạt',
      province: 'Lâm Đồng',
      description:
          'Thành phố ngàn hoa với khí hậu mát mẻ quanh năm, thác nước, hồ và vườn dâu tây.',
      image:
          'https://images.unsplash.com/photo-1643799292915-d65b169ab021?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxEYSUyMExhdCUyMGZsb3dlciUyMGdhcmRlbnxlbnwxfHx8fDE3NjE3NTU5NDJ8MA&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: ['Dâu tây', 'Bánh tráng nướng', 'Sữa đậu nành'],
      isFavorite: true,
      status: 'wishlist',
    ),
    Location(
      id: '5',
      name: 'Phú Quốc',
      province: 'Kiên Giang',
      description:
          'Đảo ngọc với bãi biển cát trắng, nước biển trong xanh, và hải sản tươi ngon.',
      image:
          'https://images.unsplash.com/photo-1732243395944-cb3ff9311091?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxQaHUlMjBRdW9jJTIwYmVhY2h8ZW58MXx8fHwxNzYxNzI4NjgwfDA&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: ['Nước mắm', 'Ghẹ hấp', 'Hải sản nướng'],
      isFavorite: false,
    ),
    Location(
      id: '6',
      name: 'Khu Phố Cổ Hà Nội',
      province: 'Hà Nội',
      description:
          'Trung tâm lịch sử với 36 phố phường cổ, ẩm thực đường phố phong phú và văn hóa đặc sắc.',
      image:
          'https://images.unsplash.com/photo-1679562078540-09ae866ef4bf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxIYW5vaSUyMG9sZCUyMHF1YXJ0ZXJ8ZW58MXx8fHwxNzYxNzU1OTQyfDA&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: ['Phở', 'Bún chả', 'Cà phê trứng'],
      isFavorite: true,
      status: 'visited',
    ),
    Location(
      id: '7',
      name: 'Thành phố Hồ Chí Minh',
      province: 'TP. Hồ Chí Minh',
      description:
          'Thành phố năng động với sự pha trộn giữa hiện đại và truyền thống, ẩm thực đa dạng.',
      image:
          'https://images.unsplash.com/photo-1536086845112-89de23aa4772?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxIbyUyMENoaSUyME1pbmglMjBjaXR5fGVufDF8fHx8MTc2MTc1NTk0Mnww&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: ['Bánh mì Sài Gòn', 'Hủ tiếu', 'Cơm tấm'],
      isFavorite: false,
    ),
    Location(
      id: '8',
      name: 'Nha Trang',
      province: 'Khánh Hòa',
      description:
          'Thành phố biển với bãi tắm đẹp, hoạt động lặn biển và các khu nghỉ dưỡng cao cấp.',
      image:
          'https://images.unsplash.com/photo-1533002832-1721d16b4bb9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxOaGElMjBUcmFuZyUyMGJlYWNofGVufDF8fHx8MTc2MTc1NTk0M3ww&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: ['Bún chả cá', 'Nem nướng', 'Yến sào'],
      isFavorite: true,
      status: 'planned',
    ),
  ];
}

List<String> getProvinces() {
  return [
    'Tất cả',
    'Hà Nội',
    'TP. Hồ Chí Minh',
    'Quảng Ninh',
    'Quảng Nam',
    'Lào Cai',
    'Lâm Đồng',
    'Kiên Giang',
    'Khánh Hòa',
  ];
}
