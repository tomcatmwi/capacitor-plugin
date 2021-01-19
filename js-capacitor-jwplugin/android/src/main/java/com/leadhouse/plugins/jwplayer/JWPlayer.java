package com.leadhouse.plugins.jwplayer;

import com.getcapacitor.JSObject;
import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;

import android.content.Context;
import android.app.AlertDialog;
import android.content.DialogInterface;

import androidx.appcompat.app.AppCompatActivity;
import android.app.Fragment;
import android.app.AlertDialog.Builder;
import android.app.Activity;

@NativePlugin
public class JWPlayer extends Plugin {

    // Shows an alert with an OK button
    private void showAlert(String title, String message) {
        final AppCompatActivity context = this.getActivity();

        new AlertDialog.Builder(context).setTitle(title).setMessage(message)
                .setPositiveButton("OK", new AlertDialog.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int which) {
                        dialogInterface.dismiss();
                    }
                }).create().show();
    }

    //  Tests the plugin
    @PluginMethod
    public void test(PluginCall call) {
        this.showAlert("Hey there", "This is the Android plugin doing Android stuff");
        call.success();
    }

}
