Remember that the syntax, commands and the framework keeps on changing, so always follow documentation 


truffle unbox not working, so will use truffle init to initialize project structure
 

 

1) Install truffle using npm 
   Install Ganache for setting up a local blockchain Network (Provides free 10 accounts) 
    
   truffle unbox pet-shop box or git clone if unbox not working 

2) To connect truffle backend project with Ganache network , change truffle-config.js file as for example:

  module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,         // host & port should match with ganachje rpc server 
      network_id: "5777" // Match any netwrok id
    },
    develop: {
      port: 8545
    }
  }
};

To connect truffle frontend project (client side) with Ganache ,  localhost:7545 is the same server where local blockchainnetwork is running


initWeb3: function() {
    if (typeof web3 !== 'undefined') {
      // If a web3 instance is already provided by Meta Mask.
      App.web3Provider = web3.currentProvider;
      web3 = new Web3(web3.currentProvider);
    } else {
      // Specify default instance if no web3 instance provided
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
      web3 = new Web3(App.web3Provider);
    }
    return App.initContract();
  },


3) After writing smart contracts and migration/deployment files

   Open console of truffle -> through  [ truffle develop ] command
   Once the console opens, run [ truffle migrate -- network development ] to migrate all changes to the local blockchain network 
   
   Now, you can use console to access functions and state variables of your smart contracts

   Note that depending on the type of network on which blockchain network is running, you have to run [ truffle migrate -- network develpment ]instead of [ truffle migrate ] 
   otherwise the smart contracts will  get migrated to a different network other than that defined in truffle -config.js file

4) Now its time to test our smart contracts through Mocha and Chai 

   inside the test directory, write js test files 

   And then in the truffle dev console run [ truffle test ]

5) Now quit the truffle console and run [ npm run dev ] to start project in a browser 

6) Now its time to connect browser with ganache's blockchain network through Metamask 

   First of all add Ganache's rpc server manually in Metamask 
   Then import Ganache's account and connect it to the site i.e. localhost:3000
