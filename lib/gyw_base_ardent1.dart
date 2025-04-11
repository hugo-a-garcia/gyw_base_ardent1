/// This library provides a Flutter interface with aRdent glasses developed.
///
/// The aRdent smart glasses are developed by Get Your Way. They can be seen
/// as a Head-Up Display (HUD) on which are shown drawings (icons, texts, ...).
/// This library can be used to control the display.
// ignore_for_file: directives_ordering

library;

export 'src/services/providers/bluetooth_providers.dart';
export 'src/services/device_service.dart';
export 'src/model/drawings.dart'
    show
        BlankScreen,
        GYWDrawing,
        IconDrawing,
        TextDrawing,
        RectangleDrawing,
        SpinnerDrawing,
        AnimationTimingFunction;
export 'src/model/drawing_parts/fonts.dart' show GYWFont;
export 'src/model/drawing_parts/icons.dart' show GYWIcon;

//
// The following should and must not be exported.
// Only Services and Providers should be exported.
//
// export 'src/device/bt_device.dart' show GYWBtDevice;
// export 'src/device/exceptions.dart' show GYWException, GYWStatusException;
// export 'src/model//drawing_parts/screen.dart' show GYWScreenParameters;
