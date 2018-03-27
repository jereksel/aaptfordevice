package com.jereksel.aapt;

import android.content.Context;

import java.io.File;

public class AAPT {

    public static File getAapt(Context context) {
        return new File(new File(context.getApplicationInfo().dataDir, "lib"), "libaaptcomplete.so");
    }

}
