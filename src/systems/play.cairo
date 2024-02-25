use tale_weaver::models::game::{Game};
use tale_weaver::models::step::{Step};
use starknet::ContractAddress;
// define the interface
#[starknet::interface]
trait ICreation<TContractState> {
    fn startGame(self: @TContractState, idK: u32, seedID:u32, playerID:ContractAddress, avatarID:u32);
    fn continueGame(self: @TContractState, gameID:u32, seedID:u32, chooseP: felt252, imageP:felt252);
    fn startFromPointGame(self: @TContractState, gameID:u32, step:u64);
    fn playGame(self: @TContractState, ID:u32, threadID:u64, decisionAP:felt252, decisionBP:felt252, imageAP: felt252, imageBP:felt252, seedID:u64, avatarID:u64, counterP:u64, consequenceAP: felt252, consequenceBP: felt252);
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
        // ContractState is defined by system decorator expansion
        fn startGame(self: @ContractState, idK: u32, seedID:u32, playerID:ContractAddress, avatarID:u32) {
                       
        }

        fn continueGame(self: @ContractState, gameID:u32, seedID:u32, chooseP: felt252, imageP:felt252) {
            
        }

        fn startFromPointGame(self: @ContractState, gameID:u32, step:u64)
        {

        }

        fn playGame(self: @ContractState, ID:u32, threadID:u64, decisionAP:felt252, decisionBP:felt252, imageAP: felt252, imageBP:felt252, seedID:u64, avatarID:u64, counterP:u64, consequenceAP: felt252, consequenceBP: felt252)
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
                counter: counterP,
                consequenceA: consequenceAP,
                consequenceB: consequenceBP
            };
            set!(world, (stepTmp));

        }
    }
 
}