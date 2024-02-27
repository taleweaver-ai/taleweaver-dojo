use tale_weaver::models::avatar;
use tale_weaver::models::seed:: {Seed, WorldModeID, WorldThemeID, Avatars};
// define the interface
#[starknet::interface]
trait IConstruct<TContractState> {
    fn createSeed(self: @TContractState, assistantID:felt252, titleAP:felt252,titleBP:felt252, descriptionAP:felt252, descriptionBP:felt252, imageAP:felt252,imageBP:felt252, introAP:felt252, introBP:felt252, assistentIDA:felt252, assistentIDB:felt252, themeID:felt252, modeID:felt252);
}

// dojo decorator
#[dojo::contract]
mod construct {    
    use starknet::{ContractAddress, get_caller_address};
    use tale_weaver::models::{avatar, seed::{Seed,WorldModeID, WorldThemeID,Avatars}};

    use super::IConstruct; 

    #[external(v0)]
    impl ConstructImpl of IConstruct<ContractState> {
        fn createSeed(self: @ContractState, assistantID:felt252, titleAP:felt252,titleBP:felt252, descriptionAP:felt252, descriptionBP:felt252, imageAP:felt252,imageBP:felt252, introAP:felt252, introBP:felt252, assistentIDA:felt252, assistentIDB:felt252, themeID:felt252, modeID:felt252){
            
            let world = self.world_dispatcher.read(); 
            
            let player = get_caller_address();
            
            let mut seedTmp = Seed {
                assistantId: assistantID,
                creator: player,
                titleA: titleAP,
                titleB: titleBP,
                descriptionA: descriptionAP,
                descriptionB: descriptionBP,
                imageA: imageAP,
                imageB: imageBP,
                worldModeId: modeID,
                worldThemeId: themeID
            };
            set!(world, (seedTmp));
        }
    }
 
}