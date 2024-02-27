use starknet::ContractAddress;
use tale_weaver::models::avatar;


#[derive(Model, Copy, Drop, Serde)]
struct Seed{  
#[key] assistantId: felt252,
creator: ContractAddress,
titleA: felt252,
titleB: felt252,  
descriptionA: felt252,
descriptionB: felt252,
imageA: felt252,
imageB: felt252,
worldThemeId : felt252,
worldModeId : felt252,   
}

#[derive(Serde, Copy, Drop, Introspect)]
enum WorldModeID {
  None,
  Explorer,
  Survival
}

#[derive(Serde, Copy, Drop, Introspect)]
enum WorldThemeID{
  None,
  Anime,
  PixelArt,
  Scifi,
  Fantasy,
  Cartoon,
  Realistic,
  Kids
}

#[derive(Copy, Drop, Serde, Introspect)]
struct Avatars{  
avatar_a: u32,
avatar_b: u32,
avatar_c: u32,
avatar_d: u32
}