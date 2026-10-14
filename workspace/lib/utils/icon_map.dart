import 'package:flutter/material.dart';

IconData iconFromName(String name) {
  return switch (name) {
    'phone_iphone' => Icons.phone_iphone,
    'layers' => Icons.layers_outlined,
    'language' => Icons.language,
    'hub' => Icons.hub_outlined,
    'storage' => Icons.storage,
    'account_tree' => Icons.account_tree_outlined,
    'translate' => Icons.translate,
    'cloud_done' => Icons.cloud_done_outlined,
    'smartphone' => Icons.smartphone,
    'web' => Icons.web,
    'dns' => Icons.dns_outlined,
    'table_chart' => Icons.table_chart_outlined,
    'cloud' => Icons.cloud_outlined,
    'handyman' => Icons.handyman_outlined,
    'devices' => Icons.devices_outlined,
    'api' => Icons.api_outlined,
    'extension' => Icons.extension_outlined,
    'rocket_launch' => Icons.rocket_launch_outlined,
    _ => Icons.circle_outlined,
  };
}
