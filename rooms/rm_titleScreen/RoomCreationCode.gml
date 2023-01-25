// create a music background

switch (room) {
    case rm_titleScreen: {
        audio_stop_all();
        audio_play_sound(snd_music_background_opening, 0, true);
    }; break;
}