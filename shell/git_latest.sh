git for-each-ref --sort='-committerdate' \
  --format='%(refname:short)' \
  --count=1 \
  refs/heads
