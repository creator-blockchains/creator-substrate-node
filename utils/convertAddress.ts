const { u8aToHex } = require('@polkadot/util');
const { evmToAddress, cryptoWaitReady } = require('@polkadot/util-crypto');

const init = async () => {
    await cryptoWaitReady();
    const args = process.argv.slice(2);

    console.log('evm', evmToAddress(args[0] || '0x833eB3EC76F9B95FcD4479F75A3b2c976f56846a', 42, 'blake2'));
}

init()