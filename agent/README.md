# AGENT SSH - GPG

```shell
$ pacman -S keychain

# Add agent ssh to zshrc or bashrc
eval `keychain --eval --agents ssh ~/.ssh/PRIVATE_KEY_1 ~/.ssh/PRIVATE_KEY_2`
```
