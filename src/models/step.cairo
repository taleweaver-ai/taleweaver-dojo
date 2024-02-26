#[derive(Model, Copy, Drop, Serde)]
struct Step{  
#[key] id: u32,
threadId: u64,
decisionA: felt252,
decisionB: felt252,
imageA: felt252,
imageB: felt252,
#[key]seedId:u64,
avatarId: u64,
consequenceA : felt252,
consequenceB : felt252
}