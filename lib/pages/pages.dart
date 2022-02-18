import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:iotapps/bloc/blocs.dart';
import 'package:iotapps/pages/clock.dart';
import 'package:iotapps/pages/widgets/graph.dart';
import 'package:iotapps/shared/shared.dart';
import 'package:iotapps/pages/start/1.dart';
import 'package:iotapps/pages/start/2.dart';
import 'package:iotapps/pages/start/3.dart';
import 'package:iotapps/services/services.dart';

import 'package:iotapps/models/models.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flushbar/flushbar.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'package:google_fonts/google_fonts.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:volume/volume.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:provider/provider.dart';

import 'package:iotapps/pages/bar/models/data_consumption.dart';
import 'package:iotapps/pages/bar/widgets/data_cart.dart';

part 'splash_page.dart';
part 'sign_in_page.dart';

part 'start.dart';

part 'wrapper.dart';
part 'menu_page.dart';

part 'edit_profile.dart';
