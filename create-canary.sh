#!/bin/bash
LATEST_BLOCK_HASH=$(curl -sSL 'https://mempool.space/api/blocks/tip/hash')
CURRENT_DATE=$(date +'%F %H:%M')

MESSAGE_DYNAMIC="
# General information about me, Myzel394.

Timestamp: $CURRENT_DATE
Latest Bitcoin Block: $LATEST_BLOCK_HASH

"
MESSAGE_STATIC='
## Contact information

* E-Mail: github.7a2op(~at~)simplelogin(~dot~)co
* Matrix: matrix(~dot~)to/#/(~at~)myzel394:matrix.org (sometimes checked)
* Session: 05b8697371802f65887e0ed4d94883d144705e67a32ac6e0498041e8d34778f90c (rarely checked)

## Social Media

* Mastodon: Myzel394(~at~)mastodon.social
* GitHub: github(~dot~)com/Myzel394
* GitLab: gitlab(~dot~)com/Myzel394
* Reddit: www(~dot~)reddit(~dot~)com/user/Myzel394

## Donations

### Crypto

* Bitcoin: `bc1qw054829yj8e2u8glxnfcg3w22dkek577mjt5x6`
* Bitcoin Cash: `qr9s64vfqedvurfef9ykf7szchmt0xyvnga452fc8l`
* Ethereum: `0xbb5E631c03C65334d1d9EfBCD926DC1265CC20D7`
* Tether USD: `0xbb5E631c03C65334d1d9EfBCD926DC1265CC20D7`
* Monero: `83dm5wyuckG4aPbuMREHCEgLNwVn5i7963SKBhECaA7Ueb7DKBTy639R3QfMtb3DsFHMp8u6WGiCFgbdRDBBcz5sLduUtm8`
* Zcash: `t1ZfvNpzfdaW6csT9Kc7iJA7LUU3hmNj2sx`
* Litecoin: `LZayhTosZ9ToRvcbeR1gEDgb76Z7ZA2drN`
* Dash: `XcTkni8CVAXBcuc5VwvHmsYftVK4CPLetU`
* Avalanche: `0xbb5E631c03C65334d1d9EfBCD926DC1265CC20D7`
* XRP: `rNpfDm8UwDTumCebchBadjVW2FEPteFgNg`
* Solana: `2h6CB3hz5Vb2nYS1RQiXZ4aWTzc5frBPR7Sp1b4muFqb`
* ADA: `addr1q8vy2vcp6lacaw8lkc29gufuzajaytc5qc0c2mxlmw5lndxcg5esr4lm36u0lds523cnc9m96gh3gpsls4kdlkaflx6qf6qpvc`
* Dogecoin: `DUA4j7mVoc7Rvezu8YgeRKwxNuMzKeDoxD`
* Tron: `THWVLGhne5wDsGjd1CNenHDKQGzvGzrzLb`
* Polkadot: `1642iaR6AoKyM6qnnMHkfCRfRqRKJ2wC6Cm3UEWEFEz6EtZR`
* Cosmos: `cosmos1vt5z6rfj5sgnkdlddkuu8srw3xupyqxscva9hz`
* Algorand: `QBOQ6VSLMD77QEF33P5J3HKGOM5RZLNO6P5P3FTWCMQM3ORF6QY2W34KUI`
* Tezos: `tz1QUWNYuFqDibGCrwmkdaHSpTx3d6ZdxLMi`
* Litecoin: `LZayhTosZ9ToRvcbeR1gEDgb76Z7ZA2drN`
* Filecoin: `f1j6pm3chzhgadpf6iwmtux33jb5gccj5arkg4dsq`

## GPG Key

This message has been signed with my key. **Please save it as soon as you see this message**.
The key will expire at 2033-10-21 UTC. **Do not trust this key after this date.**

Key Fingerprint: `7D05 2F27 347C 2AAC D815  D01D CD13 4742 C1E9 7959`
'
MESSAGE="$MESSAGE_DYNAMIC$MESSAGE_STATIC"

HASH_STATIC=$(echo "$MESSAGE_STATIC" | sha512sum | cut --fields=1 --delimiter=" ")

echo "The hash of the static value is: $HASH_STATIC - Would you like to continue? [y] "

read continue

if [[ $continue != "y" ]]; then
    echo "Not yes; aborting"
    exit 1
fi

echo "$MESSAGE" | gpg --clearsign > README.md

