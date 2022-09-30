import 'package:sample_clean_arch/core/utils/log/log.dart';
import 'package:sample_clean_arch/external/dsb_core.dart';

import 'constants.dart';

class Tracking {
  static trackingSubmitInfo(bool success) {
    final data = {
      'success': success,
    };
    Log.d('trackingSubmitInfo $data');
    AppTracking.trackAmplitudeEvent(eventName: TrackingEventNames.SUBMIT_INFO_FORM, data: data);
  }
}
