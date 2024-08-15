module named_add::hw9 {


    use std::signer;
    use std::string::{Self, String};
    use aptos_framework::object;
    use aptos_framework::event;


    

    #[event]
    struct SampleObjectEvent has store, drop {
        my_object: address,
    }


    struct ExampleObject has key {
        name: String,
        balance: u64,
    }


    public entry fun create_sample_object(caller: &signer) {

        let caller_address = signer::address_of(caller);

        let constructor_ref = object::create_object(caller_address);

        let object_signer = object::generate_signer(&constructor_ref);

        let example_object = ExampleObject {
            name: string::utf8(b"object 1"),
            balance: 100,
        };

        event::emit( SampleObjectEvent {
            my_object: caller_address,   
        });

        move_to(&object_signer, example_object );

    }





    const NAMED_OBJECT: vector<u8> = b"namedObject";


    public entry fun create_sample_named_object(caller: &signer) {


        let constructor_ref = object::create_named_object(caller, NAMED_OBJECT);


        let object_signer = object::generate_signer(&constructor_ref);


        let example_named_object = ExampleObject {
            name: string::utf8(b"object 2"),
            balance: 200,
        };

    
        move_to(&object_signer, example_named_object );

    }


    #[view]
    fun has_named_object(creator: address) : address {
        let named_object_address = object::create_object_address(&creator, NAMED_OBJECT);
        named_object_address
    }









}