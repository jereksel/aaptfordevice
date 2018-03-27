package com.jereksel.myapplication

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.jereksel.aapt.AAPT
import java.io.File
import java.nio.file.Files

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val binary = AAPT.getAapt(this)

        val process = ProcessBuilder().command(binary.absolutePath, "v").start()
        val input = process.inputStream.bufferedReader().readText()
        process.waitFor()
        Toast.makeText(this, input, Toast.LENGTH_LONG).show()
    }
}
