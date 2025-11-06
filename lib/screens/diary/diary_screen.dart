import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../models/diary_entry.dart';
import '../../data/diary_data.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  List<DiaryEntry> diaryEntries = [];
  DiaryEntry? selectedEntry;
  int selectedImageIndex = 0;
  bool showAddDialog = false;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  List<XFile> _pickedImages = [];

  @override
  void initState() {
    super.initState();
    diaryEntries = getDiaryEntries();
  }

  @override
  void dispose() {
    _locationController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd MMMM yyyy', 'vi').format(date);
    } catch (e) {
      return dateString;
    }
  }

  void _showImageGallery(
    BuildContext context,
    DiaryEntry entry,
    int initialIndex,
  ) {
    int currentIndex = initialIndex;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setModalState) => Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.locationName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  formatDate(entry.date),
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child:
                              kIsWeb
                                  ? Image.network(
                                    entry.images[currentIndex],
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[300],
                                        child: const Icon(Icons.broken_image),
                                      );
                                    },
                                  )
                                  : (entry.images[currentIndex].startsWith(
                                        'http',
                                      )
                                      ? Image.network(
                                        entry.images[currentIndex],
                                        fit: BoxFit.contain,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Container(
                                            color: Colors.grey[300],
                                            child: const Icon(
                                              Icons.broken_image,
                                            ),
                                          );
                                        },
                                      )
                                      : Image.file(
                                        File(entry.images[currentIndex]),
                                        fit: BoxFit.contain,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Container(
                                            color: Colors.grey[300],
                                            child: const Icon(
                                              Icons.broken_image,
                                            ),
                                          );
                                        },
                                      )),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: entry.images.length,
                          itemBuilder: (context, index) {
                            final isSelected = index == currentIndex;
                            return GestureDetector(
                              onTap: () {
                                setModalState(() {
                                  currentIndex = index;
                                });
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color:
                                        isSelected
                                            ? Theme.of(context).primaryColor
                                            : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    entry.images[index],
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[300],
                                        child: const Icon(Icons.broken_image),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      if (entry.notes.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            entry.notes,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          '${currentIndex + 1} / ${entry.images.length}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhật Ký Du Lịch'),
        actions: [
          IconButton(
            onPressed: () {
              _showAddEntryDialog(context);
            },
            tooltip: 'Thêm',
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body:
          diaryEntries.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: 64, color: Colors.grey[400]),
                    const SizedBox(height: 16),
                    Text(
                      'Chưa có nhật ký nào',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Hãy thêm ảnh và ghi chú về chuyến đi của bạn',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: diaryEntries.length,
                itemBuilder: (context, index) {
                  final entry = diaryEntries[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date Header
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            formatDate(entry.date),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Entry Card
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Location
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    entry.locationName,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  PopupMenuButton<String>(
                                    onSelected: (value) {
                                      if (value == 'edit') {
                                        _showEditEntryDialog(context, index);
                                      } else if (value == 'delete') {
                                        _deleteEntry(index);
                                      }
                                    },
                                    itemBuilder:
                                        (context) => const [
                                          PopupMenuItem(
                                            value: 'edit',
                                            child: Text('Chỉnh sửa'),
                                          ),
                                          PopupMenuItem(
                                            value: 'delete',
                                            child: Text('Xóa'),
                                          ),
                                        ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Photo Grid
                              Builder(
                                builder: (context) {
                                  final int total = entry.images.length;
                                  final int displayCount =
                                      total > 3 ? 3 : total;
                                  return GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 8,
                                        ),
                                    itemCount: displayCount,
                                    itemBuilder: (context, imgIndex) {
                                      final bool isLastAndMore =
                                          imgIndex == displayCount - 1 &&
                                          total > displayCount;
                                      Widget imageWidget;
                                      if (kIsWeb) {
                                        imageWidget = Image.network(
                                          entry.images[imgIndex],
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stack) =>
                                                  Container(
                                                    color: Colors.grey[300],
                                                    child: const Icon(
                                                      Icons.broken_image,
                                                    ),
                                                  ),
                                        );
                                      } else if (entry.images[imgIndex]
                                          .startsWith('http')) {
                                        imageWidget = Image.network(
                                          entry.images[imgIndex],
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stack) =>
                                                  Container(
                                                    color: Colors.grey[300],
                                                    child: const Icon(
                                                      Icons.broken_image,
                                                    ),
                                                  ),
                                        );
                                      } else {
                                        imageWidget = Image.file(
                                          File(entry.images[imgIndex]),
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stack) =>
                                                  Container(
                                                    color: Colors.grey[300],
                                                    child: const Icon(
                                                      Icons.broken_image,
                                                    ),
                                                  ),
                                        );
                                      }

                                      return GestureDetector(
                                        onTap: () {
                                          _showImageGallery(
                                            context,
                                            entry,
                                            imgIndex,
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              imageWidget,
                                              if (isLastAndMore)
                                                Container(
                                                  color: Colors.black45,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '+${total - displayCount}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              if (entry.notes.isNotEmpty) ...[
                                const SizedBox(height: 12),
                                Text(
                                  entry.notes,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                              const SizedBox(height: 12),
                              // Image Count Badge
                              Align(
                                alignment: Alignment.centerRight,
                                child: Chip(
                                  label: Text('${entry.images.length} ảnh'),
                                  backgroundColor: Colors.grey[200],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  );
                },
              ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  void _showAddEntryDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setSheetState) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Thêm Nhật Ký Mới',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setSheetState(() {
                                  _pickedImages = [];
                                  _locationController.clear();
                                  _notesController.clear();
                                });
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Chọn ảnh từ thư viện hoặc chụp ảnh mới',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(height: 16),
                        if (_pickedImages.isNotEmpty) ...[
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _pickedImages.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 120,
                                  margin: const EdgeInsets.only(right: 8),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child:
                                            kIsWeb
                                                ? Image.network(
                                                  _pickedImages[index].path,
                                                  fit: BoxFit.cover,
                                                )
                                                : Image.file(
                                                  File(
                                                    _pickedImages[index].path,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                      ),
                                      Positioned(
                                        top: 4,
                                        right: 4,
                                        child: Material(
                                          color: Colors.black45,
                                          shape: const CircleBorder(),
                                          child: InkWell(
                                            customBorder: const CircleBorder(),
                                            onTap: () {
                                              setSheetState(() {
                                                _pickedImages.removeAt(index);
                                              });
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(4),
                                              child: Icon(
                                                Icons.close,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  final photo = await _picker.pickImage(
                                    source: ImageSource.camera,
                                    imageQuality: 85,
                                  );
                                  if (photo != null) {
                                    setSheetState(
                                      () =>
                                          _pickedImages = [
                                            ..._pickedImages,
                                            photo,
                                          ],
                                    );
                                  }
                                },
                                icon: const Icon(Icons.camera_alt),
                                label: const Text('Chụp ảnh'),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 32,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  final files = await _picker.pickMultiImage(
                                    imageQuality: 85,
                                  );
                                  if (files.isNotEmpty) {
                                    setSheetState(
                                      () =>
                                          _pickedImages = [
                                            ..._pickedImages,
                                            ...files,
                                          ],
                                    );
                                  }
                                },
                                icon: const Icon(Icons.image),
                                label: const Text('Thư viện'),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 32,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                            labelText: 'Địa điểm',
                            hintText: 'Ví dụ: Vịnh Hạ Long',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _notesController,
                          decoration: const InputDecoration(
                            labelText: 'Ghi chú',
                            hintText: 'Thêm ghi chú cho ảnh...',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 4,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                setSheetState(() {
                                  _pickedImages = [];
                                  _locationController.clear();
                                  _notesController.clear();
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Hủy'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                if (_pickedImages.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Vui lòng chọn hoặc chụp ít nhất 1 ảnh',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                final newEntry = DiaryEntry(
                                  id:
                                      DateTime.now().millisecondsSinceEpoch
                                          .toString(),
                                  locationId: '',
                                  locationName:
                                      _locationController.text.trim().isEmpty
                                          ? 'Nhật ký'
                                          : _locationController.text.trim(),
                                  date: DateFormat(
                                    'yyyy-MM-dd',
                                  ).format(DateTime.now()),
                                  images:
                                      _pickedImages.map((e) => e.path).toList(),
                                  notes: _notesController.text.trim(),
                                );
                                setState(() {
                                  diaryEntries.insert(0, newEntry);
                                });
                                setSheetState(() {
                                  _pickedImages = [];
                                  _locationController.clear();
                                  _notesController.clear();
                                });
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Đã thêm nhật ký (tạm thời)'),
                                  ),
                                );
                              },
                              child: const Text('Lưu'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
          ),
    );
  }

  void _showEditEntryDialog(BuildContext context, int entryIndex) {
    final entry = diaryEntries[entryIndex];
    _locationController.text = entry.locationName;
    _notesController.text = entry.notes;
    _pickedImages = entry.images.map((p) => XFile(p)).toList();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setSheetState) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Chỉnh sửa nhật ký',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setSheetState(() {
                                  _pickedImages = [];
                                  _locationController.clear();
                                  _notesController.clear();
                                });
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _pickedImages.length + 1,
                            itemBuilder: (context, index) {
                              final isAddTile = index == 0;
                              if (isAddTile) {
                                return Container(
                                  width: 120,
                                  margin: const EdgeInsets.only(right: 8),
                                  child: OutlinedButton(
                                    onPressed: () async {
                                      final files = await _picker
                                          .pickMultiImage(imageQuality: 85);
                                      if (files.isNotEmpty) {
                                        setSheetState(
                                          () =>
                                              _pickedImages = [
                                                ..._pickedImages,
                                                ...files,
                                              ],
                                        );
                                      }
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: const Icon(Icons.add),
                                  ),
                                );
                              }
                              final realIndex = index - 1;
                              return Container(
                                width: 120,
                                margin: const EdgeInsets.only(right: 8),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child:
                                          kIsWeb
                                              ? Image.network(
                                                _pickedImages[realIndex].path,
                                                fit: BoxFit.cover,
                                              )
                                              : Image.file(
                                                File(
                                                  _pickedImages[realIndex].path,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                    ),
                                    Positioned(
                                      top: 4,
                                      right: 4,
                                      child: Material(
                                        color: Colors.black45,
                                        shape: const CircleBorder(),
                                        child: InkWell(
                                          customBorder: const CircleBorder(),
                                          onTap: () {
                                            setSheetState(() {
                                              _pickedImages.removeAt(realIndex);
                                            });
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Icon(
                                              Icons.close,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  final photo = await _picker.pickImage(
                                    source: ImageSource.camera,
                                    imageQuality: 85,
                                  );
                                  if (photo != null) {
                                    setSheetState(
                                      () =>
                                          _pickedImages = [
                                            ..._pickedImages,
                                            photo,
                                          ],
                                    );
                                  }
                                },
                                icon: const Icon(Icons.camera_alt),
                                label: const Text('Chụp ảnh'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  final files = await _picker.pickMultiImage(
                                    imageQuality: 85,
                                  );
                                  if (files.isNotEmpty) {
                                    setSheetState(
                                      () =>
                                          _pickedImages = [
                                            ..._pickedImages,
                                            ...files,
                                          ],
                                    );
                                  }
                                },
                                icon: const Icon(Icons.image),
                                label: const Text('Thư viện'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                            labelText: 'Địa điểm',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _notesController,
                          decoration: const InputDecoration(
                            labelText: 'Ghi chú',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 4,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                setSheetState(() {
                                  _pickedImages = [];
                                  _locationController.clear();
                                  _notesController.clear();
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Hủy'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                final updated = DiaryEntry(
                                  id: entry.id,
                                  locationId: '',
                                  locationName:
                                      _locationController.text.trim().isEmpty
                                          ? 'Nhật ký'
                                          : _locationController.text.trim(),
                                  date: entry.date,
                                  images:
                                      _pickedImages.map((e) => e.path).toList(),
                                  notes: _notesController.text.trim(),
                                );
                                setState(() {
                                  diaryEntries[entryIndex] = updated;
                                });
                                setSheetState(() {
                                  _pickedImages = [];
                                  _locationController.clear();
                                  _notesController.clear();
                                });
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Đã cập nhật nhật ký'),
                                  ),
                                );
                              },
                              child: const Text('Lưu'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
          ),
    );
  }

  void _deleteEntry(int index) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Xóa nhật ký'),
            content: const Text('Bạn có chắc muốn xóa mục này?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Hủy'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Xóa'),
              ),
            ],
          ),
    );
    if (confirm == true) {
      setState(() {
        diaryEntries.removeAt(index);
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Đã xóa nhật ký')));
    }
  }
}
