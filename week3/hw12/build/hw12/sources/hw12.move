module hw12::hw12 {

    use std::signer;
    use aptos_token_objects::collection;
    use aptos_token_objects::token;
    use std::string::{Self, String};
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
    fun init_module(creator: &signer) {
        
        let collection_name = string::utf8(b"Collection");
        let collection_description = string::utf8(b"Collection of NFTs");
        let collection_uri = string::utf8(b"https://example.com/collection");

        create_collection(creator, collection_name, collection_description, collection_uri);

        let token_name = string::utf8(b"Token");
        let token_description = string::utf8(b"Token");
        let token_uri = string::utf8(b"https://example.com/token");


        create_nft_in_collection(creator, collection_name, token_name, token_description, token_uri);

    }



   








}