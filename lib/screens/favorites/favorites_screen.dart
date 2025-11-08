import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/location.dart';
import '../../data/locations_data.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../localization/app_localizations.dart';
import '../../providers/locale_provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with SingleTickerProviderStateMixin {
  List<Location> locations = [];
  late TabController _tabController;
  Location? selectedLocation;
  final TextEditingController _notesController = TextEditingController();
  bool showNotesDialog = false;
  // Store favorite states separately to preserve them across locale changes
  Map<String, bool> favoriteStates = {};
  Map<String, String?> statusStates = {};
  Map<String, String?> notesStates = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reload locations when locale changes, preserving favorite states
    final newLocations = getLocations(context);
    locations =
        newLocations.map((loc) {
          // Preserve favorite state if it was changed
          final isFavorite = favoriteStates[loc.id] ?? loc.isFavorite;
          final status = statusStates[loc.id] ?? loc.status;
          final notes = notesStates[loc.id] ?? loc.notes;
          return loc.copyWith(
            isFavorite: isFavorite,
            status: status,
            notes: notes,
          );
        }).toList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  List<Location> get favoriteLocations =>
      locations.where((loc) => loc.isFavorite).toList();

  List<Location> get wishlistLocations =>
      favoriteLocations.where((loc) => loc.status == 'wishlist').toList();

  List<Location> get plannedLocations =>
      favoriteLocations.where((loc) => loc.status == 'planned').toList();

  List<Location> get visitedLocations =>
      favoriteLocations.where((loc) => loc.status == 'visited').toList();

  void updateLocationStatus(String id, String? status) {
    setState(() {
      // Save status state
      statusStates[id] = status;
      // Update locations
      locations =
          locations.map((loc) {
            if (loc.id == id) {
              return loc.copyWith(status: status);
            }
            return loc;
          }).toList();
    });
  }

  void saveNotes() {
    if (selectedLocation != null) {
      setState(() {
        final locationId = selectedLocation!.id;
        final notes = _notesController.text.trim();
        // Save notes state
        notesStates[locationId] = notes.isEmpty ? null : notes;
        // Update locations
        locations =
            locations.map((loc) {
              if (loc.id == locationId) {
                return loc.copyWith(notes: notes.isEmpty ? null : notes);
              }
              return loc;
            }).toList();
      });
      showNotesDialog = false;
      selectedLocation = null;
      _notesController.clear();
    }
  }

  Widget buildLocationCard(Location location) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              location.image,
              width: 112,
              height: 112,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 112,
                  height: 112,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location.province,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed:
                            () => updateLocationStatus(location.id, 'wishlist'),
                        icon: Icon(
                          Icons.favorite,
                          size: 18,
                          color:
                              location.status == 'wishlist'
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed:
                            () => updateLocationStatus(location.id, 'planned'),
                        icon: Icon(
                          Icons.calendar_today,
                          size: 18,
                          color:
                              location.status == 'planned'
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed:
                            () => updateLocationStatus(location.id, 'visited'),
                        icon: Icon(
                          Icons.check_circle,
                          size: 18,
                          color:
                              location.status == 'visited'
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectedLocation = location;
                            _notesController.text = location.notes ?? '';
                            showNotesDialog = true;
                          });
                        },
                        icon: Icon(
                          Icons.note,
                          size: 18,
                          color: Colors.grey[600],
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  if (location.notes != null && location.notes!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      '📝 ${location.notes}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEmptyState(IconData icon, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Watch LocaleProvider to rebuild when locale changes
    context.watch<LocaleProvider>();
    // Update locations when locale changes, preserving favorite states
    final newLocations = getLocations(context);
    locations =
        newLocations.map((loc) {
          // Preserve favorite state if it was changed
          final isFavorite = favoriteStates[loc.id] ?? loc.isFavorite;
          final status = statusStates[loc.id] ?? loc.status;
          final notes = notesStates[loc.id] ?? loc.notes;
          return loc.copyWith(
            isFavorite: isFavorite,
            status: status,
            notes: notes,
          );
        }).toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(l10n.allFavorites),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text('${favoriteLocations.length}'),
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.grey[300],
                        labelStyle: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(l10n.wishlist),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text('${wishlistLocations.length}'),
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.grey[300],
                        labelStyle: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(l10n.planned),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text('${plannedLocations.length}'),
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.grey[300],
                        labelStyle: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(l10n.visited),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text('${visitedLocations.length}'),
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.grey[300],
                        labelStyle: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // All favorites
                  favoriteLocations.isEmpty
                      ? buildEmptyState(
                        Icons.favorite_border,
                        l10n.noFavoriteLocations,
                      )
                      : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: favoriteLocations.length,
                        itemBuilder:
                            (context, index) =>
                                buildLocationCard(favoriteLocations[index]),
                      ),
                  // Wishlist
                  wishlistLocations.isEmpty
                      ? buildEmptyState(
                        Icons.favorite_border,
                        l10n.noWishlistLocations,
                      )
                      : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: wishlistLocations.length,
                        itemBuilder:
                            (context, index) =>
                                buildLocationCard(wishlistLocations[index]),
                      ),
                  // Planned
                  plannedLocations.isEmpty
                      ? buildEmptyState(
                        Icons.calendar_today,
                        l10n.noPlannedLocations,
                      )
                      : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: plannedLocations.length,
                        itemBuilder:
                            (context, index) =>
                                buildLocationCard(plannedLocations[index]),
                      ),
                  // Visited
                  visitedLocations.isEmpty
                      ? buildEmptyState(
                        Icons.check_circle,
                        l10n.noVisitedLocations,
                      )
                      : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: visitedLocations.length,
                        itemBuilder:
                            (context, index) =>
                                buildLocationCard(visitedLocations[index]),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Notes Dialog
      bottomSheet:
          showNotesDialog
              ? Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.planNotes,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              showNotesDialog = false;
                              selectedLocation = null;
                              _notesController.clear();
                            });
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _notesController,
                      decoration: InputDecoration(
                        hintText: l10n.planNotesPlaceholder,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 5,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showNotesDialog = false;
                              selectedLocation = null;
                              _notesController.clear();
                            });
                          },
                          child: Text(l10n.cancel),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: saveNotes,
                          child: Text(l10n.save),
                        ),
                      ],
                    ),
                  ],
                ),
              )
              : null,
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
