import 'package:flutter/material.dart';
import '../models/location.dart';
import 'location_translations.dart';

List<Location> getLocations(BuildContext? context) {
  final locale = context != null 
      ? Localizations.localeOf(context)
      : const Locale('vi');
  
  return [
    Location(
      id: '1',
      name: LocationTranslations.getName('ha_long_bay', locale),
      province: LocationTranslations.getProvince('ha_long_bay', locale),
      description: LocationTranslations.getDescription('ha_long_bay', locale),
      image:
          'https://images.unsplash.com/photo-1703555853329-b9fab31e92ad?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxIYSUyMExvbmclMjBCYXklMjBWaWV0bmFtfGVufDF8fHx8MTc2MTcwNTg1N3ww&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: LocationTranslations.getSpecialties('ha_long_bay', locale),
      isFavorite: true,
      status: 'visited',
    ),
    Location(
      id: '2',
      name: LocationTranslations.getName('hoi_an', locale),
      province: LocationTranslations.getProvince('hoi_an', locale),
      description: LocationTranslations.getDescription('hoi_an', locale),
      image:
          'https://images.unsplash.com/photo-1664650440553-ab53804814b3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxIb2klMjBBbiUyMGFuY2llbnQlMjB0b3dufGVufDF8fHx8MTc2MTcyODY3OXww&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: LocationTranslations.getSpecialties('hoi_an', locale),
      isFavorite: true,
      status: 'planned',
    ),
    Location(
      id: '3',
      name: LocationTranslations.getName('sapa', locale),
      province: LocationTranslations.getProvince('sapa', locale),
      description: LocationTranslations.getDescription('sapa', locale),
      image:
          'https://images.unsplash.com/photo-1694152362587-99d77d21793b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxTYXBhJTIwcmljZSUyMHRlcnJhY2VzfGVufDF8fHx8MTc2MTcyODY3OXww&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: LocationTranslations.getSpecialties('sapa', locale),
      isFavorite: false,
    ),
    Location(
      id: '4',
      name: LocationTranslations.getName('da_lat', locale),
      province: LocationTranslations.getProvince('da_lat', locale),
      description: LocationTranslations.getDescription('da_lat', locale),
      image:
          'https://images.unsplash.com/photo-1643799292915-d65b169ab021?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxEYSUyMExhdCUyMGZsb3dlciUyMGdhcmRlbnxlbnwxfHx8fDE3NjE3NTU5NDJ8MA&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: LocationTranslations.getSpecialties('da_lat', locale),
      isFavorite: true,
      status: 'wishlist',
    ),
    Location(
      id: '5',
      name: LocationTranslations.getName('phu_quoc', locale),
      province: LocationTranslations.getProvince('phu_quoc', locale),
      description: LocationTranslations.getDescription('phu_quoc', locale),
      image:
          'https://images.unsplash.com/photo-1732243395944-cb3ff9311091?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxQaHUlMjBRdW9jJTIwYmVhY2h8ZW58MXx8fHwxNzYxNzI4NjgwfDA&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: LocationTranslations.getSpecialties('phu_quoc', locale),
      isFavorite: false,
    ),
    Location(
      id: '6',
      name: LocationTranslations.getName('ha_noi', locale),
      province: LocationTranslations.getProvince('ha_noi', locale),
      description: LocationTranslations.getDescription('ha_noi', locale),
      image:
          'https://images.unsplash.com/photo-1679562078540-09ae866ef4bf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxIYW5vaSUyMG9sZCUyMHF1YXJ0ZXJ8ZW58MXx8fHwxNzYxNzU1OTQyfDA&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: LocationTranslations.getSpecialties('ha_noi', locale),
      isFavorite: true,
      status: 'visited',
    ),
    Location(
      id: '7',
      name: LocationTranslations.getName('ho_chi_minh', locale),
      province: LocationTranslations.getProvince('ho_chi_minh', locale),
      description: LocationTranslations.getDescription('ho_chi_minh', locale),
      image:
          'https://images.unsplash.com/photo-1536086845112-89de23aa4772?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxIbyUyMENoaSUyME1pbmglMjBjaXR5fGVufDF8fHx8MTc2MTc1NTk0Mnww&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: LocationTranslations.getSpecialties('ho_chi_minh', locale),
      isFavorite: false,
    ),
    Location(
      id: '8',
      name: LocationTranslations.getName('nha_trang', locale),
      province: LocationTranslations.getProvince('nha_trang', locale),
      description: LocationTranslations.getDescription('nha_trang', locale),
      image:
          'https://images.unsplash.com/photo-1533002832-1721d16b4bb9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxOaGElMjBUcmFuZyUyMGJlYWNofGVufDF8fHx8MTc2MTc1NTk0M3ww&ixlib=rb-4.1.0&q=80&w=1080',
      specialties: LocationTranslations.getSpecialties('nha_trang', locale),
      isFavorite: true,
      status: 'planned',
    ),
  ];
}

List<String> getProvinces(BuildContext? context) {
  final locale = context != null 
      ? Localizations.localeOf(context)
      : const Locale('vi');
  return LocationTranslations.getProvinces(locale);
}
