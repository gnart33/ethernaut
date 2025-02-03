## Foundry


## Documentation


## Usage

### Setup wallet and RPC endpoint

```shell
cast wallet import obpd --interactive
Enter private key:
Enter password:
`obpd` keystore was saved successfully. Address: 0x...
```

```shell
cp .env.example .env 
```

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
$ forge script script/ethernaut/00.s.sol:AttackScript --rpc-url arb_sepolia --account obpd --broadcast
```


