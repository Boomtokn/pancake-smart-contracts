const config = {
  boomToken: {
    base: "0x02C9974C9f3E3D96E8acF8c8eb9C46e19125630a", // Boom on Base
    bsc: "0xcd6a51559254030ca30c2fb2cbdf5c492e8caf9c", // Boom on BSC (BEP-20)
    eth: "", // If deploying on Ethereum
  },
  liquidityPool: {
    base: "0x9090f998bCAB813B297992D01CdbFBB287954E73", // Uniswap Pool (Base)
    bsc: "0x9a705dd3de75d705585ecf73ad570b25bb632059", // PancakeSwap Pool (BSC)
    eth: "", // Uniswap Pool (Ethereum)
  },
  bridge: {
    cBridge: {
      baseToBsc: "", // Celer Bridge Contract for Base → BSC
      bscToBase: "", // Celer Bridge Contract for BSC → Base
    },
  },
  cakeToken: {
    97: "0xa35062141fa33bca92ce69fed37d0e8908868aae",
    56: "0x0e09fabb73bd3ade0a17ecc321fd13a19e81ce82",
  },
  masterChef: {
    97: "0x1d32c2945C8FDCBc7156c553B7cEa4325a17f4f9",
    56: "0x73feaa1eE314F8c655E354234017bE2193C9E24E",
  },
  sousChef: {
    97: "0xd3af5fe61dbaf8f73149bfcfa9fb653ff096029a",
    56: "0x6ab8463a4185b80905e05a9ff80a2d6b714b9e95",
  },
  lottery: {
    97: "0x99c2EcD51d52c036B00130d882Bc65f20Fdecf9f",
    56: "0x3C3f2049cc17C136a604bE23cF7E42745edf3b91",
  },
  multiCall: {
    97: "0x67ADCB4dF3931b0C5Da724058ADC2174a9844412",
    56: "0x1ee38d535d541c55c9dae27b12edf090c608e6fb",
  },
  bunnyFactoryV3: {
    97: "0x707CBF373175fdB601D34eeBF2Cf665d08f01148",
    56: "0xfa249Caa1D16f75fa159F7DFBAc0cC5EaB48CeFf",
  },
  claimRefund: {
    97: "",
    56: "0xf0e058a2c2c490fe4d8fecb9fd69f9b4f18a9140", // New claimRefund address
    old_56: "0xE7e53A7e9E3Cf6b840f167eF69519175c497e149", // Old claimRefund address (for reference)
  },
};

export default config;
