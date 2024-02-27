use tale_weaver::models::game::{Game};
use tale_weaver::models::step::{Step};
use starknet::ContractAddress;
// define the interface
#[starknet::interface]
trait IPlay<TContractState> {
    fn playGame(self: @TContractState, ID:felt252, counterP:felt252, threadID:felt252, decisionAP:felt252, decisionBP:felt252, imageAP: felt252, imageBP:felt252, seedID:felt252, avatarID:felt252, consequenceAP: felt252, consequenceBP: felt252);
}

// dojo decorator
#[dojo::contract]
mod play {    
    use starknet::{ContractAddress, get_caller_address};
    use tale_weaver::models::{step::{Step}, game::{Game}};

    use tale_weaver::models::{avatar::{Avatar}};

    use super::IPlay;

    #[external(v0)]
    impl PlyaImpl of IPlay<ContractState> {
        fn playGame(self: @ContractState, ID:felt252, counterP:felt252, threadID:felt252, decisionAP:felt252, decisionBP:felt252, imageAP: felt252, imageBP:felt252, seedID:felt252, avatarID:felt252, consequenceAP: felt252, consequenceBP: felt252)
        {
            let world = self.world_dispatcher.read(); 
            // Get the address of the current caller, possibly the player's address.
            let playerD = get_caller_address();
            //let mut key = world.uuid();
            let mut stepTmp = Step {
                assistantId: ID,
                player: playerD,
                counter: counterP,
                threadId: threadID,
                decisionA: decisionAP,
                decisionB: decisionBP,
                imageA: imageAP,
                imageB: imageBP,
                consequenceA: consequenceAP,
                consequenceB: consequenceBP
            };
            set!(world, (stepTmp));
        }
    }
 
}