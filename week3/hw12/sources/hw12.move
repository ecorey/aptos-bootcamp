module hw12::hw12 {

    use std::signer;
    use aptos_token_objects::collection;
    use aptos_token_objects::token;
    use std::string::String;
    use std::option::{Self, Option};


    struct Collection has key {
        creator: address,
        description: String,
        max_supply: u64,
        name: String,
        uri: String,
    }

    public entry fun create_collection(creator: &signer, name: String, description: String, uri: String) {

        let max_supply = 100;

        let royalty = option::none<aptos_token_objects::royalty::Royalty>();


        collection::create_fixed_collection (
            creator, 
            description,
            max_supply,
            name,
            royalty,
            uri,
        );

    }


    public entry fun create_nft_in_collection(
        creator: &signer,
        collection_name: String,
        token_name: String,
        token_description: String,
        token_uri: String,
    ) {
        let royalty = option::none<aptos_token_objects::royalty::Royalty>();

        token::create_named_token(
            creator,
            collection_name,
            token_description,
            token_name,
            royalty,
            token_uri,
        );

    }





    // init




   








}