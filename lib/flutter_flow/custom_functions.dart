import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

double progressCalculator(
  int totalPages,
  int currentPage,
) {
  // Add your function code here!
  return (currentPage / totalPages);
}

int subtractor(
  int subtractFrom,
  int subtractAmount,
) {
  // Add your function code here!
  return subtractFrom - subtractAmount;
}
