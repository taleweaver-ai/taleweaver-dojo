use tale_weaver::models::avatar:: {Avatar};
// define the interface
#[starknet::interface]
trait ICreation<TContractState> {
    fn createAvatar(self: @TContractState, nameP:felt252, aliasP:felt252, descriptionAP:felt252, descriptionBP:felt252, seedID:u32);
}

// dojo decorator
#[dojo::contract]
mod creation {    
    use starknet::{ContractAddress, get_caller_address};
    use tale_weaver::models::{avatar::{Avatar}};

    use super::ICreation; 

    #[external(v0)]
    impl CreationImpl of ICreation<ContractState> {
        // ContractState is defined by system decorator expansion
        fn createAvatar(self: @ContractState, nameP:felt252, aliasP:felt252, descriptionAP:felt252, descriptionBP:felt252, seedID:u32) {
            // Access the world dispatcher for reading.
            let world = self.world_dispatcher.read(); 
            // Get the address of the current caller, possibly the player's address.
            let player = get_caller_address();
            let mut key = world.uuid();
            let mut avatarTmp = Avatar {
                id: key,
                creator: player,
                name:nameP,
                alias: aliasP,
                descriptionA:descriptionAP,
                descriptionB:descriptionBP,
                seedId: seedID
            };
            set!(world, (avatarTmp));
        }
    } 
}