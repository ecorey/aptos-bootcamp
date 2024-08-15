module hw11::hw11 {

    use std::signer;
    use aptos_token_objects::collection;
    use aptos_token_objects::royalty::{Self, Royalty};

    use std::string::String;
    use std::option::{Self, Option};



    struct Collection has key {
        creator: address,
        description: String,
        max_supply: u64,
        name: String,
        royalty_percentage: u64,
        uri: String,
    }


    public entry fun create_collection(creator: &signer, name: String, description: String, royalty_percentage: u64, uri: String) {

        let max_supply = 100;

        let royalty = option::some(royalty::create(royalty_percentage, 100, signer::address_of(creator)));

        collection::create_fixed_collection(
            creator,
            description, 
            max_supply,
            name, 
            royalty,
            uri,
        );

    }



    
}
