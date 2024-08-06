module basic_address::sandbox {


    use std::signer;
    




    // Asset struct should have 2 fields 1. an unsigned 8 bit integer 
    // named flag 2. an unsigned 64 bit integer called value

    struct Asset has key {
        flag: u8,
        value: u64,
    }

    


    fun create(flag: u8, value: u64) : Asset {

        let asset = Asset {
            flag,
            value,
        };

        asset

    }


    // The build asset function should call the the create function , 
    // and only allow the creation of assets where the value is greater 
    // than 100, and the flag is 0 or 1. 
    // The function should throw an error if those requirements 
    // are not met, in either case giving an error code of 17. 
    // You do not need to do anything with the asset that was created.


    const ERROR_CODE: u64 = 17;

    public entry fun build_asset(flag: u8, value: u64, account: &signer)  {

        if ( (value > 100) && ( flag == 0 || flag == 1)  ) {
           let asset = create(flag, value);
           move_to(account, asset);
           
        }

        else {
            assert!( ((value <= 100) && ( flag != 0 || flag != 1)), ERROR_CODE);
        }


    }





}