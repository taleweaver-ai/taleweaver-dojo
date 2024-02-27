use tale_weaver::models::decision::{Decision};
use starknet::ContractAddress;
// define the interface
#[starknet::interface]
trait IPlay<TContractState> {
    fn playGame(self: @TContractState, assistantID:felt252, counterP:felt252, threadID:felt252, runID:felt252, cidAP:felt252,cidBP:felt252);
}

// dojo decorator
#[dojo::contract]
mod play {    
    use starknet::{ContractAddress, get_caller_address};
    use tale_weaver::models::{decision::{Decision}};

    use super::IPlay;

    #[external(v0)]
    impl PlayImpl of IPlay<ContractState> {
        fn playGame(self: @ContractState, assistantID:felt252, counterP:felt252, threadID:felt252, runID:felt252, cidAP:felt252,cidBP:felt252)
        {
            let world = self.world_dispatcher.read(); 
            // Get the address of the current caller, possibly the player's address.
            let playerD = get_caller_address();
            //let mut key = world.uuid();
            let mut decisionTmp = Decision{
                assistantId: assistantID,
                player: playerD,
                counter: counterP,
                threadId: threadID,
                runId: runID,
                cidA: cidAP,
                cidB: cidBP
            };
            set!(world, (decisionTmp));
        }
    }
 
}