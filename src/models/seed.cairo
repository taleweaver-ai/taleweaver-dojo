use starknet::ContractAddress;
use tale_weaver::models::avatar;


#[derive(Model, Copy, Drop, Serde)]
struct Seed{  
#[key] id:u32,
creator: ContractAddress,
title: felt252,   
userPromptA: felt252,
userPromptB: felt252,
imageA: felt252,
imageB: felt252,
introA: felt252,
introB: felt252,
assistentId: felt252,
worldThemeId : WorldThemeID,
worldModeId : WorldModeID,   
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