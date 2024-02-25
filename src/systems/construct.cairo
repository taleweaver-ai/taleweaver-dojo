use tale_weaver::models::avatar;
use tale_weaver::models::seed:: {Seed, WorldModeID, WorldThemeID, Avatars};
// define the interface
#[starknet::interface]
trait ICreation<TContractState> {
    fn createSeed(self: @TContractState, titleP:felt252,userPromptAP:felt252, userPromptBP:felt252, imageAP:felt252,imageBP:felt252, introAP:felt252, introBP:felt252, assistentID:felt252, themeID:WorldThemeID, modeID:WorldModeID);
}

// dojo decorator
#[dojo::contract]
mod creation {    
    use starknet::{ContractAddress, get_caller_address};
    use tale_weaver::models::{avatar, seed::{Seed,WorldModeID, WorldThemeID,Avatars}};

    use super::ICreation; 

    #[external(v0)]
    impl CreationImpl of ICreation<ContractState> {
        // ContractState is defined by system decorator expansion
        fn createSeed(self: @ContractState, titleP:felt252,userPromptAP:felt252, userPromptBP:felt252, imageAP:felt252,imageBP:felt252, introAP:felt252, introBP:felt252, assistentID:felt252, themeID:WorldThemeID, modeID:WorldModeID){
            // Access the world dispatcher for reading.
            let world = self.world_dispatcher.read(); 
            // Get the address of the current caller, possibly the player's address.
            let player = get_caller_address();
            let mut key = world.uuid();
            let mut seedTmp = Seed {
                id: key,
                creator: player,
                title: titleP,
                userPromptA: userPromptAP,
                userPromptB: userPromptBP,
                imageA: imageAP,
                imageB: imageBP,
                introA: introAP,
                introB: introBP,
                assistentId: assistentID,
                worldModeId: modeID,
                worldThemeId: themeID
            };
            set!(world, (seedTmp));
            //emit!(world, SeedCreated { player});
        }
    }
 
}