import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/location.dart';
import '../../data/locations_data.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../localization/app_localizations.dart';
import '../../providers/locale_provider.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String searchQuery = '';
  String? selectedProvince;
  List<Location> locations = [];
  // Store favorite states separately to preserve them across locale changes
  Map<String, bool> favoriteStates = {};
  Map<String, String?> statusStates = {};

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
          return loc.copyWith(isFavorite: isFavorite, status: status);
        }).toList();
    // Try to find matching province in new locale, or reset to null
    if (selectedProvince != null) {
      final provinces = getProvinces(context);
      if (!provinces.contains(selectedProvince)) {
        selectedProvince = null;
      }
    }
  }

  List<Location> get filteredLocations {
    return locations.where((location) {
      final matchesSearch =
          location.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          location.description.toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
      final matchesProvince =
          selectedProvince == null || location.province == selectedProvince;
      return matchesSearch && matchesProvince;
    }).toList();
  }

  void toggleFavorite(String id) {
    setState(() {
      final currentLocation = locations.firstWhere((loc) => loc.id == id);
      final newFavoriteState = !currentLocation.isFavorite;
      // Save favorite state
      favoriteStates[id] = newFavoriteState;
      // Update locations
      locations =
          locations.map((loc) {
            if (loc.id == id) {
              return loc.copyWith(isFavorite: newFavoriteState);
            }
            return loc;
          }).toList();
    });
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
          return loc.copyWith(isFavorite: isFavorite, status: status);
        }).toList();
    final provinces = getProvinces(context);

    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: l10n.searchPlaceholder,
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
          ),

          // Filter Chips
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: provinces.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  final isSelected = selectedProvince == null;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(l10n.all),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selectedProvince = null;
                        });
                      },
                      selectedColor: Theme.of(
                        context,
                      ).primaryColor.withOpacity(0.2),
                      checkmarkColor: Theme.of(context).primaryColor,
                    ),
                  );
                }
                final province = provinces[index - 1];
                final isSelected = selectedProvince == province;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(province),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedProvince = province;
                      });
                    },
                    selectedColor: Theme.of(
                      context,
                    ).primaryColor.withOpacity(0.2),
                    checkmarkColor: Theme.of(context).primaryColor,
                  ),
                );
              },
            ),
          ),

          // Location Cards
          Expanded(
            child:
                filteredLocations.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n.noLocationsFound,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredLocations.length,
                      itemBuilder: (context, index) {
                        final location = filteredLocations[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              _showLocationDetail(context, location);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.network(
                                      location.image,
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Container(
                                          height: 200,
                                          color: Colors.grey[300],
                                          child: const Icon(Icons.broken_image),
                                        );
                                      },
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Material(
                                        color: Colors.white.withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(20),
                                        child: InkWell(
                                          onTap:
                                              () => toggleFavorite(location.id),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Icon(
                                              Icons.favorite,
                                              size: 20,
                                              color:
                                                  location.isFavorite
                                                      ? Colors.red
                                                      : Colors.grey[600],
                                              fill:
                                                  location.isFavorite
                                                      ? 1.0
                                                      : 0.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        location.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 16,
                                            color: Colors.grey[600],
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            location.province,
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        location.description,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  void _showLocationDetail(BuildContext context, Location location) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => Container(
            height: MediaQuery.of(context).size.height * 0.85,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.locationDetails,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            location.image,
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 250,
                                color: Colors.grey[300],
                                child: const Icon(Icons.broken_image),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          location.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 18,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              location.province,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.description,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          location.description,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.specialties,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:
                              location.specialties
                                  .map(
                                    (specialty) => Chip(
                                      label: Text(specialty),
                                      backgroundColor: Colors.grey[200],
                                    ),
                                  )
                                  .toList(),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              toggleFavorite(location.id);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              location.isFavorite
                                  ? l10n.removeFromFavorites
                                  : l10n.addToFavorites,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
