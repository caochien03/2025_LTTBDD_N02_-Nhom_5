import '../models/diary_entry.dart';

List<DiaryEntry> getDiaryEntries() {
  return [
    DiaryEntry(
      id: '1',
      locationId: '1',
      locationName: 'Vịnh Hạ Long',
      date: '2024-08-15',
      images: [
        'https://images.unsplash.com/photo-1703555853329-b9fab31e92ad?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxIYSUyMExvbmclMjBCYXklMjBWaWV0bmFtfGVufDF8fHx8MTc2MTcwNTg1N3ww&ixlib=rb-4.1.0&q=80&w=1080',
        'https://images.unsplash.com/photo-1645387326447-7f7ea34f0162?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx0cmF2ZWwlMjBtZW1vcmllc3xlbnwxfHx8fDE3NjE3NTYwNTB8MA&ixlib=rb-4.1.0&q=80&w=1080',
        'https://images.unsplash.com/photo-1748549544782-7061a9885e47?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx0b3VyaXN0JTIwdGFraW5nJTIwcGhvdG98ZW58MXx8fHwxNzYxNzU2MDUxfDA&ixlib=rb-4.1.0&q=80&w=1080',
      ],
      notes:
          'Chuyến đi tuyệt vời! Vịnh Hạ Long đẹp hơn tưởng tượng rất nhiều. Đi thuyền kayak qua các hang động thật thú vị.',
    ),
    DiaryEntry(
      id: '2',
      locationId: '6',
      locationName: 'Khu Phố Cổ Hà Nội',
      date: '2024-09-20',
      images: [
        'https://images.unsplash.com/photo-1679562078540-09ae866ef4bf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxIYW5vaSUyMG9sZCUyMHF1YXJ0ZXJ8ZW58MXx8fHwxNzYxNzU1OTQyfDA&ixlib=rb-4.1.0&q=80&w=1080',
        'https://images.unsplash.com/photo-1672001304666-d429b2d5ab13?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx2YWNhdGlvbiUyMHBob3Rvc3xlbnwxfHx8fDE3NjE3NTYwNTF8MA&ixlib=rb-4.1.0&q=80&w=1080',
        'https://images.unsplash.com/photo-1615826932727-ed9f182ac67e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx0cmF2ZWwlMjBkaWFyeXxlbnwxfHx8fDE3NjE3NTYwNTF8MA&ixlib=rb-4.1.0&q=80&w=1080',
      ],
      notes:
          'Ẩm thực phố cổ quá tuyệt! Thử phở, bún chả và cà phê trứng. Phố cổ về đêm rất đẹp và sôi động.',
    ),
  ];
}
