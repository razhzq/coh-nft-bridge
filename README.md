An NFT Bridge DAPP built with React and Solidity. 

How it works?
- 2 NFT Vault smart contract are deployed to 2 EVM chain for interchangeably bridging of NFT. 
- The source NFT is locked in the NFT bridge while an identical NFT that pointed to the same URI is minted at the destination chain bridge.
- then the newly minted bridged NFT is transferred to the receiver.
- The source NFT is locked until the bridged NFT is return back to the bridge NFT smart contract for it to be burn. 
