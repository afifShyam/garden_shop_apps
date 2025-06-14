import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            'LOCATION',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ),

        // Static Map (OpenStreetMap)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 180,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(3.1073, 101.6078),
                  initialZoom: 13,
                  interactionOptions: const InteractionOptions(
                    flags: InteractiveFlag.none, // 🔒 static map
                  ),
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.garden_shop',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(3.1073, 101.6078),
                        width: 40,
                        height: 40,
                        alignment: Alignment.bottomCenter,
                        child: const Icon(Icons.location_pin, color: Colors.red, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Location Cards
        const _LocationItem(
          title: 'Sunway Pyramid',
          address: '10 Floor, Lorem Ipsum Mall,\nJalan SS23, Selangor, Malaysia',
          time: '10am - 10pm',
        ),
        const SizedBox(height: 12),
        const _LocationItem(
          title: 'The Gardens Mall',
          address: '10 Floor, Lorem Ipsum Mall,\nJalan SS23, Selangor, Malaysia',
          time: '10am - 10pm',
        ),
      ],
    );
  }
}

class _LocationItem extends StatelessWidget {
  final String title;
  final String address;
  final String time;

  const _LocationItem({required this.title, required this.address, required this.time});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.green),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  address,
                  style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Colors.green),
              const SizedBox(width: 4),
              Text(time),
            ],
          ),
        ],
      ),
    );
  }
}
