
library flutter_web_frame;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'frame_content.dart';
import 'media_query_observer.dart';



class FlutterWebFrame extends StatefulWidget {
  /// If not [enabled], the [child] is used directly.
  final bool enabled;

  /// The previewed widget.
  ///
  /// It is common to give the root application widget.
  final WidgetBuilder builder;

  /// Background color in white space
  final Color? backgroundColor;

  /// Maximum size
  final Size maximumSize;

  /// Clip behavior
  final Clip clipBehavior;

  const FlutterWebFrame({
    Key? key,
    required this.builder,
    this.enabled = true,
    this.backgroundColor,
    required this.maximumSize,
    this.clipBehavior = Clip.none,
  }) : super(key: key);

  /// A global builder that should be inserted into [WidgetApp]'s builder
  /// to simulated the simulated device screen and platform properties.
  static Widget appBuilder(
      BuildContext context,
      Widget? widget,
      ) {
    if (!_isEnabled(context)) {
      return widget ?? SizedBox();
    }

    if (!_isEnabled(context)) return widget ?? SizedBox();

    return MediaQuery(
      data: _mediaQuery(context),
      child: Theme(
        data: Theme.of(context).copyWith(
          visualDensity: _isEnabled(context) ? VisualDensity.standard : null,
        ),
        child: widget ?? SizedBox(),
      ),
    );
  }

  static MediaQueryData _mediaQuery(BuildContext context) {
    return FrameContent.mediaQuery(
      context,
      context.findAncestorStateOfType<_FlutterWebFrameState>()?.widget.maximumSize ?? Size(375.0, 812.0),
    );
  }

  static bool _isEnabled(BuildContext context) {
    final state = context.findAncestorStateOfType<_FlutterWebFrameState>();
    return state != null && state.widget.enabled;
  }

  @override
  _FlutterWebFrameState createState() => _FlutterWebFrameState();
}

class _FlutterWebFrameState extends State<FlutterWebFrame> {
  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return Builder(
        builder: widget.builder,
      );
    }

    return Container(
      color:  Colors.black38 ?? Colors.black38,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: MediaQueryObserver(
          child: widget.enabled ? Builder(builder: _buildPreview) : Builder(builder: widget.builder),
        ),
      ),
    );
  }

  Widget _buildPreview(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: RepaintBoundary(
        child: FrameContent(
          size: widget.maximumSize,
          clipBehavior: widget.clipBehavior,
          child: Builder(builder: widget.builder),
          headerSection: Container(
              // color: Colors.red,

            )

        ),
      ),
    );
  }
}