## Foundry


## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```



### Deploy

```shell
$ forge script script/ethernaut/00.s.sol:AttackScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

Or setting up the account
```shell
cast wallet import obpd --interactive
Enter private key:
Enter password:
`obpd` keystore was saved successfully. Address: 0xadasfsgdryrdt
```
Then

```shell
$ forge script script/ethernaut/00.s.sol:AttackScript --rpc-url arb_sepolia --account obpd --broadcast
```


