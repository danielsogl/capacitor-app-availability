package com.danielsogl.capacitor-app-availability;

import com.getcapacitor.JSObject;
import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageInfo;

@NativePlugin()
public class AppAvailability extends Plugin {

    @PluginMethod()
    public void check(PluginCall call) {
        String packageName = call.getString("sheme");

        if(packageName != null) {
            Context context = bridge.getContext();
            PackageManager pm = context.getPackageManager();

            boolean isInstalled = isPackageInstalled(packageName, pm);

            JSObject ret = new JSObject();
            ret.put("value", isInstalled);
            call.resolve(ret);
        } else {
            call.error("Property 'sheme' is required");
        }
    }

    @PluginMethod()
    public void open(PluginCall call) {
        String packageName = call.getString("sheme");
        if(packageName != null) {
            Context context = bridge.getContext();
            PackageManager pm = context.getPackageManager();
            Intent launchIntent = pm.getLaunchIntentForPackage(packageName);
            context.startActivity(launchIntent);
            call.resolve();
        } else {
            call.error("Property 'sheme' is required");
        }
    }

    private boolean isPackageInstalled(String packageName, PackageManager packageManager) {
        try {
            packageManager.getPackageInfo(packageName, 0);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }
}
