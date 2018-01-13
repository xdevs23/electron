#include "atom/browser/api/atom_api_power_monitor.h"

#include <map>

#import <Cocoa/Cocoa.h>

#include "atom/browser/mac/dict_util.h"
#include "atom/common/native_mate_converters/value_converter.h"
#include "atom/common/native_mate_converters/gurl_converter.h"
#include "base/strings/sys_string_conversions.h"
#include "base/values.h"
#include "net/base/mac/url_conversions.h"

namespace atom {

namespace api {

void PowerMonitor::OnPowerStateChange(bool on_battery_power) {
  if (on_battery_power)
    Emit("on-battery");
  else
    Emit("on-ac");
}

static void PowerSourceChanged(void * context) {
  AppDelegate *self = (__bridge AppDelegate *)context;
  [self updateStatusItem];
}

}  // namespace api