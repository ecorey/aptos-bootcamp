module named_add::hw9 {


    use std::signer;
    use std::string::{Self, String};
    use aptos_framework::object;


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

        move_to(&object_signer, example_object );

    }

}