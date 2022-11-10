function droid
    doas systemctl start waydroid-container.service
    waydroid show-full-ui
    sleep 1m
    waydroid prop set persist.waydroid.fake_touch com.proximabeta.nikke
end
