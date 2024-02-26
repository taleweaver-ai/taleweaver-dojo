use tale_weaver::models::game::{Game};
use tale_weaver::models::step::{Step};
use starknet::ContractAddress;
// define the interface
#[starknet::interface]
trait ICreation<TContractState> {
    fn playGame(self: @TContractState, ID:u32, threadID:u64, decisionAP:felt252, decisionBP:felt252, imageAP: felt252, imageBP:felt252, seedID:u64, avatarID:u64,consequenceAP: felt252, consequenceBP: felt252);
}

// dojo decorator
#[dojo::contract]
mod creation {    
    use starknet::{ContractAddress, get_caller_address};
    use tale_weaver::models::{step::{Step}, game::{Game}};

    use tale_weaver::models::{avatar::{Avatar}};

    use super::ICreation;

    #[external(v0)]
    impl CreationImpl of ICreation<ContractState> {
        fn playGame(self: @ContractState, ID:u32, threadID:u64, decisionAP:felt252, decisionBP:felt252, imageAP: felt252, imageBP:felt252, seedID:u64, avatarID:u64, consequenceAP: felt252, consequenceBP: felt252)
        {
            let world = self.world_dispatcher.read(); 
            // Get the address of the current caller, possibly the player's address.
            let player = get_caller_address();
            //let mut key = world.uuid();
            let mut stepTmp = Step {
                id: ID,
                threadId: threadID,
                decisionA: decisionAP,
                decisionB: decisionBP,
                imageA: imageAP,
                imageB: imageBP,
                seedId: seedID,
                avatarId: avatarID,
                consequenceA: consequenceAP,
                consequenceB: consequenceBP
            };
            set!(world, (stepTmp));

        }
    }
 
}