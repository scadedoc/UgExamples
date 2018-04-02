package org.swift.testfoundation;

import android.content.Intent;
import android.content.res.AssetManager;
import android.app.Activity;
import android.view.View;
import android.view.Window;
import android.view.Surface;
import android.os.Bundle;
import android.view.WindowManager;
import android.content.res.Configuration;
import android.widget.LinearLayout;
import android.widget.Button;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.LinkedList;
import org.swift.swiftfoundation.SwiftFoundation;


public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        System.loadLibrary("gnustl_shared");

        System.loadLibrary("scadeicu");
        System.loadLibrary("objc");
        System.loadLibrary("Foundation");
        System.loadLibrary("swiftCore");
        System.loadLibrary("swiftSwiftOnoneSupport");
        System.loadLibrary("swiftGlibc");
        System.loadLibrary("swiftObjectiveC");
        System.loadLibrary("swiftJNI");
        System.loadLibrary("swiftSwiftFoundation");
        System.loadLibrary("swiftFoundation");
        System.loadLibrary("swiftSwiftXCTest");

        System.loadLibrary("TestFoundation");
        System.loadLibrary("TestFoundationJNI");

        LinearLayout layout = new LinearLayout(this);
        Button exitButton = new Button(this);
        exitButton.setText("Exit");
        exitButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                finish();
            }
        });
        layout.addView(exitButton);

        setContentView(layout);

        try {
            SwiftFoundation.Initialize(this, true);
            launchTestFoundation();
        }
        catch(Exception err) {
            android.util.Log.e("TestFoundation", "ERROR: " + err.toString());
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    private native void launchTestFoundation();
}

