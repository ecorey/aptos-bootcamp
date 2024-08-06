module basic_address::sandbox {


    use std::signer;
    use std::debug;




    // Asset struct should have 2 fields 1. an unsigned 8 bit integer 
    // named flag 2. an unsigned 64 bit integer called value

    struct Asset {
        flag: u8,
        value: u64,
    }

    


    fun create(flag: u8, value: u64 ) : Asset {

        let asset = Asset {
            flag,
            value,
        }

        asset

    }








}