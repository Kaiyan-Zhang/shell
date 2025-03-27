case $(type h5) in
   (*alias*) unalias h5;;
esac
h5(){
  if [ $(basename $(pwd)) != "fe_douyin_music" ]; then
      return;
  fi

  cd packages/fe_h5_music &&
  fnm use 16.18.1 &&
  emo run start:hydev
}

case $(type pc) in
   (*alias*) unalias pc;;
esac
pc(){
  if [ $(basename $(pwd)) != "fe_douyin_music" ]; then
      return;
  fi

  cd packages/music_storm_fe &&
  fnm use 18 &&
  emo run start
}
