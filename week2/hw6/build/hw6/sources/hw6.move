module basic_address::hw6 {

    struct TokenAsset has key {
        value: u64,
    }

    


    public entry fun create_Asset(account : &signer) {
    // create a TokenAsset 
    let asset = create();


    // move the TokenAsset to the account address 
    move_to(account, asset);    

    }


    fun create() : TokenAsset {

    // return a Token Asset with 0 value
    let asset = TokenAsset {
        value: 0,
    };

    asset

    }



}