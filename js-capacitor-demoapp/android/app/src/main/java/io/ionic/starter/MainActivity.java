package com.leadhouse.plugins.jwplayer;

// Other imports...
import com.leadhouse.plugins.jwplayer.JWPlayer;
import com.getcapacitor.BridgeActivity;
import android.os.Bundle;
import com.getcapacitor.Plugin;
import java.util.ArrayList;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

public class MainActivity extends BridgeActivity {
  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    // Initializes the Bridge
    this.init(savedInstanceState, new ArrayList<Class<? extends Plugin>>() {
      {
        // Additional plugins you've installed go here
        // Ex: add(TotallyAwesomePlugin.class);
        add(JWPlayer.class);
      }
    });
  }
}